#!/bin/zsh

source config.sh

aws dynamodb get-item \
  --table-name ${service}_Timeslot_Table_${environment} \
  --key '{"dealerId": {"S": "76c04f8c-3186-49b8-bcdc-564a351f239b"}, "serviceDateHour": {"S": "2023-05-24-08"}}'
