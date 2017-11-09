$addsTools = "RSAT-AD-Tools" 
Add-WindowsFeature $addsTools 
mkdir c:\poshlog


#Install AD DS, DNS and GPMC 
$featureLogPath = "c:\poshlog\featurelog.txt" 
start-job -Name addFeature -ScriptBlock { 
Add-WindowsFeature -Name "ad-domain-services" -IncludeAllSubFeature -IncludeManagementTools 
Add-WindowsFeature -Name "dns" -IncludeAllSubFeature -IncludeManagementTools 
Add-WindowsFeature -Name "gpmc" -IncludeAllSubFeature -IncludeManagementTools } 
Wait-Job -Name addFeature 
Get-WindowsFeature | Where installed >>$featureLogPath

InstallNewForest.ps1 
# Create New Forest, add Domain Controller 
$domainname = "dogs.local" 
$netbiosName = "dogs" 
Import-Module ADDSDeployment 
Install-ADDSForest -CreateDnsDelegation:$false ` 
-DatabasePath "C:\Windows\NTDS" ` 
-DomainMode "Win2012" ` 
-DomainName $domainname ` 
-DomainNetbiosName $netbiosName ` 
-ForestMode "Win2012" ` 
-InstallDns:$true ` 
-LogPath "C:\Windows\NTDS" ` 
-NoRebootOnCompletion:$false ` 
-SysvolPath "C:\Windows\SYSVOL" ` 
-Force:$true
