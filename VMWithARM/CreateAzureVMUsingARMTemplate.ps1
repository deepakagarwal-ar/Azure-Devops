#Login-AzureRmAccount


New-AzureRmResourceGroup -Name DeepakARM -Location 'east us' -Force


$Deployment = @{};

$Deployment.Add('Name', 'VMDeployment');

$Deployment.Add('ResourceGroupName', 'DeepakARM');
$Deployment.Add('Mode', 'Complete');
$Deployment.Add('TemplateFile', 'C:\PowerShellLearning\AzureDeploy.json');

$TemplateObject = @{};
$TemplateObject.Add('newStorageAccountName', 'testVMCreateByARM12345');
$TemplateObject.Add('vmName', 'deepakVM');
$TemplateObject.Add('adminUsername', 'deepak');
$TemplateObject.Add('adminPassword', 'deepak@123456');

$Deployment.Add('TemplateParameterObject', $TemplateObject);


 

New-AzureRmResourceGroupDeployment -Name VMDeployment -ResourceGroupName DeepakARM -TemplateFile 'C:\PowerShellLearning\AzureDeploy.json' -TemplateParameterObject $TemplateObject -Force


