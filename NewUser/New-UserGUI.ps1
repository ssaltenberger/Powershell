# Load Required Assemblies
[void] [System.Reflection.Assembly]::LoadWithPartialName("system.windows.forms")

# Load required files
. .\DefaultGroups.ps1
. .\CimcorpUserFunctions.ps1

# Get admin credentials
$Credential = get-credential

#Drawing forms and controls
$Form_NewUser = New-Object System.Windows.Forms.Form
	$Form_NewUser.Text = "New Cimcorp North America Employee"
	$Form_NewUser.Size = New-Object System.Drawing.Size(600,400)
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

# Add a button
$button_Hosts = New-Object System.Windows.Forms.Button
    $button_User.Location = New-Object System.Drawing.Size(8,450)
    $button_User.size = New-Object System.Drawing.Size(240,32)
    $button_User.Anchor = [System.Windows.Forms.AnchorStyles]::Bottom -bor
    [System.Windows.Forms.AnchorStyles]::Left
    $button_User.TextAlign = "MiddleCenter"
    $button_User.Text = "Refresh ESXI Host List"
    $button_User.Add_Click({
        Create-User($Credential)
    })
    $Form_NewUser.Controls.Add($button_User)


# Show form
$Form_NewUser.Add.Shown({
	$Form_NewUser.activate()
})
[void] $Form_NewUser.ShowDialog()