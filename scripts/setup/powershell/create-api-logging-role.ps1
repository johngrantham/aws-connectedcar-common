
. "./config.ps1"

$role="APIGatewayCloudWatchLogsRole"

$patchOperation = New-Object -Type Amazon.APIGateway.Model.PatchOperation
$patchOperation.path = "/cloudwatchRoleArn"
$patchOperation.value = "arn:aws:iam::${account}:role/${role}"
$patchOperation.op = "replace"

New-IAMRole `
  -RoleName ${role} `
  -AssumeRolePolicyDocument '{"Version": "2012-10-17", "Statement": {"Effect": "Allow", "Principal": {"Service": "apigateway.amazonaws.com"}, "Action": "sts:AssumeRole"}}'

Register-IAMRolePolicy `
  -RoleName ${role} `
  -PolicyArn "arn:aws:iam::aws:policy/service-role/AmazonAPIGatewayPushToCloudWatchLogs"

Start-Sleep -Seconds 60

Update-AGAccount `
  -PatchOperation $patchOperation
