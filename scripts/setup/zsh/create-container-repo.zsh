#!/bin/zsh

source config.zsh

aws ecr create-repository --repository-name ${serviceLower}-${environmentLower} --region ${region}