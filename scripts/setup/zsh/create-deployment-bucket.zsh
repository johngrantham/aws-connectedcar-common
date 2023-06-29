#!/bin/zsh

source config.zsh

bucket=${serviceLower}-deployment-${number}

aws s3api create-bucket \
  --bucket ${bucket} \
  --region ${region} \
  --create-bucket-configuration LocationConstraint=${region} \
  --acl private

aws s3api put-public-access-block \
  --bucket ${bucket} \
  --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"