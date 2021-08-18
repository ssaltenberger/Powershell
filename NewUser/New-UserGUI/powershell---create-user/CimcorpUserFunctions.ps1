function Connect-CimcorpDomain($Credential) {
	
	#$Credential = Get-Credential
	Enable-PSRemoting -Force
	$Session = New-PSSession -Name CCNA -Computername CCNADC01 -Credential $Credential -ErrorAction SilentlyContinue
	if ($Session) {
		Import-PSSession -Session $Session -Module ActiveDirectory -AllowClobber -ErrorAction SilentlyContinue
	}
	
}

function Connect-CimcorpExchange($Credential) {

	#$Credential = Get-Credential
	Enable-PSRemoting -Force
	$ExchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionURI http://ccnaexchange01.cimcorp5.com/PowerShell -Credential $Credential
	Import-PSSession -Session $ExchangeSession -AllowClobber -Verbose:$False
	
}

function Get-NewCCNAUserName($FirstName, $LastName) {
	
	$y = 1
	
	$FullName = $FirstName + " " + $LastName
	$UserPrincipalName = $FirstName + "." + $LastName + "@cimcorp.com"
	$UserName = $FirstName.Substring(0,1) + $LastName.Substring(0,3)


	$ErrorActionPreference = 'SilentlyContinue'
	
	while (get-aduser -identity $username) {
		$UserName = $FirstName.Substring(0,1) + $LastName.Substring(0,3) + "0" + $y
		$y += 1
	}

	$ErrorActionPreference = 'SilentlyContinue'

	$UserName = $UserName.toUpper()
	
	return $Fullname, $UserPrincipalName, $UserName
	
}

function Set-Department($DepartmentNumber) {

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
		4  { $CCNADistHR             	   }
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
	
	$SubOU = switch ($Department) {
		"Automation System Specialist" {"$($Department),OU=Production"}
		"Electrician"                  {"$($Department),OU=Production"}
		"Application Developers"       {"$($Department),OU=Software"}  
		"Robotics Systems Integrators" {"$($Department),OU=Software"}
		"Software Support"             {"$($Department),OU=Software"}
		"Customer Support"			   {"CS"}
	}

	if ($SubOU -ne $NULL) {
		$OU = "OU=" + $SubOU + ",OU=Employees,OU=People,OU=CCNA,OU=Branches,DC=Cimcorp5,DC=com"
	}
	else {
		$OU = "OU=" + $department + ",OU=Employees,OU=People,OU=CCNA,OU=Branches,DC=Cimcorp5,DC=com"
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
		"Robotics Systems Integrators" {$CCNAManagers.RoboticsSystemsIntegrators}
		"Software Support" 			   {$CCNAManagers.SoftwareSupport}
		"Warehouse"					   {$CCNAManagers.Warehouse}
		
	}
	
	return $Manager
	
}

Function Add-SecGroups($SecGroups, $UserName) {
	
	Foreach ($Group in $CCNASecDefaultGroups) {
		Add-ADGroupMember -Identity $Group -Members $UserName
	}
	Foreach ($Group in $SecGroups) {
		Add-ADGroupMember -Identity $Group -Members $UserName
	}
	
}

Function Add-DistGroups($DistGroups, $UserPrincipalName) {
	
	<#Foreach ($Group in $CCNADistDefaultGroups) {
		Add-DistributionGroupMember -Identity $Group -Member $UserPrincipalName
	} #>
	Foreach ($Group in $DistGroups) {
		Add-DistributionGroupMember -Identity $Group -Member $UserPrincipalName
	}
	
}

