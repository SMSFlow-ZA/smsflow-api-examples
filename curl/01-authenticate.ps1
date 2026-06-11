$ErrorActionPreference = "Stop"

$baseUrl = $env:SMSFLOW_BASE_URL
if ([string]::IsNullOrWhiteSpace($baseUrl)) {
    $baseUrl = "https://portal.smsflow.co.za/"
}

if ([string]::IsNullOrWhiteSpace($env:SMSFLOW_CLIENT_ID) -or [string]::IsNullOrWhiteSpace($env:SMSFLOW_CLIENT_SECRET)) {
    throw "Set SMSFLOW_CLIENT_ID and SMSFLOW_CLIENT_SECRET before running this example."
}

$pair = "$($env:SMSFLOW_CLIENT_ID):$($env:SMSFLOW_CLIENT_SECRET)"
$basic = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($pair))

$auth = Invoke-RestMethod `
    -Method Get `
    -Uri "$($baseUrl.TrimEnd('/'))/api/integration/authentication" `
    -Headers @{ Authorization = "Basic $basic" }

if ($env:SMSFLOW_VERBOSE_RESPONSE -eq "true") {
    $auth
}
else {
    Write-Host "Authentication succeeded. Token expires in $($auth.expiresInMinutes) minutes."
}
