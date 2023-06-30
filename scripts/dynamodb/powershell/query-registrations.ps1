
. "./config.ps1"

$invokeDDBQuery = @{
    TableName = "${service}_Registration_Table_${environment}"
    KeyConditionExpression = ' username = :username'
    ExpressionAttributeValues = @{
        ':username' = "anayamorrison244"
    } | ConvertTo-DDBItem
}
Invoke-DDBQuery @invokeDDBQuery | ConvertFrom-DDBItem
