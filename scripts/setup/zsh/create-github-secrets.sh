#!/bin/zsh

username="[enter github username]"
token="[enter github personal access token]"

aws secretsmanager create-secret \
    --name github-username \
    --description "My github username" \
    --secret-string "{\"username\":\"${username}\"}"

aws secretsmanager create-secret \
    --name personal-access-token \
    --description "My github personal access token" \
    --secret-string "{\"token\":\"${token}\"}"