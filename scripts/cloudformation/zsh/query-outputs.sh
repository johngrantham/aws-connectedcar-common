#!/bin/zsh

source config.sh

aws cloudformation describe-stacks \
    --stack-name ${service}${environment} \
    --query 'Stacks[].Outputs[]' \
    --output table

echo " "

