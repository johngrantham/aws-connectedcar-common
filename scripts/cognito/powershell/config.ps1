
Import-Module AWSPowerShell.NetCore

$account=(Get-STSCallerIdentity).Account
$region="us-west-2"

$service="ConnectedCar"
$environment="Dev"

$username="USER1234567890"
$password="#FrogMelt903"

Set-DefaultAWSRegion -Region ${region}
