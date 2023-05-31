#!/bin/zsh

token="1234567890"

aws secretsmanager create-secret \
    --name personal-access-token \
    --description "My github personal access token" \
    --secret-string "{\"personal-access-token\":\"${token}\"}"