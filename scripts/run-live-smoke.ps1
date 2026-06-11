$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($env:SMSFLOW_CLIENT_ID) -or [string]::IsNullOrWhiteSpace($env:SMSFLOW_CLIENT_SECRET)) {
    throw "Set SMSFLOW_CLIENT_ID and SMSFLOW_CLIENT_SECRET before running live smoke tests."
}

Write-Host "Checking SMSFlow authentication..."
& "$PSScriptRoot\..\curl\01-authenticate.ps1"

Write-Host "Checking SMSFlow balance..."
& "$PSScriptRoot\..\curl\03-check-balance.ps1"

if ($env:SMSFLOW_SEND_LIVE -eq "true") {
    Write-Host "Sending live SMS because SMSFLOW_SEND_LIVE=true..."
    & "$PSScriptRoot\..\curl\02-send-sms.ps1"
}
else {
    Write-Host "Skipping live SMS send. Set SMSFLOW_SEND_LIVE=true and SMSFLOW_DESTINATION to enable it."
}
