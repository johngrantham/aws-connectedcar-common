
. "./config.ps1"

$username="[enter github username]"
$token="[enter github personal access token]"

New-SECSecret `
    -SecretString "{\"username\":\"${username}\"}" `
    -Description "My github username" `
    -Name "github-username"

New-SECSecret `
    -SecretString "{\"token\":\"${token}\"}" `
    -Description "My github personal access token" `
    -Name "personal-access-token"
