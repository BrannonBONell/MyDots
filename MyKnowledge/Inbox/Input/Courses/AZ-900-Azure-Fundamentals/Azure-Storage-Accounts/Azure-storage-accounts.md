---
tags: azure microsoft coloud devops storage space
date: 03-10-2024
---

# Storage Account

- Provides a unique namespace for your Azure Storage data that you can access from anywhere in the world over HTTP or HTTPS.
- Data in the account is secure
	- Highly available
		- durable
			- and hugely scalable
- When creating a storage account
	- Start by picking the type.
	- Type of account decides the storage options and has an effect on the use cases:
		- Locally redundant storage(LRS)
		- Geo-redundant storage(GRS)
		- Read-access geo-redundant storage (RA-GRS)
		- Zone-redundant storage (ZRS)
		- Geo-zone-redundant storage (GZRS)
		- Read-Access geo-zone-redundant storage (RA-GZRS)
![[Pasted image 20241003074144.png]]

# Storage Account Endpoints

- A benefit from having an Azure Storage Account is having a unique namespace for your data
- For this to be possible every storage account in Azure must have a unique-in-Azure account name.
- Combination of the account name and Azure Storage service endpoint creates the endpoints for your storage account

- When naming your storage account
	- Must be between 3 and 24 characters, may contain numbers and lowercase letters only
	- Your storage account name has to be unique with Azure.
		- No two storage accounts have the same name.
		- Supporting the ability to have a unique, accessible namespace in Azure
![[Pasted image 20241003074631.png]]

