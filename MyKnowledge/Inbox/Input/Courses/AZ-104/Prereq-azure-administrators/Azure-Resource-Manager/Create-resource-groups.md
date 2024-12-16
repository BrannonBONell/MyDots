---
tags: azure microsoft resource groups cloud devops
date: 9th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Create Resource Groups
>[!summary] 
>- Resources deployed to new or existing resource group
>- Resources can exist once per group, resource groups can't be renamed, resource groups can have resources of many different types and from many different regions
>- all resources in a group should share the same lifecycle
>- add or remove resource at any time


- Resources can be deployed to new or existing resource group
	- Deployment of resources to a group becomes a job where you can track the template execution
	- If deployment fails the output of the job can describe why it failed
		- deployment can be a single resource to a group or a template to a group 
			- use the information to fix any errors and redeploy.
			- Deployments are incremental
				- if a resource group contains two web apps and you decide to deploy a third, the existing web apps will not be removed.

# Considerations

- Resource groups are a logical collection of resources. There are a few rules for resource groups:
	- Resources can only exist in one resource group.
	- Resource Groups cannot be renamed.
	- Resource Groups can have resources of many different types (services).
	- Resource Groups can have resources from many different regions.

# Creating resource groups

- Important factors to consider when defining your resource group:
	- All the resources in your group should share the same lifecycle. You deploy, update, and delete them together. If one resource, such as a database server, needs to exist on a different deployment cycle it should be in another resource group.
	- Each resource can only exist in one resource group.
	- You can add or remove a resource to a resource group at any time.
	- You can move a resource from one resource group to another group. Limitations do apply to [moving resources](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/move-support-resources).
	- A resource group can contain resources that reside in different regions.
	- A resource group can be used to scope access control for administrative actions.
	- A resource can interact with resources in other resource groups. This interaction is common when the two resources are related but don't share the same lifecycle (for example, web apps connecting to a database).

>[!cue]  Location
>When creating a resource group always provide a location for that group
- Creating a resource group provide a location for that resource group
	- The resource group stores metadata about the resources
		- When you specify a location You're specifiying where the metadata is stored.
			- For compliance reasons you may need to ensure that your data is stored in a particular region

> [!important]
> By scoping permissions to a resource group you can add/remove and modify resources easily without having to recreate assignments and scopes.