# Node Sizes

A node size is a representation of an instance size supported in a certain
region.

### Attributes

Attribute | Description
--------- | -----------
name | An name identifier for the node size
label | A user-friendly name for the node size
cpu  | Number of CPU's core
disk | Storage size in GB
memory | Memory in MB
regions | A list of regions name identifier where the node can currently be deployed (see [Regions](/#regions))
available | Whether the node size is currently available for new deployments

## List all node sizes

List all node sizes currently supported. Returns a list of `NodeSize` objects.

### HTTP Request

`GET /api/v1/nodesizes`

### Query Parameters

Parameter | Description
--------- | -----------
name | Filter by node type name
regions | Filter by regions name identifier currently available
available | Filter by availability (`true`/`false`)
limit | Limits the number of returned objects (by defauts returns all records)
page | Returns one page of records at a time (by default, sets the `limit` parameter to 10)

## Get an existing node size

Get all informations of a specific node size.

### HTTP Request

`GET /api/v1/nodesize/:name/`

### Query Parameters

Parameter | Description
--------- | -----------
name | The name identifier of the node size to retrieve
