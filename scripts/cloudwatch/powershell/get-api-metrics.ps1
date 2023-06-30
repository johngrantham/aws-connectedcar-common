
. "./config.ps1"

$start=[System.DateTime]::UtcNow.AddMinutes(-30)
$end=[System.DateTime]::UtcNow

$dimensions=@(@{Name = "ApiName"; Value = "${service}_Admin_API_${environment}"}, 
              @{Name = "Stage"; Value = "api"})

$stats=(Get-CWMetricStatistic `
    -Namespace AWS/ApiGateway `
    -MetricName Latency `
    -Dimension $dimensions `
    -Period 30 `
    -Statistic Average `
    -UtcStartTime $start `
    -UtcEndTime $end).DataPoints[0]

Write-Output $stats



