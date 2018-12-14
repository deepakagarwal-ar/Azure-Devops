using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Host;
using System.Collections.Generic;
using System;

namespace TestFunction
{
    public static class FizzBuzzFunc
    {
        [FunctionName("FizzBuzzFunction")]
        public static async Task<HttpResponseMessage> Run([HttpTrigger(AuthorizationLevel.Function, "get", "post", Route = null)]HttpRequestMessage req, TraceWriter log)
        {
            log.Info("C# HTTP trigger function processed a request.");

            string start = req.GetQueryNameValuePairs()
               .FirstOrDefault(q => string.Compare(q.Key, "start", true) == 0)
               .Value;

            string stop = req.GetQueryNameValuePairs()
                .FirstOrDefault(q => string.Compare(q.Key, "stop", true) == 0)
                .Value;

            string number = req.GetQueryNameValuePairs()
                .FirstOrDefault(q => string.Compare(q.Key, "number", true) == 0)
                .Value;

            // Get request body
            dynamic data = await req.Content.ReadAsAsync<object>();

            // Set name to query string or body data
            start = start ?? data?.start.Value;
            stop = stop ?? data?.stop.Value;
            number = number ?? data?.number.Value;

            var result = GenerateFizzBuzzString(Convert.ToInt16(start), Convert.ToInt16(stop), Convert.ToInt16(number));

            return start == null || stop == null || number == null
                ? req.CreateResponse(HttpStatusCode.BadRequest, "Please pass a name on the query string or in the request body")
                : req.CreateResponse(HttpStatusCode.OK, new
                {
                    number = result
                });
        }

        private static List<string> GenerateFizzBuzzString(int start, int stop, int number)
        {
            var startNumber = start;
            var stopNumber = stop;
            var numberOfNumber = number;
            var list = new List<string>();
            string fizzBuzzLine = string.Empty;

            for (int i = startNumber; i <= stopNumber; i++)
            {
                bool isdivided = false;

                if (i % 15 == 0)
                {
                    fizzBuzzLine += "FizzBuzz ";
                    isdivided = true;
                }
                else if (i % 5 == 0)
                {
                    fizzBuzzLine += "Buzz ";
                    isdivided = true;
                }
                else if (i % 3 == 0)
                {
                    fizzBuzzLine += "Fizz ";
                    isdivided = true;
                }

                if (!isdivided)
                {
                    fizzBuzzLine += i.ToString() + " ";
                }

                if (i % numberOfNumber == 0)
                {
                    list.Add(fizzBuzzLine);
                    fizzBuzzLine = string.Empty;
                }
            }

            return list;
        }
    }
}
