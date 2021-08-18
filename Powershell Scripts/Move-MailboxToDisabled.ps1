Get-MigrationBatch | foreach {
	if ($_.identity -eq "AutomatedDisabledMove") {
		Remove-MigrationBatch -identity "AutomatedDisabledMove"
	}
}

$mailboxes = get-mailbox | 
	where {(($_.identity -like "*disabled*") -or ($_.identity -like "*resigned*"))-and ($_.database -ne "CC Disabled Database")} | 
	select -Property primarysmtpaddress, DisplayName, database, identity |
	Format-List |
	out-string

$body = "The following mailboxes will be move to the CC Disabled Database: `n" + $mailboxes

Send-MailMessage -To "steven.saltenberger@cimcorp.com" -From "CCNA_NetworkAdmin@cimcorp.com" -Subject "Automated Mailbox Moves" -Body $body -SMTPServer webmail.cimcorp.com -port 587

#write-host $body
get-mailbox | 
	where {(($_.identity -like "*disabled*") -or ($_.identity -like "*resigned*"))-and ($_.database -ne "CC Disabled Database")} | 
	New-MoveRequest -TargetDatabase "CC Disabled Database" -BatchName AutomatedDisabledMove -Priority Highest