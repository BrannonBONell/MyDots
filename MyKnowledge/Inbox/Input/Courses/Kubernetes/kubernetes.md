---
tags:
  - kubernetes
  - devops
  - docker
  - container
date: "2024-11-11"
---

# Kubernetes

__[[AzureKubernetesService]]__

---

>[!note] Definition
> Kubernetes is an Orchastration tool for Docker
> Containers, and is open source. It will execute
> and manage Docker Containers. It will manage
> your complete containerised application from
> deployment, monitoriing, execution, and many
> other things.

---

- Kubernetes manages the State of Containers
 - Basically use Kubernetes decide whether a container is going to start
 - Have multiple nodes in Kubernetes and nodes are specific to the application.
  - Some nodes are specified to a database some are specific to web servers, some dedicated to middleware
 - Kubernetes will maintain that the database container starts on the database node, web server containeron the web server container.
 - Kubernetes will also handle the restarting of containers, if your container application crashes it will automatically be restarted.

- With Kubernetes you can easily move containers from node to node
 - For example if a business needs to move containers from node A to node B Kubernetes can easily shift the containers.

---

## Features

---

>[!info] Automated Scheduling
> Kubernetes gives you a scheduler that helps
> schedule resources automatically. Example
> launching containers on cluster nodes based
> on their resource requirements and other
> restraints

>[!info] Healing Capabilities
> Can automatically restart containers. Make rules
> and with the help of the rules which are called
> liveness and readiness, can automatically heal
> your application. Replaces and reschedules
> containers when nodes die. Will not allow
> containers to use until they are ready.

>[!note] Auto Upgrade and RollBack
> Don't need to manually increase, decrease 
> containers. Upgrade and rollback the 
> application.  Submit a job and it will take the 
> latest build and do the upgrade and rollback
> completely automated.

>[!caution] Horizontal Scaling
> Load on application is increasing it will
> automatically scale the application. It will
> automatically scale and de scale your application
> Very helpfule in peek hours no manual intervention
> is required to scale the application.

>[!success] Storage Orchestration
> Can choose storage of your choice
> Keep data in your local box, set up a mount on
> public cloud storage.

>[!important] Secret and Configuration Management
> Can manage secrets, keep your credentials within
> Kubernetes, and will keep without and expose.
> and can update the credentials at any time.
> Has all the information about all containers
> application instances, and nodes

>[!note] Run Kubernetes
> On-Premise(Own DataCenter)
> Public Cloud(Google,AWS,Azure,DigitalOcean,etc.)
> Hybrid Cloud mix and match nodes on different
> providers.
