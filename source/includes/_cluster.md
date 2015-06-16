# Cluster

A cluster is a group of nodes wich are on the same private network.

### Attributes

Attribute   | Description
----------- | -----------
id          | A unique identifier (UUID) for the cluster generated automatically on creation
name        | A user provided name for the cluster
token       | Token key to reach the cluster
strategy    | Strategy for ranking the node (see [Strategies](https://docs.docker.com/swarm/scheduler/strategy/))
state       | State of the cluster
state_message | User-friendly informations about the state of the cluster
nodes_count | The number of nodes present in the cluster
nodes    | A list of resource UUID of `Node` objects present in the cluster
containers_count | The number of containers present in the cluster
created_at  | The date and time when this cluster was created
updated_at  | The date and time when this cluster was updated last

## List all clusters

List all clusters avalaible. Returns a list of `Cluster` objects.

### HTTP Request

`GET /api/v1/cluster`

### Query Parameters

Parameter   | Description
---------   | -----------
strategy    | Filter by strategy
state       | Filter by state
limit       | Limits the number of returned objects (by defauts returns all records)
page        | Returns one page of records at a time (by default, sets the `limit` parameter to 10)

## Create a new cluster

Creates a new cluster without deploying it.

### HTTP Request

`POST /api/v1/cluster`

### JSON Parameters

Parameter | Description
--------- | -----------
name  | (required) A user provided name for the cluster
strategy | (optional) A user provided strategy for the cluster (e.g. `spread`, `binpack` or `random`)

If not specified by the user, the default strategy of a cluster will be set to `spread`.

## Get an existing cluster

Get all the informations of a specific cluster.

### HTTP Request

`GET /api/v1/cluster/:id/`

### Query Parameters

Parameter | Description
--------- | -----------
id | The UUID of the cluster to retrieve

## Destroy a cluster

Destroy all the nodes in a cluster and the cluster itself. This is irreversible.

### HTTP Request

`DELETE /api/v1/cluster/:id/`

### Query Parameters

Parameter | Description
--------- | -----------
id | The UUID of the cluster to retrieve

# Cluster State

States possible for a cluster.

### Attributes

Attribute   | Description
----------- | -----------
Idle | Cluster waiting for node(s) to be created
Deploying | One or more node is being created
Upgrading | One or more node is being upgraded
Running | Every node is running perfectly
PartiallyRunning | One or more node is stopped or down
