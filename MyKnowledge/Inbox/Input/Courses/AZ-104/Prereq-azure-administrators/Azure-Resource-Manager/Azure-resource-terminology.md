---
tags: micreosoft azure cloud devops resource terminology
date: 9th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Resource Terminology 
>[!summary] 
>- Different terms used for resource lingo in Azure
>- Resource Providers provide a set of resources and operations for working with an Azure service


- *resource*
	-  A manageable item that is available through Azure. Some common resources are a virtual machine, storage account, web app, database, and virtual network, but there are many more.

>[!cue] Terminology
>resource, resource group, resource provider, template, declarative syntax
- _resource group_
	- A container that holds related resources for an Azure solution. The resource group can include all the resources for the solution, or only those resources that you want to manage as a group. You decide how you want to allocate resources to resource groups based on what makes the most sense for your organization.

- *resource provider*
	-  A service that supplies the resources you can deploy and manage through Resource Manager. Each resource provider offers operations for working with the resources that are deployed. Some common resource providers are Microsoft.Compute, which supplies the virtual machine resource, Microsoft.Storage, which supplies the storage account resource, and Microsoft.Web, which supplies resources related to web apps.

- *template*
	-  A JavaScript Object Notation (JSON) file that defines one or more resources to deploy to a resource group. It also defines the dependencies between the deployed resources. The template can be used to deploy the resources consistently and repeatedly.

- *declarative syntax*
	-  Syntax that lets you state "Here is what I intend to create" without having to write the sequence of programming commands to create it. The Resource Manager template is an example of declarative syntax. In the file, you define the properties for the infrastructure to deploy to Azure.

# Resource Providers

>[!cue] What is 
>Microsoft.KeyVault/vaults? 
- Each provider offers a set of resources and operations for working with an Azure service
	- Want to store keys and secrets
		- Work with the Microsoft.KeyVault resource provider.
		- This resource provider offers a resource type called vaults for  creating key vault.

-  The name of a resource type is in this format : {resource-provider}/{resource-type}
	- the key vault type is Microsoft.KeyVault/vaults



> [!important]
> Before deploying your resources, gain an understanding of the available resource providers.  Knowing the names of resource providers and resources helps define resources you want to deploy in Azure.  Know the valid locations and API versions for each resource type.