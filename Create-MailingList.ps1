clear-host

#$users = get-aduser -filter * -SearchBase "OU=People,DC=Cimcorp5,DC=com" | where {$_.userprincipalname -like "*.*@cimcorp.com"} | select -expandproperty samaccountname | sort
#$users = get-aduser -filter * -SearchBase "OU=Branches,DC=Cimcorp5,DC=com" | where {$_.userprincipalname -like "*.*@cimcorp.com" -and $_.enabled -eq $true} | select -expandproperty samaccountname | sort
$CCOYusers = get-aduser -filter * -SearchBase "OU=CCOY,OU=Branches,DC=Cimcorp5,DC=com" | where {$_.userprincipalname -like "*.*@cimcorp.com" -and $_.enabled -eq $true} | select -expandproperty samaccountname | sort
$CCNAusers = get-aduser -filter * -SearchBase "OU=CCNA,OU=Branches,DC=Cimcorp5,DC=com" | where {$_.userprincipalname -like "*.*@cimcorp.com" -and $_.enabled -eq $true} | select -expandproperty samaccountname | sort
$CCIBusers = get-aduser -filter * -SearchBase "OU=CCIB,OU=Branches,DC=Cimcorp5,DC=com" | where {$_.userprincipalname -like "*.*@cimcorp.com" -and $_.enabled -eq $true} | select -expandproperty samaccountname | sort
$CCINusers = get-aduser -filter * -SearchBase "OU=CCIN,OU=Branches,DC=Cimcorp5,DC=com" | where {$_.userprincipalname -like "*.*@cimcorp.com" -and $_.enabled -eq $true} | select -expandproperty samaccountname | sort
$CCUSusers = get-aduser -filter * -SearchBase "OU=CCUS,OU=Branches,DC=Cimcorp5,DC=com" | where {$_.userprincipalname -like "*.*@cimcorp.com" -and $_.enabled -eq $true} | select -expandproperty samaccountname | sort

$CCOYtotal = $CCOYusers.count
$CCNAtotal = $CCNAusers.count
$CCIBtotal = $CCIBusers.count
$CCINtotal = $CCINusers.count
$CCUStotal = $CCUSusers.count

$total = $CCOYtotal + $CCNAtotal + $CCIBtotal + $CCINtotal + $CCUStotal

$totalString = "Total number of active email addresses: " + $total
$path = "E:\data\currentAddresses\$(get-date -Format "dd-MM-yyyy") - mailing list.csv"
$totalString | Out-File -filepath $path -Append
"" | Out-file -filepath $path -Append

$CCOYmessage = "CCOY Employees:" + $CCOYtotal
$CCOYmessage | Out-file -filepath $path -append
foreach ($user in $CCOYusers) {
		$smtpAddress = get-mailbox -identity $user | select -ExpandProperty primarysmtpaddress
		$smtpAddress.address | Out-File -filepath $path -Append
}

"" | Out-file -filepath $path -Append
$CCNAmessage = "CCNA Employees:" + $CCNAtotal
$CCNAmessage | Out-file -filepath $path -append
foreach ($user in $CCNAusers) {
		$smtpAddress = get-mailbox -identity $user | select -ExpandProperty primarysmtpaddress
		$smtpAddress.address | Out-File -filepath $path -Append
}

"" | Out-file -filepath $path -Append
$CCIBmessage = "CCIB Employees:" + $CCIBtotal
$CCIBmessage | Out-file -filepath $path -append
foreach ($user in $CCIBusers) {
		$smtpAddress = get-mailbox -identity $user | select -ExpandProperty primarysmtpaddress
		$smtpAddress.address | Out-File -filepath $path -Append
}

"" | Out-file -filepath $path -Append
$CCINmessage = "CCIN Employees:" + $CCINtotal
$CCINmessage | Out-file -filepath $path -append
foreach ($user in $CCINusers) {
		$smtpAddress = get-mailbox -identity $user | select -ExpandProperty primarysmtpaddress
		$smtpAddress.address | Out-File -filepath $path -Append
}

"" | Out-file -filepath $path -Append
$CCUSmessage = "CCUS Employees:" + $CCUStotal
$CCUSmessage | Out-file -filepath $path -append
foreach ($user in $CCUSusers) {
		$smtpAddress = get-mailbox -identity $user | select -ExpandProperty primarysmtpaddress
		$smtpAddress.address | Out-File -filepath $path -Append
}

Send-MailMessage -To "suvi.talvitie@cimcorp.com" -From "steven.saltenberger@cimcorp.com" -Subject "Updated Mailing List" -Body "Hello Tuvi, here is the latest mailing list." -Attachments $path -SMTPServer webmail.cimcorp.com -port 587