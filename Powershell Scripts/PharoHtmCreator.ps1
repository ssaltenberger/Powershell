#Have all the .pdf files of the drawings in the folder
#Have a .csv of the first drawing exported as TableData.csv in the folder
#If a second .csv is needed of the second drawing name it: TableData2.csv
#All .pdf files must have their names stripped down to exclude "-model" with the FileRename1.cmd script

#Check the Header Names in the .csv files and make sure that they are correct.
#Sometimes they are DWGDESC other times they are DESCRIPTION

#To Run the Script
#Copy the script into the same folder with the TableData.csv and .pdf files
#Make appropriate changes to the script's content
#Right click the script and select "Run in Powershell"

#or

#Open a powershell window in the directory and run this script with ./PharoHtmFileCreator.ps1

invoke-item D:\PHARO\FileRename1.cmd

$SecondTable = $False
$TableData = Import-Csv .\TableData.csv

if (test-path .\TableData2.csv) {
	$TableData2 = Import-Csv .\TableData2.csv
	$SecondTable = $True
}
	

$location = get-location
$location = $location.ToString()
$DirectoryArray = @()
$DirectoryArray = $location.Split("\")
$Directory = $DirectoryArray[-1]
$Directory

new-item -Path $location -name "Electrical$Directory.htm"
$webpage = Get-ChildItem -name *.htm

"<html>" >> $webpage
"<head><title>PHARO Online Help</title></head>" >> $webpage
"<body style='background-color:#f5f5f5'>" >> $webpage

#The Title of the page needs to be changed to represent the appropriate set of drawings
"<h1 style='font-size:30px;text-align:center;'>1711  Drawings</h1>" >> $webpage

foreach ($line in $TableData) {
    #Edraw\<directory>\ needs to be changed to the appropriate folder
    "<p><A href='Edraw\GantryOperatorStation\" + $line.FILENAME + ".pdf' style='color:blue;'>" + $line.FILENAME + " - " + $line.DWGDESC + " " + $line.DWGDESC2 + " " + $line.DWGDESC3 + "</A></p>" >> $webpage
}

If ($SecondTable) {
	foreach ($line in $TableData2) {
		#Edraw\<directory>\ needs to be changed to the appropriate folder
		"<p><A href='Edraw\GantryOperatorStation\" + $line.FILENAME + ".pdf' style='color:blue;'>" + $line.FILENAME + " - " + $line.DWGDESC + " " + $line.DWGDESC2 + " " + $line.DWGDESC3 + "</A></p>" >> $webpage
	}
}
	

"</body>" >> $webpage
"</html>" >>$webpage