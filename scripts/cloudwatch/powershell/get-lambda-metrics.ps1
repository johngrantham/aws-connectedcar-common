
. "./config.ps1"

$start=[System.DateTime]::UtcNow.AddMinutes(-60)
$end=[System.DateTime]::UtcNow

$dimensions=@{Name = "FunctionName"; Value = "${service}_Admin_GetDealers_${environment}"}

$stats=(Get-CWMetricStatistic `
    -Namespace AWS/Lambda `
    -MetricName Duration `
    -Dimension $dimensions `
    -Period 3600 `
    -Statistic Average `
    -UtcStartTime $start `
    -UtcEndTime $end).DataPoints[0]

Write-Output $stats



