 . D:\IT\Training\Powershell\DefaultGroups.ps1

Clear-Host
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

Write-host "`nThe security groups for a member of" $DepartmentSelection "are...`n"

switch ($DepartmentNumber) {
    0  { $CCNASecAdmnistration        | ForEach-Object {write-host $_} }
    1  { $CCNASecApplications         | ForEach-Object {write-host $_} }
    2  { $CCNASecCS                   | ForEach-Object {write-host $_} }
    3  { $CCNASecEngineering          | ForEach-Object {write-host $_} }
    4  { $CCNASecHR                   | ForEach-Object {write-host $_} }
    5  { $CCNASecIT                   | ForEach-Object {write-host $_} }
    6  { $CCNASecProcurement          | ForEach-Object {write-host $_} }
    7  { $CCNASecProduction           | ForEach-Object {write-host $_} }
    8  { $CCNASecElectrician          | ForEach-Object {write-host $_} }
    9  { $CCNASecAutomationSpecialist | ForEach-Object {write-host $_} }
    10 { $CCNASecPM                   | ForEach-Object {write-host $_} }
    11 { $CCNASecQHSE                 | ForEach-Object {write-host $_} }
    12 { $CCNASecSales                | ForEach-Object {write-host $_} }
    13 { $CCNASecMarketing            | ForEach-Object {write-host $_} }
    14 { $CCNASecAppDev               | ForEach-Object {write-host $_} }
    15 { $CCNASecRSI                  | ForEach-Object {write-host $_} }
    16 { $CCNASecSoftwareSupport      | ForEach-Object {write-host $_} }
    17 { $CCNASecWarehouse            | ForEach-Object {write-host $_} }
}

Write-host "`nThe distribution groups for a member of" $DepartmentSelection "are...`n"

switch ($DepartmentNumber) {
    0  { $CCNADistAdmnistration        | ForEach-Object {write-host $_} }
    1  { $CCNADistApplications         | ForEach-Object {write-host $_} }
    2  { $CCNADistCS                   | ForEach-Object {write-host $_} }
    3  { $CCNADistEngineering          | ForEach-Object {write-host $_} }
    4  { $CCNADistHR                   | ForEach-Object {write-host $_} }
    5  { $CCNADistIT                   | ForEach-Object {write-host $_} }
    6  { $CCNADistProcurement          | ForEach-Object {write-host $_} }
    7  { $CCNADistProduction           | ForEach-Object {write-host $_} }
    8  { $CCNADistElectrician          | ForEach-Object {write-host $_} }
    9  { $CCNADistAutomationSpecialist | ForEach-Object {write-host $_} }
    10 { $CCNADistPM                   | ForEach-Object {write-host $_} }
    11 { $CCNADistQHSE                 | ForEach-Object {write-host $_} }
    12 { $CCNADistSales                | ForEach-Object {write-host $_} }
    13 { $CCNADistMarketing            | ForEach-Object {write-host $_} }
    14 { $CCNADistAppDev               | ForEach-Object {write-host $_} }
    15 { $CCNADistRSI                  | ForEach-Object {write-host $_} }
    16 { $CCNADistSoftwareSupport      | ForEach-Object {write-host $_} }
    17 { $CCNADistWarehouse            | ForEach-Object {write-host $_} }
}