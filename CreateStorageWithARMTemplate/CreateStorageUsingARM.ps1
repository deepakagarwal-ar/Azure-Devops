#Login-AzureRmAccount
New-AzureRmResourceGroup -Name DeepakStorageARM -Location 'east us' -Force



$TemplateObject = @{};
$TemplateObject.Add('storageAccountName', 'teststorage2015511');


New-AzureRmResourceGroupDeployment -Name storageDeployment -ResourceGroupName DeepakStorageARM -TemplateFile 'C:\PowerShellLearning\StorageARM.json' -TemplateParameterObject $TemplateObject -Force


