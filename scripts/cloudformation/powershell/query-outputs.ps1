
. "./config.ps1"

$outputs = (Get-CFNStack -StackName "${service}${environment}").Outputs

Write-Output $outputs

Write-Host " "
