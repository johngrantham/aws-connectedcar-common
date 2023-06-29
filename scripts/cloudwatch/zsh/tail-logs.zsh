#!/bin/zsh

source config.zsh

group="/aws/lambda/${service}_Admin_CreateDealer_${environment}"
pattern="stack trace"

aws logs tail $group \
    --format short \
    --follow \
    --filter-pattern "${pattern}"
