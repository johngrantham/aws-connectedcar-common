
. "./config.ps1"

$invokeDDBQuery = @{
    TableName = "${service}_Timeslot_Table_${environment}"
    KeyConditionExpression = ' dealerId = :dealerId'
    ExpressionAttributeValues = @{
        ':dealerId' = "eb506708-0707-441a-932d-2b853d03c553"
    } | ConvertTo-DDBItem
}
Invoke-DDBQuery @invokeDDBQuery | ConvertFrom-DDBItem
