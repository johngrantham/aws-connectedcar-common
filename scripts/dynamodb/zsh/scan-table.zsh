#!/bin/zsh

source config.zsh

aws dynamodb scan \
  --table-name ${service}_Dealer_Table_${environment} \
  --expression-attribute-values '{":code":{"N":"41"}}' \
  --filter-expression "stateCode = :code"
