
#!/bin/zsh

source config.sh

userPoolId=$(aws cloudformation describe-stacks \
    --stack-name ${service}${environment} \
    --query "Stacks[0].Outputs[?OutputKey=='UserPoolId'].OutputValue" \
    --output text)

clientId=$(aws cloudformation describe-stacks \
    --stack-name ${service}${environment} \
    --query "Stacks[0].Outputs[?OutputKey=='UserClientId'].OutputValue" \
    --output text)

clientSecret=$(aws cognito-idp describe-user-pool-client \
    --user-pool-id $userPoolId \
    --client-id $clientId \
    --query 'UserPoolClient.ClientSecret' \
    --output text)

hash=$(printf "${username}${clientId}" | openssl dgst -sha256 -hmac ${clientSecret} -binary | openssl enc -base64)

aws cognito-idp admin-set-user-password \
    --user-pool-id ${userPoolId} \
    --username ${username} \
    --password ${password} \
    --permanent

token=$(aws cognito-idp admin-initiate-auth \
    --user-pool-id ${userPoolId} \
    --client-id ${clientId} \
    --auth-flow ADMIN_USER_PASSWORD_AUTH \
    --auth-parameters USERNAME=${username},PASSWORD=${password},SECRET_HASH=${hash} \
    --query 'AuthenticationResult.AccessToken' \
    --output text)

echo " "
echo "token: ${token}"
echo " "