function Get-DoorCode {
	
	$DoorCodeExists = $True
	$DoorCheck = $True
	
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

function Get-HomeDirectory($UserName, $Credential) {

	$User = "U:\VOL1\Users\" + $UserName
	$Junk = "U:\VOL1\Data\Junk\" + $UserName + "\Scans"
	
	$Parameters = @{
		ComputerName = "GR01.RMT.OTL"
		ArgumentList = $UserName
		ScriptBlock = { param($UserName); new-item -path U:\VOL1\Users\$UserName -type directory -force;  new-item -path U:\VOL1\Data\Junk\$UserName\Scans -type directory -force }
	}
	
	Invoke-Command @Parameters
		
	$UserDirectory = Join-Path -Path \\GR01.RMT.OTL\VOL1\USERS -ChildPath $UserName
	
	return
	
}

function Create-User($DepartmentNumber, $JobTitle, $Password, $FirstName, $LastName, $Phone) {
	
	$Password = ConvertTo-SecureString $Password -AsPlainText -Force
	$Alias = $FirstName + $LastName
	[string]$Phone = "+1 905-643-9700 ," + $Phone
	
	$HomeDrive  		   = "F:"
	[String]$StreetAddress = "635 S. Service Road"
	[String]$City          = "Grimsby"
	[String]$Province      = "ON"
	[String]$Postal		   = "L3M4E8"
	[String]$Country	   = "CA"
	
	$Credential = Get-Credential
	
	## Connect to Cimcorp5 Domain Controller
	Write-host "Connecting to the Domain Controller..."
	Connect-CimcorpDomain $Credential
	
	$CCNASession = Get-PSSession -name CCNA -ErrorAction SilentlyContinue
	$SessionDead = $True
	
	if ($CCNASession) {
		$SessionDead = $False
	}
	
	if ($SessionDead) {
		Write-Host "Remote Connection Failed"
		Write-Host "Try entering credentials again..."
		return
	}
	else {
		## Get New Employee's Name, Password and Job Title
		Write-host "Generating User Name..."
		$Fullname, $UserPrincipalName, $UserName = Get-NewCCNAUserName $FirstName  $LastName
		
		## Get Distribution and Security Groups for new employee
		Write-host "Gathering Department Info..."
		$Department, $SecGroups, $DistGroups, $OU = Set-Department $DepartmentNumber
		
		## Get the manager of the new employee
		Write-host "Getting Manager..."
		$Manager = Get-Manager $Department
		
		## Get Home Directory
		Get-HomeDirectory $UserName $Credential
		
		$HomeDirectory = Join-Path -Path \\GR01.RMT.OTL\VOL1\USERS -ChildPath $UserName
		
		## Get door code
		Write-Host "Getting door code..."
		[string]$DoorCode = Get-DoorCode
		
		## Fill out a hashtable with values relating to the new employee
		Write-host "Generating Hash Table..."
		Start-Sleep -s 2
		$userInfo = @{
			samAccountName        = $userName
			UserPrincipalName     = $userPrincipalName
			Name		          = $fullName
			GivenName             = $firstName
			Surname               = $lastName
			Enabled               = $True
			DisplayName           = $fullName
			Path                  = $OU
			Office                = "Grimsby"
			Company               = "Cimcorp Automation Ltd"
			Manager				  = $Manager
			Department            = $Department
			AccountPassword       = $password
			Title                 = $jobTitle
			EmailAddress          = $userPrincipalName
			ChangePasswordAtLogon = $False
			OfficePhone           = $Phone
			HomeDrive             = $HomeDrive
			HomeDirectory         = $HomeDirectory
			ScriptPath            = "ccna_users_netlogon.bat"
			StreetAddress         = $StreetAddress
			City                  = $City
			State                 = $Province
			Country               = $Country
			PostalCode            = $Postal
		}

		##Create New Employee	
		Write-host "Creating New User..."
		try {
			New-ADUser @userInfo
		} catch {
			write-error $_.Exception.Message
		}
		
		## Add new employee to security groups	
		Write-host "Adding to Security Groups..."
		Add-SecGroups $SecGroups $UserName
		
		## Add ExtensionAttribute6 (Door code)
		Set-ADUser -Identity $UserName -Add @{"ExtensionAttribute6"=$DoorCode}
		Write-Host "Door Code is... " $DoorCode
		
		## Add ACL for User Folder
		Write-Host "Setting home directory permissions..."
		$ACL = Get-Acl $HomeDirectory
		
		$Ar = New-Object System.Security.AccessControl.FileSystemAccessRule($Username, "Modify", "ContainerInherit,ObjectInherit", "None", "Allow")
		
		$Acl.SetAccessRule($Ar)
		Set-Acl -path $HomeDirectory -AclObject $Acl
		
		## Drop PSSession to Domain Controller
		Exit-PSSession
		
		## Connect to Exchange Server
		Write-host "Connecting to the Exchange Server..."
		Connect-CimcorpExchange $Credential
		
		## Enable user mailbox
		Write-host "Enabling user mailbox..."
		Enable-Mailbox -Identity $UserPrincipalName -Alias $Alias -Database "CCNA Database"
		Start-Sleep -s 10
		
		## Add to Distribution Groups
		Write-host "Adding to distribution groups..."
		Add-DistGroups $DistGroups $UserPrincipalName
		
		## Drop PSSession to Exchange Server
		Exit-PSSession
		
		## Clear the form and start over
		Write-host "You can close the form or enter a new user..."
		return
	}
}