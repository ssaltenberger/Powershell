# Load Required Assemblies
[void] [System.Reflection.Assembly]::LoadWithPartialName("system.windows.forms")

# Load required files
. .\DefaultGroups.ps1
. .\CimcorpUserFunctions.ps1

# Create Listview of Departments
function Get-Departments {
	$ListView_Departments.Items.Clear()
	$ListView_Departments.Columns.Clear()
	
	## Add column header for Departments
	$ListView_Departments.Columns.Add("Departments") | Out-Null
	
	## Go through each department in CCNADepartments array and add it as a subitem for the ListView_Departments column
	Foreach ($Department in $CCNADepartments) {
		
		$DepartmentListViewItem = New-Object System.Windows.Forms.ListViewItem($Department)
		
		$DepartmentListViewItem.subitems.add($Department) | out-null
		
		$ListView_Departments.items.add($DepartmentListViewItem) | Out-Null
	}
	$ListView_Departments.autoresizecolumns("HeaderSize")
}

# Gather Information from the form and pass it into variables
function Collect-Info {
	$DepartmentNumber  = $ListView_Departments.SelectedIndices
	$Password  		   = $TextBox_Password.text
	$FirstName 		   = $TextBox_FirstName.text
	$LastName  		   = $TextBox_LastName.text
	$JobTitle 		   = $TextBox_JobTitle.text
	[string]$Phone     = $TextBox_Phone.text

	Return $DepartmentNumber, $Password, $FirstName, $LastName, $JobTitle, $Phone
}

function Reset-Form {

	# clear text box for first name
	$TextBox_FirstName.Clear()
	
	# clear text box for last name
	$TextBox_LastName.Clear()
		
	# clear text box for password
	$TextBox_Password.Clear()
	
	# clear text box for Job Title
	$TextBox_JobTitle.Clear()
	
	# clear text box for Phone
	$TextBox_Phone.Clear()
	
}

# Drawing forms and controls
$Form_NewUser = New-Object System.Windows.Forms.Form
	$Form_NewUser.Text = "New Cimcorp North America Employee"
	$Form_NewUser.Size = New-Object System.Drawing.Size(700,550)
	$Form_NewUser.FormBorderStyle = "FixedDialog"
	$Form_NewUser.TopMost = $False
	$Form_NewUser.MaximizeBox = $True
	$Form_NewUser.MinimizeBox = $True
	$Form_NewUser.ControlBox = $True
	$Form_NewUser.StartPosition = "CenterScreen"
	$Form_NewUser.Font = New-Object System.Drawing.Font("Segoe UI", 12)
	
# Adding a label to the forms
$Label_NewUser = New-Object System.Windows.Forms.Label
	$Label_NewUser.Location = New-Object System.Drawing.Size(8,8)
	$Label_NewUser.Size = New-Object System.Drawing.Size(340,32)
	$Label_NewUser.TextAlign = "MiddleLeft"
	$Label_NewUser.Text = "New Cimcorp North America Employee"
	$Form_NewUser.Controls.Add($Label_NewUser)

# Add a list view
$ListView_Departments = New-Object System.Windows.Forms.ListView
	$ListView_Departments.Location = New-Object System.Drawing.Size(8,40)
	$ListView_Departments.Size = New-Object System.Drawing.Size(300,400)
	$ListView_Departments.Anchor = [System.Windows.Forms.AnchorStyles]::Bottom -bor
	[System.Windows.Forms.AnchorStyles]::Left -bor
	[System.Windows.Forms.AnchorStyles]::Right -bor
	[System.Windows.Forms.AnchorStyles]::Top
	$ListView_Departments.View = "Details"
	$ListView_Departments.FullRowSelect = $True
	$ListView_Departments.MultiSelect = $False
	$ListView_Departments.HideSelection = $False
	$ListView_Departments.AllowColumnReorder = $False
	$ListView_Departments.Gridlines = $True
	#$ListView_Departments.Columns.Add("Departments")
	$Form_NewUser.Controls.Add($ListView_Departments)

# Add label for first name
$Label_FirstName = New-Object System.Windows.Forms.Label
$Label_FirstName.Location = New-Object System.Drawing.size(340,40)
$Label_FirstName.Size = New-Object System.Drawing.Size(100,20)
$Label_FirstName.Text = 'First Name:'
$Form_NewUser.Controls.Add($Label_FirstName)

