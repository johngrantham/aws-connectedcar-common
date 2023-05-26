#!/bin/zsh

source config.sh

aws dynamodb scan \
  --table-name ${service}_Dealer_Table_${environment} \
  --expression-attribute-values '{":code":{"N":"41"}}' \
  --filter-expression "stateCode = :code"
