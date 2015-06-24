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

```http
GET /api/v1/clusters HTTP/1.1
Host: api.arkis.io
Authorization: JWT JSON_WEB_TOKEN
Accept: application/json
```

> Example

```json
{
    "clusters": [{
        "state_message": "Create at least one node to work with this cluster",
        "id": "14813a80-19fa-11e5-a214-93ad3da1a84e",
        "name": "staging",
        "token": "pgb90oharv9qep2gkspjuanpg2sw0zfr",
        "strategy": "binpack",
        "created_at": "2015-06-10T16:11:14.149Z",
        "updated_at": "2015-06-10T16:11:14.149Z",
        "nodes_count": "0",
        "containers_count": "0",
        "user_id": "2126",
        "state": "idle"
    }, {
        "state_message": "Everything is running smoothly",
        "id": "14813a81-19fa-11e5-a214-93ad3da1a84e",
        "name": "production",
        "token": "2gkspjuanpg2pgb90oharv9qepsw0zfr",
        "strategy": "spread",
        "created_at": "2015-06-05T16:09:20.149Z",
        "updated_at": "2015-06-05T16:09:28.149Z",
        "nodes_count": "7",
        "containers_count": "12",
        "user_id": "2126",
        "state": "running"
    }]
}
```

List all clusters avalaible. Returns a list of `Cluster` objects.

### HTTP Request

`GET /api/v1/clusters`

### Query Parameters

Parameter   | Description
---------   | -----------
strategy    | Filter by strategy
state       | Filter by state
limit       | Limits the number of returned objects (by defauts returns all records)
page        | Returns one page of records at a time

## Create a new cluster

Creates a new cluster without deploying it.

### HTTP Request

`POST /api/v1/clusters`

### JSON Parameters

Parameter | Description
--------- | -----------
name  | (required) A user provided name for the cluster
strategy | (optional) A user provided strategy for the cluster (e.g. `spread`, `binpack` or `random`)

If not specified by the user, the default strategy of a cluster will be set to `spread`.

## Get an existing cluster

```http
GET /api/v1/clusters/:id HTTP/1.1
Host: api.arkis.io
Authorization: JWT JSON_WEB_TOKEN
Accept: application/json
```

> Example

```json
{
    "cluster": {
        "state_message": "Create at least one node to work with this cluster",
        "id": "14813a80-19fa-11e5-a214-93ad3da1a84e",
        "name": "grounds-production",
        "token": "2gkspjuanpg2pgb90oharv9qepsw0zfr",
        "strategy": "spread",
        "created_at": "2015-06-10T16:11:14.149Z",
        "updated_at": "2015-06-10T16:11:14.149Z",
        "nodes_count": "0",
        "containers_count": "0",
        "user_id": "2126",
        "state": "idle"
    }
}
```

Get all the informations of a specific cluster.

### HTTP Request

`GET /api/v1/clusters/:id/`

### Query Parameters

Parameter | Description
--------- | -----------
id | The UUID of the cluster to retrieve

## Destroy a cluster

```http
DELETE /api/v1/clusters/:id HTTP/1.1
Host: api.arkis.io
Authorization: JWT JSON_WEB_TOKEN
Accept: application/json
```

Destroy all the nodes in a cluster and the cluster itself. This is irreversible.

### HTTP Request

`DELETE /api/v1/clusters/:id/`

### Query Parameters

Parameter | Description
--------- | -----------
id | The UUID of the cluster to retrieve

Returns a `204` status code if the cluster has been successfully deleted.

# Cluster State

States possible for a cluster.

### Attributes

Attribute   | Description
----------- | -----------
idle | Cluster waiting for node(s) to be created
unavailable | Cluster's master node is missing / down or being deployed / upgraded / started / stopped
deploying | One or more node is being deployed
upgrading | One or more node is being upgraded
running | Every node is running perfectly
partially_running | One or more node is stopped or down

<aside class="warning">
You can't reach the Docker API of a cluster in unavailable state.
</aside>
