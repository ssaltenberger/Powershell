$Filenames = Get-ChildItem -path '.\' -Name

$location = get-location
$location = $location.ToString()
$DirectoryArray = @()
$DirectoryArray = $location.Split("\")
$Directory = $DirectoryArray[-1]
$Directory

new-item -Path $location -name "CimcorpManuals$Directory.htm"
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

    "<p><A href='Manuals\Cimcorp\Maintenance\Maintenance Manuals CCOY\" + $line + "'style='color:blue;'>" + $Filename + "</A></p>" >> $webpage
}
