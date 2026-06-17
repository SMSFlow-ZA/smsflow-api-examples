# SMSFlow API Examples

[![CI](https://github.com/SMSFlow-ZA/smsflow-api-examples/actions/workflows/ci.yml/badge.svg)](https://github.com/SMSFlow-ZA/smsflow-api-examples/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Public examples for integrating with the SMSFlow HTTPS API.

Use this repository when you want to test the raw HTTP contract before choosing an SDK. It includes cURL-style PowerShell scripts, a Postman collection, and editor-friendly `.http` requests for the same core workflow.

These examples show how to:

- Authenticate with a Client ID and Client Secret.
- Send SMS messages.
- Check account balance.
- Handle common API errors.

## Safety

Never commit real credentials, access tokens, phone numbers, customer data, or API responses from production accounts. Copy `.env.example` to `.env` locally and fill in your test credentials.

```powershell
Copy-Item .env.example .env
```

## Examples

| Folder | Purpose |
| --- | --- |
| `curl/` | Minimal curl examples for authentication, sending SMS, and checking balance. |
| `postman/` | Postman collection for manual API testing. |
| `http/` | HTTP file examples for editors that support `.http` requests. |

## Smoke test the API

The smoke test validates authentication and balance checks. It does not send an SMS unless you explicitly opt in.

```powershell
$env:SMSFLOW_CLIENT_ID = "YOUR_CLIENT_ID"
$env:SMSFLOW_CLIENT_SECRET = "YOUR_CLIENT_SECRET"
.\scripts\run-live-smoke.ps1
```

To send a real test SMS, also set:

```powershell
$env:SMSFLOW_DESTINATION = "27000000000"
$env:SMSFLOW_SEND_LIVE = "true"
.\scripts\run-live-smoke.ps1
```

Live sends consume SMSFlow credits.

## Documentation

Read the SMSFlow developer documentation at:

https://docs.smsflow.co.za/

Official SDK packages:

- Node.js: [`@smsflow/smsflow`](https://www.npmjs.com/package/@smsflow/smsflow)
- .NET: [`SmsFlow`](https://www.nuget.org/packages/SmsFlow)
- Python: [`smsflow`](https://pypi.org/project/smsflow/)
