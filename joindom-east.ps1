$secpasswd = ConvertTo-SecureString "Pass@word1" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ("ccoeast\joiner", $secpasswd)
mkdir c:\poshlog -ErrorAction Ignore
add-computer -computername $env:computername -domainname ccoeast.local `
  -credential $cred -restart -force > c:\poshlog\join_out.txt
  