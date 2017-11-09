$fname = @('bill','paul','andy','gordon','steve')
$lname = @('cpu','memory','tick','tock', 'ice')
$sp = ConvertTo-SecureString "Pass@word1" –asplaintext –force
foreach ($f in $fname) {
    foreach ($l in $lname) {
        $fullname = "$f$l"
        $samaccount = $fullname
New-ADUser –SamAccountName $fullname –name $fullname
Set-ADAccountPassword –identity $fullname –NewPassword $sp
Set-ADUser –identity $fullname –Enabled 1 –PasswordNeverExpires 1 -givenname $f -surname $l
    }
}

