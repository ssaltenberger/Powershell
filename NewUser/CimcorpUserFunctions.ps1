function Connect-CimcorpDomain($Credential) {

	Enable-PSRemoting -Force
	$Session = New-PSSession -Computername CCNADC01 -Credential $Credential
	Import-PSSession -Session $Session -Module ActiveDirectory -AllowClobber
	
}

function Connect-CimcorpExchange($Credential) {

	Enable-PSRemoting -Force
	$Session = New-PSSession -ConfiguratioName Microsoft.Exchange -ConnectionURI http://ccnaexchange01.cimcorp5.com/PowerShell -Credential $Credential
	Import-PSSession -Session $Session -AllowClobber
	
}

function Get-NewCCNAUserName {
	
	$y = 1
	$FirstName = read-host "Enter the first name"
	$LastName = read-host "Enter the last name"
	$Password = read-host -AsSecureString "Input Password"
	$JobTitle = read-host "Enter job title"
	
	$FullName = $FirstName + " " + $LastName
	$UserPrincipalName = $FirstName + "." + $LastName + "@cimcorp.com"
	$UserName = $FirstName.Substring(0,1) + $LastName.Substring(0,3)


	$ErrorActionPreference = 'SilentlyContinue'
	while (get-aduser -identity $username) {
		$UserName = $FirstName.Substring(0,1) + $LastName.Substring(0,3) + "0" + $y
		$y += 1
	}
	$ErrorActionPreference = 'Continue'

	$UserName = $UserName.toUpper()
	
	return $Fullname, $FirstName, $LastName, $UserPrincipalName, $UserName, $Password, $JobTitle
	
}

function Set-Department {

	#Clear-Host
	$i = 0
	$InputCheck = $false
	$arrayLength = $CCNADepartments.count

	Write-host "CCNA - Departments:"

	$CCNADepartments | ForEach-Object {
		write-host "[" $i "] " $_
		$i++
	}

	while (!$InputCheck) {
		[int]$DepartmentNumber = read-host "`nSelect a department by number"

		if ($DepartmentNumber -ge 0 -and $DepartmentNumber -le ($arrayLength - 1)) {
			[string]$DepartmentSelection = $CCNADepartments[$DepartmentNumber]
			$InputCheck = $true
		}
		else {
			Write-host "bad selection, try again..."
		}
	}
	
	$Department = switch($DepartmentNumber) {
		0  {$CCNADepartments[0]}
		1  {$CCNADepartments[1]}
		2  {$CCNADepartments[2]}
		3  {$CCNADepartments[3]}
		4  {$CCNADepartments[4]}
		5  {$CCNADepartments[5]}
		6  {$CCNADepartments[6]}
		7  {$CCNADepartments[7]}
		8  {$CCNADepartments[8]}
		9  {$CCNADepartments[9]}
		10 {$CCNADepartments[10]}
		11 {$CCNADepartments[11]}
		12 {$CCNADepartments[12]}
		13 {$CCNADepartments[13]}
		14 {$CCNADepartments[14]}
		15 {$CCNADepartments[15]}
		16 {$CCNADepartments[16]}
		17 {$CCNADepartments[17]}
	}

	$SecGroups = switch ($DepartmentNumber) {
		0  { $CCNASecAdmnistration        }
		1  { $CCNASecApplications         }
		2  { $CCNASecCS                   }
		3  { $CCNASecEngineering          }
		4  { $CCNASecHR                   }
		5  { $CCNASecIT                   }
		6  { $CCNASecProcurement          }
		7  { $CCNASecProduction           }
		8  { $CCNASecElectrician          }
		9  { $CCNASecAutomationSpecialist }
		10 { $CCNASecPM                   }
		11 { $CCNASecQHSE                 }
		12 { $CCNASecSales                }
		13 { $CCNASecMarketing            }
		14 { $CCNASecAppDev               }
		15 { $CCNASecRSI                  }
		16 { $CCNASecSoftwareSupport      }
		17 { $CCNASecWarehouse            }
	}

	$DistGroups = switch ($DepartmentNumber) {
		0  { $CCNADistAdmnistration        }
		1  { $CCNADistApplications         }
		2  { $CCNADistCS                   }
		3  { $CCNADistEngineering          }
		4  { $CCNADistHR                   }
		5  { $CCNADistIT                   }
		6  { $CCNADistProcurement          }
		7  { $CCNADistProduction           }
		8  { $CCNADistElectrician          }
		9  { $CCNADistAutomationSpecialist }
		10 { $CCNADistPM                   }
		11 { $CCNADistQHSE                 }
		12 { $CCNADistSales                }
		13 { $CCNADistMarketing            }
		14 { $CCNADistAppDev               }
		15 { $CCNADistRSI                  }
		16 { $CCNADistSoftwareSupport      }
		17 { $CCNADistWarehouse            }
	}
	
	$SubOU = $NULL
	$SubOU = switch ($Department) {
		"Automation System Specialist" {"$($Department),OU=Production"}
		"Electrician"                  {"$($Department),OU=Production"}
		"Application Developers"       {"$($Department),OU=Software"}  
		"Robotic Systems Integrators"  {"$($Department),OU=Software"}
		"Software Support"             {"$($Department),OU=Software"}
	}
	
	if ($SubOU -eq $NULL) {
		$OU = "OU=" + $department + ",OU=Grimsby_ON,OU=CC_CAN,OU=People,DC=Cimcorp5,DC=com"
	}
	else {
		$OU = "OU=" + $SubOU + ",OU=Grimsby_ON,OU=CC_CAN,OU=People,DC=Cimcorp5,DC=com"
	}
	
	return $Department, $SecGroups, $DistGroups, $OU
	
}

