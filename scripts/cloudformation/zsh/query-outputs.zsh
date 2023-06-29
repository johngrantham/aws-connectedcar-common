#!/bin/zsh

source config.zsh

aws cloudformation describe-stacks \
    --stack-name ${service}${environment} \
    --query 'Stacks[].Outputs[]' \
    --output table

echo " "

