. .\DefaultGroups.ps1
. .\CimcorpUserFunctions.ps1

$Credential = get-credential

Connect-CimcorpDomain($Credential)

## Get New Employee's Name and Set Password
$Fullname, $FirstName, $LastName, $UserPrincipalName, $UserName, $Password, $JobTitle = Get-NewCCNAUserName

## Set New User Department and Group Memberships
$Department, $SecGroups, $DistGroups, $OU = Set-Department

<# Write-host "Department"
$Department
""
""
write-host "Security Groups"
$SecGroups
""
""
write-host "Distribution Groups"
$DistGroups
""
""
write-host "OU"
$OU #>

## Get Manager
$Manager = Get-Manager($Department)

## Set User Information - Job Title, Manager, Office, Phone Number, etc.
$userInfo = @{
	samAccountName       = $userName
	UserPrincipalName    = $userPrincipalName
	Name		         = $fullName
	GivenName            = $firstName
	Surname              = $lastName
	Enabled              = $False
	DisplayName          = $fullName
	Path                 = $OU
	Office               = "Grimsby"
	Company              = "Cimcorp Automation Ltd"
	Manager				 = $Manager
	Department           = $Department
	AccountPassword      = $password
	Title                = $jobTitle
	EmailAddress         = $userPrincipalName
}

## Create New AD User with gathered information
New-ADUser @userInfo

## Put into Security Groups
Add-SecGroups($SecGroups, $UserName)

## Exit Domain Controller PSSession
Exit-PSSession

## Enable Mailbox

## Put into Distribution Groups