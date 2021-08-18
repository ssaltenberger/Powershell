# Load Required Assemblies
[void] [System.Reflection.Assembly]::LoadWithPartialName("system.windows.forms")

# Drawing forms and controls
$Form_HelloWorld = New-Object System.Windows.Forms.Form
    $Form_HelloWorld.text = "Hello World"
    $Form_HelloWorld.size = New-Object System.Drawing.Size(272,160)
    $Form_HelloWorld.FormBorderStyle = "FixedDialog"
    $Form_HelloWorld.TopMost = $true
    $Form_HelloWorld.MaximizeBox = $false
    $Form_HelloWorld.MinimizeBox = $false
    $Form_HelloWorld.ControlBox = $true
    $Form_HelloWorld.StartPosition = "CenterScreen"
    $Form_HelloWorld.Font = New-Object System.Drawing.Font("Segoe UI", 12)

# Adding a label to the form
$label_HelloWorld = New-Object System.Windows.Forms.Label
    $label_HelloWorld.location = New-Object System.Drawing.Size(8,8)
    $label_HelloWorld.Size = New-Object System.Drawing.size(240,32)
    $label_HelloWorld.TextAlign = "MiddleCenter"
    $label_HelloWorld.text = "Hello World"
    $Form_HelloWorld.Controls.Add($label_HelloWorld)

# Add a button
$button_ClickMe = New-Object System.Windows.Forms.Button
    $button_ClickMe.Location = New-Object System.Drawing.Size(8,80)
    $button_ClickMe.size = New-Object System.Drawing.Size(240,32)
    $button_ClickMe.TextAlign = "MiddleCenter"
    $button_ClickMe.Text = "Click Me!"
    $button_ClickMe.Add_Click({
        $button_ClickMe.Text = "I've Been Clicked!"
        Start-Process calc.exe
    })
    $Form_HelloWorld.Controls.Add($button_ClickMe)


# Show Form
$Form_HelloWorld.Add_Shown({$Form_HelloWorld.activate()})
[void] $Form_HelloWorld.ShowDialog()