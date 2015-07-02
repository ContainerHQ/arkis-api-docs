# Node

A node is a docker machine provided by a cloud provider where docker containers
can be deployed.

Attribute   | Description
----------- | -----------
id          | A unique identifier (UUID) for the node generated automatically on creation
cluster     | The cluster UUID of which the node belongs
name        | A user provided name for the node (see [Regions](/#regions))
master      | Whether the node is the master of its cluster
labels      | A list of labels to identify the node when running containers (see [Labels](/#labels))
state       | The state of the node. See the below table for a list of possible states
state_message | User-friendly informations about the state of the node
fqdn        | An automatically generated FQDN for the node
public_ip   | The public IP of the node
region      | The name identifier of the region where the node is deployed
node_size   | The name identifier of the node size object of this node (see [Node sizes](/#node-sizes))
docker_version | Docker's version used in the node
created_at  | The date and time when this node was deployed
updated_at  | The date and time when this node was updated last

## List all nodes

List all nodes avalaible. Returns a list of `Node` objects.

### HTTP Request

`GET /api/v1/node`

### Query Parameters

Parameter   | Description
---------   | -----------
state       | Filter by state
cluster     | Filter by cluster UUID
region      | Filter by region
master      | Filter by master (`true`/`false`)
node_size   | Filter by node size
labels      | Filter by a list of labels (e.g. `[{ "region": "us-east", "environment": "production" }]`)

## Create a new node

Creates a new node.

### HTTP Request

`POST /api/v1/node`

### JSON Parameters

Parameter | Description
--------- | -----------
cluster   | (required) Cluster UUID to which the newly created node will belong
name | (required) Name of the node
region | (required) The name identifier of the region where the node will be deployed (see [Regions](/#regions))
node_size | (required) Name identifier of the node size object desired for the node (see [Node sizes](/#node-sizes))
labels | (optional) List of labels to identify the node (see [Labels](/#labels))

### Get an existing node

Get all the informations of a specific node.

### HTTP Request

`GET /api/v1/node/:id/`

### Query Parameters

Parameter | Description
--------- | -----------
id | The UUID of the node to retrieve

## Destroy a cluster

Remove a node from the cluster and destroy the node itself. This is irreversible.

### HTTP Request

`DELETE /api/v1/node/:id/`

### Query Parameters

Parameter | Description
--------- | -----------
id | The UUID of the node to retrieve
