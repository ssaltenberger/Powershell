[reflection.assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null
[System.Windows.Forms.Application]::EnableVisualStyles()

$usersForm = New-Object System.Windows.Forms.Form
$usersForm.text = "Users Form"
$usersform.FormBorderStyle = 'Fixed3D'
$usersForm.MaximizeBox = $false
$usersForm.StartPosition = "CenterScreen"
$usersForm.size = New-Object System.Drawing.Size(700,400)

$firstNameTextBox = New-Object System.Windows.Forms.TextBox
$lastNameTextBox = New-Object System.Windows.Forms.TextBox

$firstNameLabel = New-Object System.Windows.Forms.Label
$lastNameLabel = New-Object System.Windows.Forms.Label

$firstNameLabel.text = "First Name:"
$lastNameLabel.text = "Last Name:"

$firstNameLabel.Size = "65,23"
$firstNameTextBox.Size = "120,23"
$lastNameLabel.Size = "65,23"
$lastNameTextBox.Size = "120,23"

$firstNameLabel.Location = "5,25"
$firstNameTextBox.location = "75,23"
$lastNameLabel.Location = "215,25"
$lastNameTextBox.Location = "295,23"


$firstNameTextBox.text = "FirstName"
$lastNameTextBox.text = "LastName"

$usersForm.Controls.Add($firstNameLabel)
$usersForm.Controls.Add($lastNameLabel)
$usersForm.Controls.Add($firstNameTextBox)
$usersForm.Controls.Add($lastNameTextBox)

$usersForm.ShowDialog()