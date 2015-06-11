# Authentication

In order to be able to make requests to the Arkis API, you should first
obtain a JSON Web Token for your account. For this, you can either use
the `API Key` section on your dashboard, or use our authentication
endpoints (See [Account](/#account)).

## REST API

The Arkis REST API is reachable through the following hostname:

`https://api.arkis.io`

All requests to our REST API should be sent to this endpoint with the
following `Authorization` header:

`Authorization: JWT JSON_WEB_TOKEN_STRING`

<aside class="notice">
You must replace <code>JSON_WEB_TOKEN_STRING</code> with your personal API
token.
</aside>

HTTP responses are given in JSON format, so the following `Accept` header
is required for every API call:

`Accept: application/json`

<aside class="success">
Authentication endpoints (starting with <code>/auth</code>) are available
without this header.
</aside>

## Register / Sign in

```http
POST /api/v1/auth/login HTTP/1.1
Host: api.arkis.io
Accept: application/json
```

> Example

```json
{
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImZvbGllYUBhcmtpcy5pbyIsImppdCI6ImJkM2QwYjYwLTBmMjEtMTFlNS1hN2RiLTFmNTM3MDNlOTVlOCIsImlhdCI6MTQzMzkwNzMyOH0.BQStzEqRlP-v0VUow6H6IppfzWHoONbHekWq3hG6YTk"
}
```

Create an account and returns the JSON Web Token of this account.
If the account already exist and the credentials are corrects,
returns the JSON Web Token of the existing account.

### HTTP Request

`POST /api/v1/auth/login`

### JSON Parameters

Parameter | Description
--------- | -----------
email | (required) A user provided account email
password | (required) A user provided account password

## Generate a new API token

```http
GET /api/v1/account/new_token HTTP/1.1
Host: api.arkis.io
Authorization: JWT JSON_WEB_TOKEN
Accept: application/json
```

> Example

```json
{
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImZvbGllYUBhcmtpcy5pbyIsImppdCI6ImJkM2QwYjYwLTBmMjEtMTFlNS1hN2RiLTFmNTM3MDNlOTVlOCIsImlhdCI6MTQzMzkwNzMyOH0.BQStzEqRlP-v0VUow6H6IppfzWHoONbHekWq3hG6YTk"
}
```

Create an new JSON Web Token for your account, returns the newly created token.

### HTTP Request

`GET /api/v1/account/new_token`

<aside class="warning">
This will revoke your previous API token.
</aside>

## Change account password

```http
PATCH /api/v1/account/change_password HTTP/1.1
Host: api.arkis.io
Authorization: JWT JSON_WEB_TOKEN
Accept: application/json
```

Change your account password.

### HTTP Request

`PATCH /api/v1/account/change_password`

### JSON Parameters

Parameter | Description
--------- | -----------
old_password | (required) Current password of the user
new_password | (required) New password for the user
new_password_confirmation | (required) New password confirmation
