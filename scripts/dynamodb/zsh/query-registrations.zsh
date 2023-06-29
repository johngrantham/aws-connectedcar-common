#!/bin/zsh

source config.zsh

aws dynamodb query \
  --table-name ${service}_Registration_Table_${environment} \
  --key-condition-expression "username = :username" \
  --expression-attribute-values '{":username": {"S": "anayamorrison244"}}'