function Get-Manager($Department) {

	$Manager = switch($Department) {
		"Administration"			   {$CCNAManagers.Administration}
		"Applications"				   {$CCNAManagers.Applications}
		"Customer Support"			   {$CCNAManagers.CS}
		"Engineering"				   {$CCNAManagers.Engineering}
		"Human Resources"			   {$CCNAManagers.HumanResources}
		"IT"						   {$CCNAManagers.IT}
		"Procurement" 				   {$CCNAManagers.Procurement}
		"Production"  				   {$CCNAManagers.Production}
		"Automation System Specialist" {$CCNAManagers.Production}
		"Electrician" 				   {$CCNAManagers.Production}
		"Project Management"		   {$CCNAManagers.ProjectManagement}
		"QHSE"						   {$CCNAManagers.QHSE}
		"Sales"						   {$CCNAManagers.Sales}
		"Marketing"					   {$CCNAManagers.Marketing}
		"Application Developers"	   {$CCNAManagers.ApplicationDevelopers}
		"Robotic Systems Integrators"  {$CCNAManagers.RoboticSystemsIntegrators}
		"Software Support" 			   {$CCNAManagers.SoftwareSupport}
		"Warehouse"					   {$CCNAManagers.Warehouse}
		
	}
	
	return $Manager
	
}

Function Add-SecGroups($SecGroups, $UserName) {
	
	Foreach ($Group in $CCNASecDefaultGroups) {
		Add-ADGroupMember -Identity $group -Members $UserName
	}
	Foreach ($Group in $SecGroups) {
		Add-ADGroupMember -Identity $Group -Members $UserName
	}
	
}

function Get-DoorCode {
	
	$DoorCodeExists = $True
	$DoorCheck = $True
	
	"Generating a door code..."
	
	while ($DoorCheck) {
		while ($DoorCodeExists) {
			$DoorCode = get-random -minimum 1000 -maximum 10000
			$DoorCodes = get-aduser -filter * -properties * | select -property ExtensionAttribute6
			$DoorCodes | foreach {
				if ($_.ExtensionAttribute6 -ne $DoorCode) {
					$DoorCodeExists = $False
				}
				else {
					$DoorCheck = $True
					"That door code already exists... Generating a new one..."
					break
				}
				$DoorCheck = $False
			}
		}
	}
	
	return $DoorCode
	
}

function Create-User($Credential) {
	
	## Connect to Cimcorp5 Domain Controller
	Connect-CimcorpDomain($Credential)
	
	## Get New Employee's Name, Password and Job Title
	$Fullname, $FirstName, $LastName, $UserPrincipalName, $UserName, $Password, $JobTitle = Get-NewCCNAUserName
	
	## Get Distribution and Security Groups for new employee
	$Department, $SecGroups, $DistGroups, $OU = Set-Department
	
	## Get the manager of the new employee
	$Manager = Get-Manager($Department)
	
	## Fill out a hashtable with values relating to the new employee
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
	
	##Create New Employee
	New-ADUser @userInfo
	
	## Add new employee to security groups
	Add-SecGroups($SecGroups, $UserName)
	
	## Drop PSSession to Domain Controller
	Exit-PSSession
	
}