# Add text box for first name
$TextBox_FirstName = New-Object System.Windows.Forms.TextBox
	$TextBox_FirstName.Location = New-Object System.Drawing.Size(340,80)
	$TextBox_FirstName.Size = New-Object System.Drawing.Size(260,20)
	$Form_NewUser.Controls.Add($TextBox_FirstName)

# Add label for last name
$Label_LastName = New-Object System.Windows.Forms.Label
$Label_LastName.Location = New-Object System.Drawing.size(340,120)
$Label_LastName.Size = New-Object System.Drawing.Size(100,20)
$Label_LastName.Text = 'Last Name:'
$Form_NewUser.Controls.Add($Label_LastName)

# Add text box for last name
$TextBox_LastName = New-Object System.Windows.Forms.TextBox
	$TextBox_LastName.Location = New-Object System.Drawing.Size(340,160)
	$TextBox_LastName.Size = New-Object System.Drawing.Size(260,20)
	$Form_NewUser.Controls.Add($TextBox_LastName)

# Add label for password
$Label_Password = New-Object System.Windows.Forms.Label
$Label_Password.Location = New-Object System.Drawing.size(340,200)
$Label_Password.Size = New-Object System.Drawing.Size(100,20)
$Label_Password.Text = 'Password:'
$Form_NewUser.Controls.Add($Label_Password)
	
# Add text box for password
$TextBox_Password = New-Object System.Windows.Forms.MaskedTextBox
	$TextBox_Password.PasswordChar = '*'
	$TextBox_Password.Location = New-Object System.Drawing.Size(340,240)
	$TextBox_Password.Size = New-Object System.Drawing.Size(260,20)
	$Form_NewUser.Controls.Add($TextBox_Password)

# Add label for Job Title
$Label_JobTitle = New-Object System.Windows.Forms.Label
$Label_JobTitle.Location = New-Object System.Drawing.size(340,280)
$Label_JobTitle.Size = New-Object System.Drawing.Size(100,20)
$Label_JobTitle.Text = 'Job Title:'
$Form_NewUser.Controls.Add($Label_JobTitle)

# Add text box for Job Title
$TextBox_JobTitle = New-Object System.Windows.Forms.TextBox
	$TextBox_JobTitle.Location = New-Object System.Drawing.Size(340,320)
	$TextBox_JobTitle.Size = New-Object System.Drawing.Size(260,20)
	$Form_NewUser.Controls.Add($TextBox_JobTitle)

# Add label for Phone Extension
$Label_Phone = New-Object System.Windows.Forms.Label
$Label_Phone.Location = New-Object System.Drawing.size(340,360)
$Label_Phone.Size = New-Object System.Drawing.Size(200,20)
$Label_Phone.Text = 'Phone Extension:'
$Form_NewUser.Controls.Add($Label_Phone)

# Add text box for Job Title
$TextBox_Phone = New-Object System.Windows.Forms.TextBox
	$TextBox_Phone.Location = New-Object System.Drawing.Size(340,400)
	$TextBox_Phone.Size = New-Object System.Drawing.Size(260,20)
	$Form_NewUser.Controls.Add($TextBox_Phone)


# Add a button
$button_User = New-Object System.Windows.Forms.Button
    $button_User.Location = New-Object System.Drawing.Size(210,450)
    $button_User.size = New-Object System.Drawing.Size(240,32)
    $button_User.Anchor = [System.Windows.Forms.AnchorStyles]::Bottom -bor
    [System.Windows.Forms.AnchorStyles]::Left
    $button_User.TextAlign = "MiddleCenter"
    $button_User.Text = "Create New User"
    $button_User.Add_Click({
		$DepartmentNumber, $Password, $FirstName, $LastName, $JobTitle, $Phone = Collect-Info
        Create-User $DepartmentNumber $JobTitle $Password $FirstName $LastName $Phone
		Reset-Form
    })
    $Form_NewUser.Controls.Add($button_User)


# Show form
$Form_NewUser.Add_Shown({
	$Form_NewUser.activate()
	Get-Departments
})
[void] $Form_NewUser.ShowDialog()