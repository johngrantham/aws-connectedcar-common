
. "./config.ps1"

$userPoolId = ((Get-CFNStack `
    -StackName "${service}${environment}").Outputs `
    | Where-Object {$_.OutputKey -EQ 'UserPoolId'}).OutputValue

$clientId = ((Get-CFNStack `
    -StackName "${service}${environment}").Outputs `
    | Where-Object {$_.OutputKey -EQ 'UserClientId'}).OutputValue

$clientSecret = (Get-CGIPUserPoolClient `
    -UserPoolId $userPoolId `
    -ClientId $clientId).ClientSecret

$hmacsha = New-Object System.Security.Cryptography.HMACSHA256
$hmacsha.key = [Text.Encoding]::ASCII.GetBytes($clientSecret)
$hash=$hmacsha.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($username@clientId))
$hashEncoded=[Convert]::ToBase64String($hash)

Set-CGIPUserPasswordAdmin `
    -Username $username `
    -Password $password `
    -Permanent true `
    -UserPoolId $userPoolId

$response = Start-CGIPAuthAdmin `
    -ClientId $clientId `
    -AuthFlow ADMIN_USER_PASSWORD_AUTH `
    -AuthParameter USERNAME=$username,PASSWORD=$password,SECRET_HASH=$hashEncoded `
    -UserPoolId $userPoolId `

$token=response.AuthenticationResult.AccessToken

Write-Host " "
Write-Host "token: ${token}"
Write-Host " "
