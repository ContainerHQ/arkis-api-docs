# Introduction

**Arkis** currently offers a **HTTP REST API** wich is used by the Web UI. In this
document you will find all API operations currently supported in the service
and examples on how to execute them.

## Docker API

**Arkis** is fully compatible with both
[Docker API](https://docs.docker.com/reference/api/docker_remote_api/) and
[Docker Swarm API](http://docs.docker.com/swarm/API/).

You can reach our Docker API through the following hostname:

`https://api.arkis.io`

 Or to reach a specific Docker API version:

`https://api.arkis.io/v1.18`

However, in order to target your cluster running on **Arkis**, you must specify
your cluster's **token** by adding to all requests sent to this endpoints the
following header:

`X-Arkis-Cluster: ID CLUSTER_ID`

or

`X-Arkis-Cluster: NAME CLUSTER_NAME`

<aside class="notice">
You must replace <code>CLUSTER_ID</code> with your cluster id or
<code>CLUSTER_NAME</code> with your cluster name.
</aside>
