clear

"This will migrate a user from a linked mailbox to a user mailbox on the Cimcorp5 Domain"
"We need to collect some information first:"
""
"======================================================================================="
""
""
"Reading from file..."
$namesList = import-csv .\namesList.csv

Foreach ($name in $namesList) {
	$userName = $name.userName
	$firstName = $name.firstName
	$lastName = $name.lastName
	""
	$userPrincipalName = $firstName + "." + $lastName + "@cimcorp.com"
	$userIdentity = $firstName + " " + $lastName
	$ADPath = "CN=" + $userIdentity + ",OU=RMT,DC=CIMCORP5,DC=COM"

	Set-User -identity $userPrincipalName -LinkedMasterAccount $null
	Disable-Mailbox -identity $userPrincipalName -confirm
	Remove-ADUser -Identity $ADPath -confirm
	Set-ADUser -Identity $userName -UserPrincipalName $userPrincipalName
	Connect-Mailbox -identity $userIdentity -Database "CCNA Database" -user $userIdentity
}