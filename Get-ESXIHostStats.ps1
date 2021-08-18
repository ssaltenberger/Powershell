# Load Required Assemblies
[void] [System.Reflection.Assembly]::LoadWithPartialName("system.windows.forms")

# Connect to vSphere
#$credential = Get-Credential
Connect-VIServer -Server CCNAVCENTRE01.Cimcorp5.com -erroraction silentlycontinue #-Credential $credential

# Add Function to get ESXI Hosts
Function GetHosts {

    $listview_hosts.Items.Clear()
    $listview_hosts.Columns.Clear()

    $hostStats = get-vmhost | Sort-Object -Property Name | Select-Object -property Name,PowerState,
        @{N = 'Memory Usage (%)';E = {(($_.MemoryUsageGB -as [int]) / ($_.MemoryTotalGB -as[int])).tostring("P")}},
        @{N = 'CPU Usage (%)';E = {(($_.cpuusagemhz -as [int]) / ($_.cputotalmhz -as [int])).tostring("P")}},
        @{N = 'Hosted VMs';E = {($_ | get-vm).count}},
        @{N = 'Active VMs';E = {($_ | get-vm | where {$_.PowerState -eq "PoweredOn"}).count}}
	
	## Select properties of the first object (VM) in the HostStats array
    $HostProperties = $hostStats[0].psobject.properties

	## Name the columns based on each of he property names
    $HostProperties | ForEach-Object {
        $listview_hosts.Columns.Add("$($_.Name)") | Out-Null
    }

    Foreach ($ESXIhost in $hostStats) {

        $HostListViewItem = New-Object System.Windows.Forms.ListViewItem($ESXIhost.Name)

        $ESXIhost.psobject.Properties | Where {$_.name -ne "Name"} | ForEach-Object {
            $ColumnName = $_.name
            $HostListViewItem.SubItems.Add("$($ESXIhost.$ColumnName)") | Out-Null
        }

        $listview_hosts.items.add($HostListViewItem) | Out-Null

    }

    $listview_hosts.autoresizecolumns("HeaderSize")

}

# Function to End Processes
Function GetVMs {

    $SelectedHost = $listview_hosts.SelectedIndices

    $NameColumnIndex = $listview_hosts.Columns | where {$_.text -eq "Name"} | Select -ExpandProperty Index

    $SelectedHost | ForEach-Object {

        $Host_Name = ($listview_hosts.Items[$_].SubItems[$NameColumnIndex]).text
        $newString = "VMS on " + $Host_Name
        $Label_ESXIHosts.text = $newString    

        $listview_hosts.Items.Clear()
        $listview_hosts.Columns.Clear()

        $VMProperties = get-vm | where {$_.VMHost -like $Host_name} | sort -Property @{E = {$_.powerstate};A = 0},name | Select -Property name,powerstate,MemoryGB,NumCPU,
            @{N = 'Storage';E = {[math]::round(($_.provisionedspacegb),2)}},
            @{N = 'Address';E = {(get-vm -name $_).guest.IPAddress[0]}}
            
#        $VMProperties | ForEach-Object {
#            $listview_hosts.Columns.Add("$($_.Name)") | Out-Null
#        }

        $listview_hosts.Columns.Add("VM Name") | Out-Null
        $listview_hosts.Columns.Add("Power State") | Out-Null
        $listview_hosts.Columns.Add("Memory (in GB)") | Out-Null
        $listview_hosts.Columns.Add("Number of CPUs") | Out-Null
        $listview_hosts.Columns.Add("Storage Capacity (in GB)") | Out-Null
        $listview_hosts.Columns.Add("IP Address") | Out-Null

        Foreach ($VM in $VMProperties) {
            $VMListViewItem = New-Object System.Windows.Forms.ListViewItem($VM.name)
            $VMListViewItem.SubItems.Add("$($VM.powerstate)")
            $VMListViewItem.SubItems.Add("$($VM.MemoryGB)")
            $VMListViewItem.SubItems.Add("$($VM.numCPU)")
            $VMListViewItem.SubItems.Add("$($VM.Storage)")
            $VMListViewItem.subItems.Add("$($VM.Address)")
            $listview_hosts.Items.Add($VMListViewItem) | Out-Null
        }
    }

    $listview_hosts.autoresizecolumns("HeaderSize")
}

