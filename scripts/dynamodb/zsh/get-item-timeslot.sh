#!/bin/zsh

source config.sh

aws dynamodb get-item \
  --table-name ${service}_Timeslot_Table_${environment} \
  --key '{"dealerId": {"S": "eb506708-0707-441a-932d-2b853d03c553"}, "serviceDateHour": {"S": "2023-05-25-10"}}' \
  --output text
