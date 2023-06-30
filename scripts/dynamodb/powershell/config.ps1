
Import-Module AWSPowerShell.NetCore

$ErrorActionPreference = "Stop"

$account=(Get-STSCallerIdentity).Account
$region="us-west-2"

$service="ConnectedCar"
$environment="Dev"

Set-DefaultAWSRegion -Region ${region}
