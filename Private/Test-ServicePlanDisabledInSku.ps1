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