# Load Required Assemblies
[void] [System.Reflection.Assembly]::LoadWithPartialName("system.windows.forms")

# Add Function to get processes
Function GetProcesses {

    $listview_processes.Items.Clear()
    $listview_processes.Columns.Clear()

    $Processes = Get-Process | Select-Object Id,ProcessName,Handles,NPM,PM,WS,CPU,Path

    $ProcessProperties = $Processes[0].psObject.Properties

    $ProcessProperties | ForEach-Object {
        $listview_processes.Columns.Add("$($_.Name)") | Out-Null
    }

    ForEach ($Process in $Processes){
        $ProcessListViewItem = New-Object System.Windows.Forms.ListViewItem($Process.Id)

        $Process.psobject.Properties | Where {$_.name -ne "Id"} | ForEach-Object {
            $ColumnName = $_.name
            $ProcessListViewItem.SubItems.add("$($Process.$ColumnName)") | Out-Null
        }

        $listview_processes.Items.Add($ProcessListViewItem) | Out-Null

    }

    $listview_processes.AutoResizeColumns("HeaderSize")

}

# Function to End Processes
Function EndProcesses {

    $SelectedProcesses =@($listview_processes.SelectedIndices)

    $IdColumnIndex = $listview_processes.Columns | Where {$_.Text -eq "Id"} | Select-Object -ExpandProperty Index

    $SelectedProcesses | ForEach-Object {

        $ProcessID = ($listview_processes.Items[$_].SubItems[$IdColumnIndex]).Text

        Stop-Process -Id $ProcessID -Confirm:$false -Force -WhatIf

    }

    GetProcesses

}

# Drawing forms and controls
$Form_HelloWorld = New-Object System.Windows.Forms.Form
    $Form_HelloWorld.text = "Hello World"
    $Form_HelloWorld.size = New-Object System.Drawing.Size(832,528)
    $Form_HelloWorld.FormBorderStyle = "FixedDialog"
    $Form_HelloWorld.TopMost = $false
    $Form_HelloWorld.MaximizeBox = $true
    $Form_HelloWorld.MinimizeBox = $ftrue
    $Form_HelloWorld.ControlBox = $true
    $Form_HelloWorld.StartPosition = "CenterScreen"
    $Form_HelloWorld.Font = New-Object System.Drawing.Font("Segoe UI", 12)

# Adding a label to the form
$label_HelloWorld = New-Object System.Windows.Forms.Label
    $label_HelloWorld.location = New-Object System.Drawing.Size(8,8)
    $label_HelloWorld.Size = New-Object System.Drawing.size(240,32)
    $label_HelloWorld.TextAlign = "MiddleLeft"
    $label_HelloWorld.text = "Process List:"
    $Form_HelloWorld.Controls.Add($label_HelloWorld)

# Add a List View
$listview_processes = New-Object System.Windows.Forms.ListView
    $listview_processes.location = New-Object system.drawing.size(8,40)
    $listview_processes.size = New-Object System.Drawing.Size(800,402)
    $listview_processes.Anchor = [System.Windows.Forms.AnchorStyles]::Bottom -bor
    [System.Windows.Forms.AnchorStyles]::Left -bor
    [System.Windows.Forms.AnchorStyles]::Right -bor
    [System.Windows.Forms.AnchorStyles]::Top
    $listview_processes.view = "Details"
    $listview_processes.FullRowSelect = $true
    $listview_processes.MultiSelect = $true
    $listview_processes.AllowColumnReorder = $true
    $listview_processes.GridLines = $true
    $Form_HelloWorld.controls.add($listview_processes)

# Add a button
$button_ClickMe = New-Object System.Windows.Forms.Button
    $button_ClickMe.Location = New-Object System.Drawing.Size(8,450)
    $button_ClickMe.size = New-Object System.Drawing.Size(240,32)
    $button_ClickMe.Anchor = [System.Windows.Forms.AnchorStyles]::Bottom -bor
    [System.Windows.Forms.AnchorStyles]::Left
    $button_ClickMe.TextAlign = "MiddleCenter"
    $button_ClickMe.Text = "Refresh Process List"
    $button_ClickMe.Add_Click({
        GetProcesses
    })
    $Form_HelloWorld.Controls.Add($button_ClickMe)

# Add a button
$button_EndProcess = New-Object System.Windows.Forms.Button
    $button_EndProcess.Location = New-Object System.Drawing.Size(568,450)
    $button_EndProcess.size = New-Object System.Drawing.Size(240,32)
    $button_EndProcess.Anchor = [System.Windows.Forms.AnchorStyles]::Bottom -bor
    [System.Windows.Forms.AnchorStyles]::right
    $button_EndProcess.TextAlign = "MiddleCenter"
    $button_EndProcess.Text = "End Selected Process(es)"
    $button_EndProcess.Add_Click({
        EndProcesses
    })
    $Form_HelloWorld.Controls.Add($button_EndProcess)

# Show Form
$Form_HelloWorld.Add_Shown({
    $Form_HelloWorld.activate()
    GetProcesses
})
[void] $Form_HelloWorld.ShowDialog()