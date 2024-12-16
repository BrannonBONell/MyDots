---
tags: []
date: "11-10-2024"
---

# Docker Swarm

- Docker Swarm is a tool for clustering and scheduling docker containers
- Swarm is native support for docker orchestration of clusters and the docker engine it's not a third party service.

__Orchestration__ - Define nodes. Define services. Set how many nodes to run and where.

**Docker Swarm** takes multiple Docker engines running on different hosts and lets them work together.
- 


## Why do I need to cluster containers?

- How to scale containers up
 - Internet is moving very fast, there is alot of robust and agile applications.
 - If I own Amazon Prime or Netflix at runtime I'm going to launch a new sale, and a new website.
  - At this time I will need a large pool of resources available.
   - One possible solution is I will have engineers create the container at runtime.
   - Or I can automate the infrastructure to manage the load.
   - scale up containers dynamically per the load.

## How to Manage Containers or re-create them if the fail/crash?

- 


## How to Upgrade the service with zero down time?



## How to manage containers on VMs, Nodes?

---
## Docker Swarm Networks

Docker Swarm works with a new network, called an [[overlay-network]]
