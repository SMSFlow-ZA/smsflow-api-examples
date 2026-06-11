# SMSFlow API Examples

Public examples for integrating with the SMSFlow HTTPS API.

These examples show how to:

- Authenticate with a Client ID and Client Secret.
- Send SMS messages.
- Check account balance.
- Handle common API errors.

## Safety

Never commit real credentials. Copy `.env.example` to `.env` locally and fill in your test credentials.

```powershell
Copy-Item .env.example .env
```

## Examples

| Folder | Purpose |
| --- | --- |
| `curl/` | Minimal curl examples for authentication, sending SMS, and checking balance. |
| `postman/` | Postman collection for manual API testing. |
| `http/` | HTTP file examples for editors that support `.http` requests. |

## Documentation

Read the SMSFlow developer documentation at:

https://docs.smsflow.co.za/
