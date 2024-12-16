---
tags: azure microsoft cloud administrators resource manager
date: 9th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Azure Resource Manager
>[!summary] 
>- ARM lets you deploy update or delete resources as a group
>- Use a template for deployment
>- ARM provides security, auditing, and tagging features to help manage resources after deployment
>- Consistent management layers lets you perform tasks through Azure PowerShell, Azure CLI, Azure portal, REST API, and client sdks.
>- 

- Infrastructure of application made up of many componenets
	- VM, storage account, virtual networ, web app, database, database server, and third-party services.
	- All of the components are related and interdependent parts of a single entity.
		- So you would want to deploy, manage, and monitor them as a group

- Azure Resource manager lets you work with your resources as a group.
	- deploy, update or delete all the resources for your solution in a single coordinated operation.
	- Use a template for deployment that can work for different environments such as testing, staging, and production.
	- Azure Resource Manager Provides:
		- Security
		- auditiing
		- and tagging features
	- To help you manage resources after deployment.

# Consistent management layer
>[!cue] How do 
>Tools interact with the same Azure Resource Manager API?
- Perform tasks through Azure PowerShell, Azure CLI, Azure portal, REST API, and client SDKs
- Choose the tools and APIs that work best for you

- Following image shows how tools interact with the same Azure Resource Manager API.
- API passes requests to the Azure Resource Manager service, authenticates and authorizes the requests.
- Azure Resource Manager then routes the requests to the appropriate resource providers.
![[Pasted image 20241009210723.png]]

# Benefits
>[!cue] What are
>Benefits from Azure Resource manager

- Azure Resource Manager provides several benefits:
	- You can deploy, manage, and monitor all the resources for your solution as a group, rather than handling these resources individually.
	- You can repeatedly deploy your solution throughout the development lifecycle and have confidence your resources are deployed in a consistent state.
	- You can manage your infrastructure through declarative templates rather than scripts.
	- You can define the dependencies between resources so they're deployed in the correct order.
	- You can apply access control to all services in your resource group because Role-Based Access Control (RBAC) is natively integrated into the management platform.
	- You can apply tags to resources to logically organize all the resources in your subscription.
	- You can clarify your organization's billing by viewing costs for a group of resources sharing the same tag.

# Guidance
>[!cue] Guidance
>Suggestions on how to use ARM	
- Suggestions to help you take full advantage of Azure Resource Manager when working with your solutions.
	- Define and deploy your infrastructure through the declarative syntax in Azure Resource Manager templates, rather than through imperative commands.
	- Define all deployment and configuration steps in the template. You should have no manual steps for setting up your solution.
	- Run imperative commands to manage your resources, such as to start or stop an app or machine.
	- Arrange resources with the same lifecycle in a resource group. Use tags for all other organizing of resources.

