#!/bin/zsh

source config.zsh

role="APIGatewayCloudWatchLogsRole"

aws iam create-role \
  --region ${region} \
  --role-name ${role} \
  --assume-role-policy-document '{"Version": "2012-10-17", "Statement": {"Effect": "Allow", "Principal": {"Service": "apigateway.amazonaws.com"}, "Action": "sts:AssumeRole"}}'

aws iam attach-role-policy \
  --region ${region} \
  --role-name ${role} \
  --policy-arn "arn:aws:iam::aws:policy/service-role/AmazonAPIGatewayPushToCloudWatchLogs"

sleep 60

aws apigateway update-account \
  --region ${region} \
  --patch-operations "op='replace',path='/cloudwatchRoleArn',value='arn:aws:iam::${account}:role/${role}'"
