# Errors

The Arkis API uses the following error codes:

Error Code | Meaning
---------- | -------
400 | Bad Request -- There’s a problem in the content of your request.
401 | Unauthorized -- Your password or API Key is wrong or revoked.
404 | Not Found -- The specified resource could not be found.
406 | Not Acceptable -- You requested a format that isn't json.
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarially offline for maintanance. Please try again later.

## Validation Errors

> Example

```json
{
    "errors": [
        {
            "message": "Validation len failed",
            "type": "Validation error",
            "path": "password",
            "value": "Validation len failed"
        }
    ]
}
```

When you receive a `400 Bad Request` error, you will find in the response body
and array of validation errors to help you identify what's wrong in your
request.

### Attributes

Attribute | Description
--------- | -----------
message   | An error message
type      | The type of the validation error
path      | The field that triggered the validation error
value     | The value that generated the error
