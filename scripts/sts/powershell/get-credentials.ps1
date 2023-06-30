
Import-Module AWSPowerShell.NetCore

Get-STSSessionToken -DurationInSeconds 3600 | Format-List
