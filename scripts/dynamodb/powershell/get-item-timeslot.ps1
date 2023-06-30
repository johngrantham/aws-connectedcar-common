
. "./config.ps1"

$key = @{
  dealerId = "eb506708-0707-441a-932d-2b853d03c553"
  serviceDateHour = "2023-05-25-10"
} | ConvertTo-DDBItem

Get-DDBItem -TableName "${service}_Timeslot_Table_${environment}" -Key $key | ConvertFrom-DDBItem