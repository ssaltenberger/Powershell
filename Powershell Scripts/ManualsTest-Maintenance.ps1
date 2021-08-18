$Filenames = Get-ChildItem -path '.\' -Name

$location = get-location
$location = $location.ToString()
$DirectoryArray = @()
$DirectoryArray = $location.Split("\")
$Directory = $DirectoryArray[-1]
$Directory

new-item -Path $location -name "3rdPartyManuals$Directory.htm"
$webpage = Get-ChildItem -name *.htm

"<html>" >> $webpage
"<head><title>PHARO Online Help</title></head>" >> $webpage
"<body style='background-color:#f5f5f5'>" >> $webpage

#The Title of the page needs to be changed to represent the appropriate set of drawings
"<h1 style='font-size:30px;text-align:center;'>$Directory</h1>" >> $webpage

foreach ($line in $filenames) {
    #Manuals\3rdParty\COMPANY\ needs to be changed to the appropriate MANUALS folder
    $FileSplit = @()
    $FileSplit = $line.split(".")
    $Filename = $filesplit[0]
    $Filename

    "<a target='main' href='Manuals/Cimcorp/Maintenance'" + $line + "'.pdf'>" + $Filename + "</a><br><br><br>" >> $webpage
}
