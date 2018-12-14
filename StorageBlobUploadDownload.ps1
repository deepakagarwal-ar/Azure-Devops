#Login-AzureRmAccount
$resourceGroup = "testResourceGroup"
$storageAccountName = "teststorageaaccount"

$storageAccount = Get-AzureRmStorageAccount | where {$_.StorageAccountName -eq "teststorageaaccount"}

$key1 = (Get-AzureRmStorageAccountKey -ResourceGroupName $storageAccount.ResourceGroupName -Name $storageAccount.StorageAccountName).GetValue(0)

$storageContext = New-AzureStorageContext -StorageAccountName $storageAccount.StorageAccountName -StorageAccountKey $key1.Value


$fileName = "test.jpg"
$filePath = "C:\Temp\" + $fileName

Set-AzureStorageBlobContent -Container "demo"  -File $filePath -Blob $fileName -Force -BlobType Block -Context $storageContext

$destPath = "C:\Downloads\"

Get-AzureStorageBlobContent -Blob $fileName -Container "demo" -Destination $destPath -Context $storageContext