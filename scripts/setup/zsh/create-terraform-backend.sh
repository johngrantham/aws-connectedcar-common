#!/bin/zsh

source config.sh

bucket="${serviceLower}-terraform-${number}"
table="${service}_Terraform_LockingTable"

aws s3api create-bucket \
  --bucket ${bucket} \
  --region ${region} \
  --create-bucket-configuration LocationConstraint=${region} \
  --acl private

aws s3api put-public-access-block \
  --bucket ${bucket} \
  --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"

aws s3api put-bucket-versioning\
  --bucket ${bucket} \
  --versioning-configuration Status=Enabled

aws dynamodb create-table \
  --table-name ${table} \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST