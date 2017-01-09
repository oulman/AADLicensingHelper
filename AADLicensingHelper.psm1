function Test-ServicePlanDisabledInSku($servicePlanId, $skuId)
{
<#
.SYNOPSIS
Test if a service plan is disabled in a particular sku

.DESCRIPTION
Test if a service plan is disabled in a particular sku. Returns $true/$false

.EXAMPLE
PS C:\> $result = Test-ServicePlanDisabledInSku($servicePlanId,$skuId)

#>
    $disabledPlans = ($aadUser.AssignedLicenses | Where-Object { $_.SkuId -eq $skuId }).DisabledPlans

    return ($servicePlanId -in $disabledPlans)
}

function Get-SkuFromServicePlanId
{
<#
.SYNOPSIS
Maps an assigned service plan to a SkuId

.DESCRIPTION
Maps an assigned service plan to a SkuId. Helpful in tenants where you may have multiple Skus capable of assigning
a serviceplan and need to determine which one it's assigned from.

.PARAMETER ServicePlanId
Guid string of Service Plan

.EXAMPLE
PS C:\> Get-SkuFromServicePlanId -ServicePlanId 9b5de886-f035-4ff2-b3d8-c9127bea333

#>
[CmdletBinding()]
param (
  [Parameter(
   Mandatory=$true,
   ValueFromPipelineByPropertyName=$true)]
  [Guid]$ServicePlanId
)
    
    # loop over every purchased sku in the tenant
    foreach ($s in $azureSubscribedSku) 
    {
        # if the sku is assigned to the user
        if ($s.SkuId -in $($aadUser.AssignedLicenses.SkuId)) 
        {
            # loop through the service plans in the current sku
            foreach ($sp in $s.ServicePlans) 
            {
                # the service plan is not disabled in the current sku
                if (-not(Test-ServicePlanDisabledInSku($sp.ServicePlanId, $s.SkuId)))
                {
                    # the enabled service plan matches what we're looking for
                    if ($sp.ServicePlanId -match $servicePlanId) 
                    {
                        $prop = @{ 
                            'SkuPartNumber' = $($s.SkuPartNumber);
                            'SkuId' = $($s.SkuId);
                            'ServicePlanId' = $($sp.ServicePlanId);
                            'ServicePlanName' = $($sp.ServicePlanName)
                        }

                        $obj = New-Object -TypeName PSObject -Property $prop
                        Write-Output $obj
                    }
                }
            }
        }
    }
}

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

Export-ModuleMember -Function Test-ServicePlanDisabledInSku
Export-ModuleMember -Function Get-SkuFromServicePlanId
Export-ModuleMember -Function Get-AADUserAssignedPlans

