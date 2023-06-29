#!/bin/zsh

source config.zsh

aws dynamodb query \
  --table-name ${service}_Registration_Table_${environment} \
  --index-name VehicleRegistrationIndex \
  --key-condition-expression "vin = :vin" \
  --expression-attribute-values '{":vin": {"S": "Y927S252W504V909H"}}'



