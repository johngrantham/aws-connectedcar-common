#!/bin/zsh

source config.sh

aws dynamodb get-item \
  --table-name ${service}_Customer_Table_${environment} \
  --key '{"username": {"S": "anayamorrison244"}}'