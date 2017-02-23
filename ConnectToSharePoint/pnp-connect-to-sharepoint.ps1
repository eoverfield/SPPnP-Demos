#get list of installed PnP solutions
Get-Module SharePointPnPPowerShell* -ListAvailable | Select-Object Name,Version | Sort-Object Version –Descending

#Install PnP PowerShell for SharePoint Online
Install-Module SharePointPnPPowerShellOnline -AllowClobber

#Update PnP Powershell
Update-Module SharePointPnPPowerShell*

#Get a list of available PnP Commands
Get-Command -Module *PnP*

#Connect to a SharePoint site. be sure to change "yourtenant" to your actual tenant
Connect-PnPOnline -url https://"yourtenant".sharepoint.com/sites/demo-pnp-provisioning –Credentials (Get-Credential)

#get a list of all lists within a recently connected Site
Get-PnPList

#Get a specific list view
Get-PnPView -List "Pages" -Identity "All Documents"

#get detailed help on a given PnP Command
Get-Help Connect-PnPOnline -Detailed

#Create a given list within an already connected to Site
New-PnPList -Title "Demo Announcements" -Url "DemoAnnouncements" -Template Announcements

#Remove a given list within an already connected to site
Remove-PnPList -Identity "Demo Announcements" -Force

#command set to create a new Office 365 Gorup
Connect-PnPMicrosoftGraph -Scopes "Group.ReadWrite.All","User.Read.All"
New-PnPUnifiedGroup -DisplayName "PnP Demo Group" -Owners me@mydomain.com
Get-PnPUnifiedGroup