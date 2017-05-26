function Get-AADUserAssignedPlans
{
<#
.SYNOPSIS
Queries AAD user licensing stus

.DESCRIPTION
Queries AzureAD user and combines service plan and sku information.

.PARAMETER AADUser
AzureAD user object

.EXAMPLE
PS C:\> Get-AADUserAssignedPlans -AADUser (Get-AzureADUser -ObjectId user@mytenant.onmicrosoft.com)

#>
[CmdletBinding()]
param (
  [Parameter(
   Mandatory=$true,
   ValueFromPipelineByPropertyName=$true)]
  [Microsoft.Open.AzureAD.Model.User]$AADUser
)
    # AAD Skus purchased in tenant
    $azureSubscribedSku = Get-AzureADSubscribedSku

    foreach ($servicePlan in $aadUser.AssignedPlans) 
    { 
        Get-SkuFromServicePlanId($($serviceplan.ServicePlanId)) | Select-Object @{N="UserPrincipalName";E={$($aadUser.UserPrincipalName)}}, ServicePlanName, SkuPartNumber, SkuId, ServicePlanId
    }
}