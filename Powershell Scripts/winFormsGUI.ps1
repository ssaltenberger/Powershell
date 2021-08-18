#region script demo

$path = Read-Host 'Enter the new directory name '
test-path $path
if (Test-Path $path) {
    remove-item $path
}
test-path $path

#endregion

#region Prereqs...

[reflection.assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null

#endregion

#region basic form...

$basicForm = New-Object System.Windows.Forms.Form
$basicForm.ShowDialog()

#endregion

#region insert text box...

$folderForm = New-Object System.Windows.Forms.Form
$pathTextBox = New-Object System.Windows.Forms.TextBox

$PathTextBox.Location = '23,23'
$pathTextBox.Size = '150,23'

$folderForm.Controls.Add($pathTextBox)

$folderForm.ShowDialog()

#endregion

#region insert button...

$selectButton = New-Object System.Windows.Forms.Button
$selectButton.Text = 'Select'
$selectButton.Location = '196,23'

$folderForm.Controls.Add($selectButton)

$folderForm.ShowDialog()

#endregion

#region add action...

$folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog

$selectButton.Add_Click({
    $folderBrowser.ShowDialog()
    $pathTextBox.Text = $folderBrowser.SelectedPath
})

$pathTextBox.ReadOnly = $true

$folderForm.ShowDialog()

#endregion

#region add script button

$removeButton = New-Object System.Windows.Forms.Button

$removeButton.Location ='26,52'
$removeButton.text = 'Remove'

$removeButton.Add_Click({
    if($folderBrowser.SelectedPath){
        if(Test-Path $folderBrowser.SelectedPath){
            remove-item $folderBrowser.SelectedPath
        }
    }
})

$folderForm.Controls.Add($removeButton)
$folderForm.ShowDialog()

#endregion

#region final touches

#region reused code

$folderForm = New-Object System.Windows.Forms.Form
$pathTextBox = New-Object System.Windows.Forms.TextBox
$PathTextBox.Location = '23,23'
$pathTextBox.Size = '150,23'
$folderForm.Controls.Add($pathTextBox)
$selectButton = New-Object System.Windows.Forms.Button
$selectButton.Text = 'Select'
$selectButton.Location = '196,23'
$folderForm.Controls.Add($selectButton)
$removeButton = New-Object System.Windows.Forms.Button
$removeButton.Location ='26,52'
$removeButton.text = 'Remove'
$removeButton.Add_Click({
    if($folderBrowser.SelectedPath){
        if(Test-Path $folderBrowser.SelectedPath){
            remove-item $folderBrowser.SelectedPath
        }
    }
})
$folderForm.Controls.Add($removeButton)

#endregion

$okButton = New-Object System.Windows.Forms.Button
$cancelButton = New-Object System.Windows.Forms.Button

$okButton.text = 'OK'
$okButton.Location = "56,215"

$cancelButton.Text = 'Cancel'
$cancelButton.Location = "153,215"

$folderForm.AcceptButton = $okButton
$folderForm.CancelButton = $cancelButton

$folderForm.Controls.Add($okButton)
$folderForm.Controls.Add($cancelButton)

$folderForm.Text = 'Folder Form'

$folderForm.ShowDialog()

#endregion