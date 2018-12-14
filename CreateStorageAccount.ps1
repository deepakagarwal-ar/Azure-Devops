# Create a new resource group.

# login to the AzureRMAccount
login-azureRmaccount

$resourceGroupName = Get-AzureRmResourceGroup | select ResourceGroupName


$testResourceGroupName = "testResourceGroup"
$defaultLocation = "eastus"

if($resourceGroupName.ResourceGroupName -ne $testResourceGroupName){
    New-AzureRmResourceGroup -Name $resourceGroupName.ResourceGroupName -Location $defaultLocation 
}

$location = Get-AzureRmResourceGroup | select Location

$storageAccount = Get-AzureRmStorageAccount | select StorageAccountName 
$skuName = "Standard_LRS"

$storageAccountName = $args[0] 

try{
    New-AzureStorageAccount -StorageAccountName $Name -Location $Location.Location `
    -SkuName $skuName
     Write-Host "Creating Storage Account $storageAccountName"
}
catch {
    Write-Host "Provide different storage name = $storageAccountName"
}
   


