
# What is AADLicensingHelper

The AADLicensingHelper is a collection of functions I find useful for working with the AzureAD Powershell Module 2.0. 

# Howto

Setting up.

```
PS C:\git\AADLicensingHelper> Import-Module .\AADLicensingHelper.psm1
PS C:\git\AADLicensingHelper> Connect-AzureAD

Account                               Environment Tenant
-------                               ----------- ------
admin@tenant.onmicrosoft.com          AzureCloud  b4a4aff4-f975-47cd-a243-c786822e7645
```

Querying an AAD users Service Plans and assigned from Skus.

```
PS C:\git\AADLicensingHelper> $AADUser = Get-AzureADUser -ObjectId user@tenant.onmicrosoft.com
PS C:\git\AADLicensingHelper> Get-AADUserAssignedPlans -AADUser $AADUser | ft

UserPrincipalName              ServicePlanName          SkuPartNumber                SkuId                                ServicePlanId
-----------------              ---------------          -------------                -----                                -------------
user@tenant.onmicrosoft.com OFFICE_FORMS_PLAN_2      STANDARDWOFFPACK_IW_FACULTY  78e66a63-337a-4a9a-8959-41c6654dfb56 9b5de886-f035-4ff2-b3d8-c9127bea3620
user@tenant.onmicrosoft.com SHAREPOINTWAC_EDU        STANDARDWOFFPACK_IW_FACULTY  78e66a63-337a-4a9a-8959-41c6654dfb56 e03c7e47-402c-463c-ab25-949079bedb21
user@tenant.onmicrosoft.com SHAREPOINTWAC_EDU        PROJECTONLINE_PLAN_1_FACULTY b732e2a7-5694-4dff-a0f2-9d9204c794ac e03c7e47-402c-463c-ab25-949079bedb21
user@tenant.onmicrosoft.com SHAREPOINTENTERPRISE_EDU PROJECTONLINE_PLAN_1_FACULTY b732e2a7-5694-4dff-a0f2-9d9204c794ac 63038b2c-28d0-45f6-bc36-33062963b498
user@tenant.onmicrosoft.com PROJECTWORKMANAGEMENT    STANDARDWOFFPACK_IW_FACULTY  78e66a63-337a-4a9a-8959-41c6654dfb56 b737dad2-2f6c-4c65-90e3-ca563267e8b9
user@tenant.onmicrosoft.com SHAREPOINTSTANDARD_EDU   STANDARDWOFFPACK_IW_FACULTY  78e66a63-337a-4a9a-8959-41c6654dfb56 0a4983bb-d3e5-4a09-95d8-b2d0127b3df5
user@tenant.onmicrosoft.com SWAY                     STANDARDWOFFPACK_IW_FACULTY  78e66a63-337a-4a9a-8959-41c6654dfb56 a23b959c-7ce8-4e57-9140-b90eb88a9e97
user@tenant.onmicrosoft.com SWAY                     PROJECTONLINE_PLAN_1_FACULTY b732e2a7-5694-4dff-a0f2-9d9204c794ac a23b959c-7ce8-4e57-9140-b90eb88a9e97
user@tenant.onmicrosoft.com EXCHANGE_S_STANDARD      STANDARDWOFFPACK_IW_FACULTY  78e66a63-337a-4a9a-8959-41c6654dfb56 9aaf7827-d63c-4b61-89c3-182f06f82e5c
user@tenant.onmicrosoft.com MCOSTANDARD              STANDARDWOFFPACK_IW_FACULTY  78e66a63-337a-4a9a-8959-41c6654dfb56 0feaeb32-d00e-4d66-bd5a-43b5b83db82c
user@tenant.onmicrosoft.com OFFICESUBSCRIPTION       STANDARDWOFFPACK_IW_FACULTY  78e66a63-337a-4a9a-8959-41c6654dfb56 43de0ff5-c92c-492b-9116-175376d08c38
user@tenant.onmicrosoft.com RMS_S_ENTERPRISE         STANDARDWOFFPACK_IW_FACULTY  78e66a63-337a-4a9a-8959-41c6654dfb56 bea4c11e-220a-4e6d-8eb8-8ea15d019f90
user@tenant.onmicrosoft.com YAMMER_EDU               STANDARDWOFFPACK_IW_FACULTY  78e66a63-337a-4a9a-8959-41c6654dfb56 2078e8df-cff6-4290-98cb-5408261a760a
```

# Issues

Please use the Github issue tracker to report problems

# Contact

* Email: oulman@outlook.com
* Twitter: @oulman