# Drawing forms and controls
$Form_ESXIHosts = New-Object System.Windows.Forms.Form
    $Form_ESXIHosts.text = "CCNAVCENTRE01"
    $Form_ESXIHosts.size = New-Object System.Drawing.Size(972,528)
    $Form_ESXIHosts.FormBorderStyle = "FixedDialog"
    $Form_ESXIHosts.TopMost = $false
    $Form_ESXIHosts.MaximizeBox = $true
    $Form_ESXIHosts.MinimizeBox = $true
    $Form_ESXIHosts.ControlBox = $true
    $Form_ESXIHosts.StartPosition = "CenterScreen"
    $Form_ESXIHosts.Font = New-Object System.Drawing.Font("Segoe UI", 12)

# Adding a label to the form
$Label_ESXIHosts = New-Object System.Windows.Forms.Label
    $Label_ESXIHosts.location = New-Object System.Drawing.Size(8,8)
    $Label_ESXIHosts.Size = New-Object System.Drawing.size(340,32)
    $Label_ESXIHosts.TextAlign = "MiddleLeft"
    $Label_ESXIHosts.text = "ESXI Host List:"
    $Form_ESXIHosts.Controls.Add($Label_ESXIHosts)

# Add a List View
$listview_hosts = New-Object System.Windows.Forms.ListView
    $listview_hosts.location = New-Object system.drawing.size(8,40)
    $listview_hosts.size = New-Object System.Drawing.Size(930,402)
    $listview_hosts.Anchor = [System.Windows.Forms.AnchorStyles]::Bottom -bor
    [System.Windows.Forms.AnchorStyles]::Left -bor
    [System.Windows.Forms.AnchorStyles]::Right -bor
    [System.Windows.Forms.AnchorStyles]::Top
    $listview_hosts.view = "Details"
    $listview_hosts.FullRowSelect = $true
    $listview_hosts.MultiSelect = $false
    $listview_hosts.AllowColumnReorder = $true
    $listview_hosts.GridLines = $true
    $Form_ESXIHosts.controls.add($listview_hosts)

# Add a button
$button_Hosts = New-Object System.Windows.Forms.Button
    $button_Hosts.Location = New-Object System.Drawing.Size(8,450)
    $button_Hosts.size = New-Object System.Drawing.Size(240,32)
    $button_Hosts.Anchor = [System.Windows.Forms.AnchorStyles]::Bottom -bor
    [System.Windows.Forms.AnchorStyles]::Left
    $button_Hosts.TextAlign = "MiddleCenter"
    $button_Hosts.Text = "Refresh ESXI Host List"
    $button_Hosts.Add_Click({
        GetHosts
    })
    $Form_ESXIHosts.Controls.Add($button_Hosts)

# Add a button
$button_VMs = New-Object System.Windows.Forms.Button
    $button_VMs.Location = New-Object System.Drawing.Size(698,450)
    $button_VMs.size = New-Object System.Drawing.Size(240,32)
    $button_VMs.Anchor = [System.Windows.Forms.AnchorStyles]::Bottom -bor
    [System.Windows.Forms.AnchorStyles]::Right
    $button_VMs.TextAlign = "MiddleCenter"
    $button_VMs.Text = "Find VMs on Select Host"
    $button_VMs.Add_Click({
        GetVMs
    })
    $Form_ESXIHosts.Controls.Add($button_VMs)

# Show Form
$Form_ESXIHosts.Add_Shown({
    $Form_ESXIHosts.activate()
    GetHosts
})
[void] $Form_ESXIHosts.ShowDialog()