#!/bin/zsh

source config.sh

aws dynamodb scan \
  --table-name ${service}_Dealer_Table_${environment} \
  --expression-attribute-values '{":code":{"S":"OR"}}' \
  --filter-expression "stateCode = :code"
