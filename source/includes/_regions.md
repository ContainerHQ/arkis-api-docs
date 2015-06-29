# Regions

A region is a representation of an entire or a subset of a data center.
It contains one and more node sizes.

### Attributes

Attribute | Description
--------- | -----------
name | An identifier for the region
label | A user-friendly name for the region
available | Whether the region is currently available for new deployments
node_sizes | A list of node size name identifier available in the region (see [Node sizes](/#node-sizes))

## List all regions

List all regions currently supported. Returns a list of `Region` objects.

### HTTP Request

`GET /api/v1/regions`

### Query Parameters

Parameter | Description
--------- | -----------
available | Filter by availability (`true`/`false`)
node_size | Filter by node size name (see [Node sizes](/#node-sizes))

## Get an existing region

Get all informations of a specific region.

### HTTP Request

`GET /api/v1/region/:name/`

### Query Parameters

Parameter | Description
--------- | -----------
name | The name identifier of the region to retrieve
