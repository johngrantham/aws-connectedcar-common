#!/bin/zsh

source config.sh

aws ecr create-repository --repository-name ${serviceLower}-${environmentLower} --region ${region}