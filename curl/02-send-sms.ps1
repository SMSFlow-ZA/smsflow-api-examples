$ErrorActionPreference = "Stop"

$baseUrl = $env:SMSFLOW_BASE_URL
if ([string]::IsNullOrWhiteSpace($baseUrl)) {
    $baseUrl = "https://portal.smsflow.co.za/"
}

if ([string]::IsNullOrWhiteSpace($env:SMSFLOW_CLIENT_ID) -or [string]::IsNullOrWhiteSpace($env:SMSFLOW_CLIENT_SECRET)) {
    throw "Set SMSFLOW_CLIENT_ID and SMSFLOW_CLIENT_SECRET before running this example."
}

if ([string]::IsNullOrWhiteSpace($env:SMSFLOW_DESTINATION)) {
    throw "Set SMSFLOW_DESTINATION before running this example."
}

$pair = "$($env:SMSFLOW_CLIENT_ID):$($env:SMSFLOW_CLIENT_SECRET)"
$basic = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($pair))
$auth = Invoke-RestMethod `
    -Method Get `
    -Uri "$($baseUrl.TrimEnd('/'))/api/integration/authentication" `
    -Headers @{ Authorization = "Basic $basic" }

$body = @{
    SendOptions = @{
        startDeliveryUtc = $null
        campaignName = "PowerShell API example"
        checkOptOuts = $true
    }
    messages = @(
        @{
            content = "Your SMSFlow PowerShell test message was sent successfully."
            destination = $env:SMSFLOW_DESTINATION
        }
    )
} | ConvertTo-Json -Depth 10

Invoke-RestMethod `
    -Method Post `
    -Uri "$($baseUrl.TrimEnd('/'))/api/integration/BulkMessages" `
    -Headers @{ Authorization = "Bearer $($auth.token)" } `
    -ContentType "application/json" `
    -Body $body
