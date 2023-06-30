
. "./config.ps1"

$bucket="${serviceLower}-deployment-${number}"

New-S3Bucket -BucketName ${bucket}

Add-S3PublicAccessBlock `
  -BucketName ${bucket} `
  -PublicAccessBlockConfiguration_BlockPublicAcl $true `
  -PublicAccessBlockConfiguration_BlockPublicPolicy $true `
  -PublicAccessBlockConfiguration_IgnorePublicAcl $true `
  -PublicAccessBlockConfiguration_RestrictPublicBucket $true
