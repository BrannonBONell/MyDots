---
tags: azure microsoft resource manager locks devops cloud create
date: 9th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Resource Manager Locks
>[!summary] 
>- Two types of resource locks
>- Read-Only locks Prevent any changes to the resource
>- Delete locks Prevent deletion
>- 

- Common concern with resources is how easily they can be deleted
	- A careless administration can accidentally erase months of work with a few steps.
		- Resource Manager locks allow to put a structure in place that prevents the accidental deletion of a resource

- You can associate a lock with a subscription, resource group, or resource
- Locks are inherited by child resources
![[Pasted image 20241010002255.png]]

# Lock Types
>[!cue] What
>Type of locks for resources are there?
- There are two types
	- Read-Only locks
		- Prevent any changes to the resource
	- Delete locks
		- Prevent deletion

> [!note]
> Only the owner and User Access Administrator roles can create or delete management locks.
