#!/bin/zsh

source config.zsh

time=$(date -u -v-10M +"%Y-%m-%dT%H:%M:%S")

aws dynamodb restore-table-to-point-in-time \
  --source-table-name ${service}_Dealer_Table_${environment} \
  --target-table-name ${service}_Dealer_Table_${environment}_Restored \
  --restore-date-time ${time}

