
. "./config.ps1"

$invokeDDBQuery = @{
    TableName = "${service}_Timeslot_Table_${environment}"
    IndexName = "VehicleRegistrationIndex"
    KeyConditionExpression = ' vin = :vin'
    ExpressionAttributeValues = @{
        ':vin' = "Y927S252W504V909H"
    } | ConvertTo-DDBItem
}
Invoke-DDBQuery @invokeDDBQuery | ConvertFrom-DDBItem
