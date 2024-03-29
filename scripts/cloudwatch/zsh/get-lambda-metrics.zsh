#!/bin/zsh

source config.zsh

start=$(date -u -v-60M +"%Y-%m-%dT%H:%M:%S")
end=$(date -u +"%Y-%m-%dT%H:%M:%S")

dimensions="Name=FunctionName,Value=${service}_Admin_GetDealers_${environment}"

aws cloudwatch get-metric-statistics \
    --namespace AWS/Lambda \
    --metric-name Duration \
    --dimensions ${dimensions} \
    --start-time ${start} \
    --end-time ${end} \
    --period 3600 \
    --statistics Average \
    --output json
