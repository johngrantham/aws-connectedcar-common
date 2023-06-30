
Import-Module AWSPowerShell.NetCore

$ErrorActionPreference = "Stop"

$account=(Get-STSCallerIdentity).Account
$region="us-west-2"

$service="ConnectedCar"
$serviceLower="connectedcar"
$environment="Dev"
$environmentLower="dev"

$number=(Get-Date -UFormat "%H%M%S")

Set-DefaultAWSRegion -Region ${region}
