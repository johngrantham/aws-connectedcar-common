#!/bin/zsh

token="[enter personal access token]"

aws secretsmanager create-secret \
    --name personal-access-token \
    --description "My github personal access token" \
    --secret-string "{\"token\":\"${token}\"}"