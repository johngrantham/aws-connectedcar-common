
. "./config.ps1"

$scanFilter = @{
  stateCode = [Amazon.DynamoDBv2.Model.Condition]@{
    AttributeValueList = @(@{N = "41"})
    ComparisonOperator = 'EQ'
    }
}
    
Invoke-DDBScan -TableName "${service}_Dealer_Table_${environment}" -ScanFilter $scanFilter | ConvertFrom-DDBItem
