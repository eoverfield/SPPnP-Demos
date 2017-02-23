# SPPnP-Demos

SharePoint PnP Provisioning Demo assets

#Demo Commands

##Demo Common Commands
Get-Module SharePointPnPPowerShell* -ListAvailable | Select-Object Name,Version | Sort-Object Version –Descending

Install-Module SharePointPnPPowerShellOnline -AllowClobber

Update-Module SharePointPnPPowerShell*

Get-Command -Module *PnP*

Connect-PnPOnline -url https://your-tenant.sharepoint.com/sites/demo-pnp-provisioning –Credentials (Get-Credential)

Get-PnPList

Get-Help Connect-PnPOnline -Detailed


##Demo Connect and Apply direct template to SharePoint
Connect-PnPOnline -url https://your-tenant.sharepoint.com/sites/demo-pnp-provisioning –Credentials (Get-Credential)

Apply-PnPProvisioningTemplate -Path .\templates\Provision.Infrastructure.xml

Apply-PnPProvisioningTemplate -Path .\templates\Provision.Data.xml -Handlers Lists

Apply-PnPProvisioningTemplate -Path .\templates\Provision.Data.xml -Handlers Files

Apply-PnPProvisioningTemplate -Path .\templates\Provision.CustomActions.xml -Parameters @{"InfrastructureSiteUrl"="https://your-tenant.sharepoint.com/sites/demo-pnp-provisioning"}


##Demo Use Powershell script to apply general provisioning
.\PnP-Provision.ps1 -TargetWebUrl "https://your-tenant.sharepoint.com/sites/demo-pnp-provisioning" 

.\PnP-Provision-Disable.ps1 -TargetWebUrl "https://your-tenant.sharepoint.com/sites/demo-pnp-provisioning" 


##Demo Create Office 365 Group
Connect-PnPMicrosoftGraph –Scopes “Group.ReadWrite.All” “User.Read.All”

New-PnPUnifiedGroup -DisplayName “PnP Demo” -Description “PnP Demo Group” -MailNickname “PnPDemo”