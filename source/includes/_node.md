# Node

A node is a docker machine provided by a cloud provider where docker containers
can be deployed.

Attribute   | Description
----------- | -----------
id          | A unique identifier (UUID) for the node generated automatically on creation
cluster     | The cluster UUID of which the node belongs
name        | A user provided name for the node (see [Regions](/#regions))
byon        | If the node is provided by Arkis or the user (`bring your own node`)
master      | Whether the node is the master of its cluster
token       | Token key used by Arkis agent to reach the node
labels      | A list of labels to identify the node when running containers (see [Labels](/#labels))
state       | The state of the node. See the below table for a list of possible states
state_message | User-friendly informations about the state of the node
fqdn        | An automatically generated FQDN for the node
public_ip   | The public IP of the node
agent_cmd   | Command to install Arkis agent (only for byon node)
region      | The name identifier of the region where the node is deployed
node_size   | The name identifier of the node size object of this node (see [Node sizes](/#node-sizes))
cpu         | Node number of CPUs
disk        | Node storage size in GB
memory      | Node memory in MB
last_ping   | Date and time of the last time the node was contacted by Arkis
docker_version | Docker's version used in the node
created_at  | The date and time when this node was deployed
updated_at  | The date and time when this node was updated last

## List all nodes of a cluster

List all nodes available for a cluster. Returns a list of `Node` objects.

### HTTP Request

`GET /api/v1/clusters/:cluster_id/nodes`

### Query Parameters

Parameter   | Description
----------- | -----------
state       | Filter by state
master      | Filter by master (`true`/`false`)
region      | Filter by region
node_size   | Filter by node size
byon        | Filter by byon (`true`/`false`)
labels      | Filter by a list of labels (e.g. `[{ "region": "us-east", "environment": "production" }]`)

## Create a new node for a cluster

Creates a new node for a cluster.

### HTTP Request

`POST /api/v1/clusters/:cluster_id/nodes`

### JSON Parameters

Parameter | Description
--------- | -----------
name | (required) Name of the node
master | (optional) If the node will be the master of its cluster (default: `false`)
byon | (optional) If the node will be provided by the user or by Arkis (default: `false`)
region | (required) The name identifier of the region where the node will be deployed (see [Regions](/#regions))
node_size | (required) Name identifier of the node size object desired for the node (see [Node sizes](/#node-sizes))
labels | (optional) List of labels to identify the node (see [Labels](/#labels))

### Get an existing node

Get all the informations of a specific node.

### HTTP Request

`GET /api/v1/clusters/:cluster_id/nodes/:node_id/`

### Query Parameters

Parameter  | Description
---------- | -----------
cluster_id | The UUID of the clusters wich the node to retrieve belongs to
node_id    | The UUID of the node to retrieve

## Destroy a node

Removes a node from the cluster and destroys the node itself. This is irreversible.

### HTTP Request

`DELETE /api/v1/clusters/:cluster_id/nodes/:node_id/`

### Query Parameters

Parameter  | Description
---------- | -----------
cluster_id | The UUID of the clusters wich the node to retrieve belongs to
node_id    | The UUID of the node to retrieve

## Upgrade a node

Upgrade docker daemon and swarm agent on a node to its cluster versions.

### HTTP Request

`POST /api/v1/clusters/:cluster_id/nodes/:node_id/upgrade`

<aside class="warning">
Your containers on the node won't be available until the end of the upgrade.
Beside, the node docker and swarm version will be updated only if the node
upgrade has been successfully completed.
</aside>

# Node State

States possible for a node.

### Attributes

Attribute   | Description
----------- | -----------
unreachable | Node is unreachable
deploying | Node is being deployed
upgrading | Node is being upgraded
running | Node is running and reachable
