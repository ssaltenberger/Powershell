#This script was written by SMS

#this script is intended to create new user objects for the CCNA division of Cimcorp
#it can be modified to create user objects for other divisions

clear

$x = 0
$y = 1
$isDepartment = $false
$departments = @('Administration','Applications','CS','Engineering','Human Resources','IT','Procurement','Production','Project Management','QHSE','Sales','Software','Warehouse')
$doorCodeExists = $True
$doorCheck = $True

"/---------------------------------------------------------------------------------------\"
"|=======================================================================================|"
"\---------------------------------------------------------------------------------------/"
"                        This script is used to make a new user                           "
""
" 		- Enter the correct information when prompted"
" 		- The Active Directory user object will be created"
" 		- The user's email will be created"
" 		- Note: This is ONLY for CCNA employees"

""
""
""

$firstName = read-host "Enter the first name"
$lastName = read-host "Enter the last name"
$jobTitle = read-host "Enter the job title"
$password = read-host -AsSecureString "Input Password"
$company = "Cimcorp Automation Ltd"
$office = "Grimsby"

while (!($isDepartment)) {
    "Departments:"
    foreach ($department in $departments) { "  [" + $x + "]  " + $department; $x += 1 }
    $departmentNumber = read-host "Select a department by NUMBER"

    if (($departmentNumber -ge 0) -and ($departmentNumber -le 13)) {
        $department = $departments[$departmentNumber]
        $isDepartment = $true
    }
    ""
    ""
}

$phoneExt = read-host "Enter their phone extension"
""
$phoneNumber = "+1 (905)643-9700 ," + $phoneExt
$organizationalUnit = "OU=" + $department + ",OU=Grimsby_ON,OU=CC_CAN,OU=People,DC=Cimcorp5,DC=com"
$fullName = $firstName + " " + $lastName
$userPrincipalName = $firstName + "." + $lastName + "@cimcorp.com"
$userName = $firstName.Substring(0,1) + $lastName.Substring(0,3)


$ErrorActionPreference = 'SilentlyContinue'
while (get-aduser -identity $username) {
    $userName = $firstName.Substring(0,1) + $lastName.Substring(0,3) + "0" + $y
	$y += 1
}
$ErrorActionPreference = 'Continue'

$userName = $userName.toUpper()

"Generating a door code..."
while ($doorCheck) {
	while ($doorCodeExists) {
		$doorCode = get-random -minimum 1000 -maximum 10000
		$doorCodes = get-aduser -filter * -properties * | select -property ExtensionAttribute6
		$doorCodes | foreach {
			if ($_.ExtensionAttribute6 -ne $doorCode) {
				$doorCodeExists = $false
			}
			else {
				$doorCheck = $true
				"That door code already exists... Generating a new one..."
				break
			}
			$doorCheck = $False
		}
	}
}
""
write-host "Your door code is...  " $doorCode

""
"Creating user folders on GR01..."

new-item -path \\gr01.rmt.otl\vol1\users\$username -type directory -force
new-item -path \\gr01.rmt.otl\vol1\data\junk\$username -type directory -force
new-item -path \\gr01.rmt.otl\vol1\data\junk\$username\scans -type directory -force

$homeDirectory = "\\gr01.rmt.otl\vol1\users\" + $userName + "\"
$homeDrive = "F:"

#new-aduser -samAccountName $userName -userPrincipalName $userPrincipalName -Name $fullName -GivenName $firstName -Surname $lastName -department $department 
#-path $organizationalUnit -office "Grimsby" -officePhone $phoneNumber -AccountPassword(read-host -AsSecureString "Input Password") -homeDirectory "'\\gr01.rmt.otl\vol1\users\' + $userName\" 
#-homeDrive "F:" -title $jobTitle -emailAddress $userPrincipalName -enabled $true -passwordNeverExpires $true

$userInfo = @{
	samAccountName       = $userName
	UserPrincipalName    = $userPrincipalName
	Name		         = $fullName
	GivenName            = $firstName
	Surname              = $lastName
	Enabled              = $true
	DisplayName          = $fullName
	Path                 = $organizationalUnit
	Office               = $office
	Company              = $company
	OfficePhone          = $phoneNumber
	Department           = $Department
	AccountPassword      = $password
	Title                = $jobTitle
	EmailAddress         = $userPrincipalName
	PasswordNeverExpires = $true
	homeDirectory        = $homeDirectory
	homeDrive            = $homeDrive
}

write-host "Creating user $($fullName)..."

""
"Creating the user's mailbox..."

new-aduser @userInfo

enable-mailbox -identity $userPrincipalName -database "CCNA Database"


#door code didn't get entered
#User wasn't put in the OU
#Password options
