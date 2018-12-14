$url = "https://cloud.addictivetips.com/wp-content/uploads/2018/03/Lines-In-The-Sky.jpg"
$output = "C:\PowerShellLearning\test.jpg"
$start_time = Get-Date

$wc = new-object System.Net.WebClient
$wc.DownloadFile($url, $output)


Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"