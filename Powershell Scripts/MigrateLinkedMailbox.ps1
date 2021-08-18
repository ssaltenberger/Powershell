clear

""
"This will migrate a user from a linked mailbox to a user mailbox on the Cimcorp5 Domain"
"We need to collect some information first:"
""
"======================================================================================="
""
""
$userName = read-host "Enter a CCOY username (eg. TLOG): "
$firstName = read-host "Enter their first name: "
$lastName = read-host "Enter their last name: "
""
$userPrincipalName = $firstName + "." + $lastName + "@cimcorp.com"
$userIdentity = $firstName + " " + $lastName
$ADPath = "CN=" + $userIdentity + ",OU=CCNA,DC=CIMCORP5,DC=COM"

$groups = @()

$groups = get-distributiongroup | where-object {(get-distributiongroupmember $_ | where-object {$_.Name -eq $userIdentity})}

Set-User -identity $userPrincipalName -LinkedMasterAccount $null
Disable-Mailbox -identity $userPrincipalName -confirm
Remove-ADObject -Identity $ADPath -confirm
Set-ADUser -Identity $userName -UserPrincipalName $userPrincipalName
Connect-Mailbox -identity $userIdentity -Database "CCNA Database" -user $userName

foreach ($group in $groups) {
	add-distributiongroupmember -identity $group.name -member $userPrincipalName
}