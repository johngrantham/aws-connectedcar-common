#!/bin/zsh

source config.zsh

aws dynamodb query \
  --table-name ${service}_Timeslot_Table_${environment} \
  --key-condition-expression "dealerId = :dealerId" \
  --expression-attribute-values '{":dealerId": {"S": "eb506708-0707-441a-932d-2b853d03c553"}}' 
