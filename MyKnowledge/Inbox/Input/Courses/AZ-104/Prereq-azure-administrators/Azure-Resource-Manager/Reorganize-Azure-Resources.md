---
tags: azure resources microsoft devops cloud organize
date: 10th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Reorganize Resources
>[!summary] 
>- When moving resources they are locked this means write and delete are blocked and no add update or delete of the resource can happen, but the resource is still usable.

- You may need to move resources to either a new subscription or a new resource group in the same subscription
![[Pasted image 20241010002806.png]]

- When moving resources
	- Source group and target group are locked during the operation.
	- Write and delete operations are blocked on the resource groups until the move completes
	- The lock means, no add, update, or delete resources in the resource groups.
	- The resources are still available.

# Limitations 

- Before beginning this process be sure to read the [Move operation support for resources](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/move-support-resources) page. This page details what resources can be moved between resources group, subscriptions, and regions.

>[!cue] What are
>Limitations on moving resources?
# Implementation
- Select the resource group and then select the Move button.
	- Select the resources to move and the destination
		- Acknowledge that you need to update scripts
![[Pasted image 20241010003049.png]]

> [!note]
> Just because a service can be moved doesn't mean there aren't any restrictions.  You can move a virtual network, but you must also move its dependent resources, like gateways.