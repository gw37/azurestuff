Mkdir c:\poshlog
$featureLogPath = "c:\poshlog\featurelog.txt" 
start-job -Name addFeature -ScriptBlock { 
Add-WindowsFeature -Name "ad-domain-services" -IncludeAllSubFeature -IncludeManagementTools 
Add-WindowsFeature -Name "dns" -IncludeAllSubFeature -IncludeManagementTools 
Add-WindowsFeature -Name "gpmc" -IncludeAllSubFeature -IncludeManagementTools } 
Wait-Job -Name addFeature 
Get-WindowsFeature | Where installed >>$featureLogPath


$safemodepassword = ConvertTo-SecureString -String "safe-m0dePass"  -AsPlainText -force
$domainname = "ccoeast.local" 
$netbiosName = "CCOEAST" 
Import-Module ADDSDeployment 
Install-ADDSForest -CreateDnsDelegation:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "Win2012" `
-DomainName $domainname `
-DomainNetbiosName $netbiosName `
-ForestMode "Win2012"  `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "C:\Windows\SYSVOL"  ` 
-SafeModeAdministratorPassword $safemodepassword `
-Force:$true > c:\poshlog\newADforest.txt
