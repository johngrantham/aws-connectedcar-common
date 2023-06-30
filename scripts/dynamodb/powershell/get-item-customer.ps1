
. "./config.ps1"

$key = @{
  username = "anayamorrison244"
} | ConvertTo-DDBItem

Get-DDBItem -TableName "${service}_Customer_Table_${environment}" -Key $key | ConvertFrom-DDBItem