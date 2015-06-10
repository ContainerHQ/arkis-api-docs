# Profile

The user profile.

### Attributes

Attribute   | Description
----------- | -----------
id | A unique identifier for the cluster generated automatically on creation.
fullname | Fullname of the user
location | Location of the user

## Get your profile

Returns you user profile.

### HTTP Request

`GET /api/v1/profile`

## Modify your profile

Update you user profile.

### HTTP Request

`PATCH /api/v1/profile`

### JSON Parameters

Parameter | Description
--------- | -----------
fullname  | (optional) A user provided name for the profile
location  | (optional) A user provided location for the profile
