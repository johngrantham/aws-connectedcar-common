#!/bin/zsh

token="1234567890"

aws secretsmanager create-secret \
    --name github-token \
    --description "My github personal access token" \
    --secret-string ${token}