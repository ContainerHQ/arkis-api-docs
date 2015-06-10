# Profile

The user profile.

### Attributes

Attribute   | Description
----------- | -----------
id | A unique identifier for the use profile generated automatically on creation
user_id | A unique identifier of the user the profile belongs to
fullname | Fullname of the user
company  | Comparny of the user
location | Location of the user
created_at  | The date and time when the profile was created
updated_at  | The date and time when the profile was updated last

## Get your profile

```http
GET /api/v1/account/profile HTTP/1.1
Host: api.arkis.io
Authorization: JWT JSON_WEB_TOKEN
Accept: application/json
```

> Example

```json
{
    "profile": {
        "id": 3,
        "user_id": 3,
        "fullname": "Saul Tigh",
        "company": "Cylons, Inc",
        "location": "Caprica",
        "created_at": "2015-06-10T16:11:14.149Z",
        "updated_at": "2015-06-10T16:11:14.149Z"
    }
}
```

Returns you user profile.

### HTTP Request

`GET /api/v1/account/profile`

## Modify your profile

```http
POST /api/v1/account/profile HTTP/1.1
Host: api.arkis.io
Authorization: JWT JSON_WEB_TOKEN
Accept: application/json
```

Update you user profile.

### HTTP Request

`PATCH /api/v1/account/profile`

### JSON Parameters

Parameter | Description
--------- | -----------
fullname  | (optional) A user provided name for the profile
company   | (optional) A user provided company for the profile
location  | (optional) A user provided location for the profile
