
. "./config.ps1"

$bucket="${serviceLower}-terraform-${number}"
$table="${service}_Terraform_LockingTable"

New-S3Bucket -BucketName ${bucket}

Add-S3PublicAccessBlock `
  -BucketName ${bucket} `
  -PublicAccessBlockConfiguration_BlockPublicAcl $true `
  -PublicAccessBlockConfiguration_BlockPublicPolicy $true `
  -PublicAccessBlockConfiguration_IgnorePublicAcl $true `
  -PublicAccessBlockConfiguration_RestrictPublicBucket $true

Write-S3BucketVersioning `
  -BucketName ${bucket} `
  -VersioningConfig_Status Enabled

New-DDBTableSchema `
  | Add-DDBKeySchema -KeyName "LockID" -KeyDataType "S" `
  | New-DDBTable ${table} -BillingMode PAY_PER_REQUEST