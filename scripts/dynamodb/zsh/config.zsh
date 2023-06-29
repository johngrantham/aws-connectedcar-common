#!/bin/zsh

account=$(aws sts get-caller-identity --query "Account" --output text)
region=$(aws configure get region)

service="ConnectedCar"
environment="Dev"
