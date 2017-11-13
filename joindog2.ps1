$secpasswd = ConvertTo-SecureString "Pass@word1" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ("dogs\joiner", $secpasswd)
mkdir c:\poshlog -ErrorAction Ignore
add-computer -ComputerName $env:COMPUTERNAME -DomainName dogs.local -Credential $cred -restart -force > c:\poshlog\joindog2.txt