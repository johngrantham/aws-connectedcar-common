
. "./config.ps1"

New-ECRRepository -RepositoryName ${serviceLower}-${environmentLower}
