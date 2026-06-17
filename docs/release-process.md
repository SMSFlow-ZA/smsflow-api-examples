# Release process

Use this checklist when updating the public API examples.

## Before release

1. Update `CHANGELOG.md`.
2. Validate the Postman collection with `python -m json.tool postman/SMSFlow.postman_collection.json`.
3. Run live smoke tests only with approved test credentials.
4. Confirm no credentials, customer data, logs, or private URLs are present.

## Publish

1. Merge to `main` after CI passes.
2. Create a GitHub release when examples change materially.
3. Link the updated examples from the public documentation.

