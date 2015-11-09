# Cluster

A cluster is a group of nodes wich are on the same docker swarm cluster.

### Attributes

Attribute   | Description
----------- | -----------
id          | A unique identifier (UUID) for the cluster generated automatically on creation
name        | A user provided name for the cluster
strategy    | Strategy for ranking the node (see [Strategies](https://docs.docker.com/swarm/scheduler/strategy/))
state       | State of the cluster
state_message | User-friendly informations about the state of the cluster
nodes_count | The number of nodes present in the cluster
last_ping   | Date and time of the last time the cluster master node was contacted by Arkis
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
    "meta": {
        "limit": 25,
        "offset": 0,
        "total_count": 2
    },
    "clusters": [{
        "state_message": "Create at least one node to work with this cluster",
        "id": "14813a80-19fa-11e5-a214-93ad3da1a84e",
        "name": "staging",
        "strategy": "binpack",
        "created_at": "2015-06-10T16:11:14.149Z",
        "updated_at": "2015-06-10T16:11:16.149Z",
        "nodes_count": 0,
        "last_ping": "2015-06-10T16:11:16.149Z",
        "state": "empty"
    }, {
        "state_message": "Cluster is deployed and ready",
        "id": "14813a81-19fa-11e5-a214-93ad3da1a84e",
        "name": "production",
        "strategy": "spread",
        "created_at": "2015-06-05T16:09:20.149Z",
        "updated_at": "2015-06-05T16:09:28.149Z",
        "nodes_count": 7,
        "last_ping": "2015-06-05T16:09:28.149Z",
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
name        | Filter by name
limit       | Limits the number of returned objects (default: `25`)
offset      | Limits starting with record number (default: `0`)

## Create a new cluster

Creates a new cluster.

### HTTP Request

`POST /api/v1/clusters`

### JSON Parameters

Parameter | Description
--------- | -----------
name  | (required) A user provided name for the cluster
strategy | (optional) A user provided strategy for the cluster (e.g. `spread`, `binpack` or `random`, default: `spread`)

## Get an existing cluster

```http
GET /api/v1/clusters/14813a80-19fa-11e5-a214-93ad3da1a84e/ HTTP/1.1
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
        "strategy": "spread",
        "created_at": "2015-06-10T16:11:14.149Z",
        "updated_at": "2015-06-10T16:11:13.149Z",
        "nodes_count": 0,
        "last_ping": "2015-06-10T16:11:13.149Z",
        "state": "empty"
    }
}
```

Get all the informations of a specific cluster.

### HTTP Request

`GET /api/v1/clusters/:cluster_id/`

### Query Parameters

Parameter | Description
--------- | -----------
id | The UUID of the cluster to retrieve

## Update an existing cluster

```http
PATCH /api/v1/clusters/14813a80-19fa-11e5-a214-93ad3da1a84e/ HTTP/1.1
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
        "name": "grounds-development",
        "strategy": "spread",
        "created_at": "2015-06-10T16:11:14.149Z",
        "updated_at": "2015-06-10T16:20:13.149Z",
        "nodes_count": 0,
        "last_ping": "2015-06-10T16:11:13.149Z",
        "state": "empty"
    }
}
```

Updates cluster details.

### HTTP Request

`PATCH /api/v1/clusters/:cluster_id/`

### JSON Parameters

Parameter | Description
--------- | -----------
name  | (required) A user provided name for the cluster

## Destroy a cluster

```http
DELETE /api/v1/clusters/14813a80-19fa-11e5-a214-93ad3da1a84e/ HTTP/1.1
Host: api.arkis.io
Authorization: JWT JSON_WEB_TOKEN
Accept: application/json
```

Destroy all the nodes in a cluster and the cluster itself. This is irreversible.

### HTTP Request

`DELETE /api/v1/clusters/:cluster_id/`

### Query Parameters

Parameter | Description
--------- | -----------
id | The UUID of the cluster to retrieve

Returns a `204` status code if the cluster has been successfully deleted.

## Upgrade a cluster

Upgrade docker daemon and swarm agent of all nodes of the cluster to the latest
versions available on `Arkis`.

### HTTP Request

`POST /api/v1/clusters/:cluster_id/upgrade`

<aside class="warning">
Your containers on each node won't be available until the end of the upgrade.
Beside, each node docker and swarm versions will be updated only if the node
upgrade has been successfully completed.
</aside>

# Cluster State

States possible for a cluster.

### Attributes

Attribute   | Description
----------- | -----------
empty | Cluster waiting for node(s) to be created
unreachable | Cluster's master node is unreachable
deploying | One or more node(s) are being deployed
upgrading | One or more node(s) are being upgraded
running | Cluster is running and reachable

<aside class="warning">
You can't reach the Docker API of a cluster in a non-running state.
</aside>
