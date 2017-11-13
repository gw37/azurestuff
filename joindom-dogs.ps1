$secpasswd = ConvertTo-SecureString "Pass@word1" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ("dogs\joiner", $secpasswd)
mkdir c:\poshlog -ErrorAction Ignore
add-computer -computername $env:computername -domainname dogs.local –credential $cred -restart –force >c:\poshlog\domjoin.txt

