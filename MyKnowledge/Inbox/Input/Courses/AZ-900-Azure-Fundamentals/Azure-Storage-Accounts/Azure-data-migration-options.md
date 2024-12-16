---
tags: azure cloud microsoft data migration devops
date: 4th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Azura Data Migration

>[!summary]  Azure Data Migration
>- Can physically migrate data up to 80TB with Microsoft Azure Data Box
>- Also Azure has Integrated tools for migrating data to their service
>- Azure Migrate: Discover and assessment, and Server Migration
>- The Data Migration Assistant
>- Azure Database Migration Services
>- and Azure App Servioce migration assistant

>[!cue] Azure Data Migration
>What is Azure MIgrate? What is Azure Data Box?

- Get your data and information into Azure
	- Real-time migration of Infrastructure applications and data using Azure Migrate
	- As well as asynchronous Migration of data using Azure Data Box

# Azure Migrate
>[!cue] Azure Migrate
>Unified migration platform, 
>Range of tools for assessment and migration
- Is a service that helps migrate from an onsite environment to the cloud
- Functions as a hub to help manage assessment and migration of onsite datacenter to azure
- Provides the follow
	- Unified migration platform:
		- Portal to start run and track migration to azure
	- Range of tools:
		- Tools for assessment and migration.
		- Azure migrate tools include:
			- Azure Migrate: Discover and assessment aned Azure Migrate: Server Migration.
		- Azure Migrate also integrates with other Azure services and tools, and with independent software (ISV) offerings.
		


# Integrated Tools
>[!cue] 7 Tools
> Azure Migrate: Discovery and Assessment, Azure Migrate: Server Migration, Data Migration Assistant, Azure Database Migrations Services, Azure App Service migration assistant, Azure Data Box
- Azure Migrate hub includes the following tools, as well as working with tools froms ISV's:
	- Azure Migrate: Discovery and assessment.
		- Discover and asses on-premises servers running on VMware, Hyper-V, and physical servers in preparation for migration to Azure
	- Azure Migrate: Server Migration
		- Migrate VMware VMs, Hyper-V VMs, physical servers, other virtualized servers, and public cloud VMs to azure
	- Data Migration Assistant
		- Data Migration Assistant is a stand-alon tool to assess SQL servers.  It helps potential problems blocking migration.  It identifies unsupported features new features that can benefit you after migration and the right path for database migration
	- Azure Database Migrations Services
		- Migrate onsite databases to Azure VMs running SQL Server, Azure SQL Database, or SQL Managed Instances
	- Azure App Service migration assistant
		- Is a standalone tool to assess onsite websites for migration to Azure Appp Service.  Use Migration Assistant to migrate .NET and PHP web apps to Azure.
	- Azure Data Box
		-  Use Azure Data Box products to move large amounts of offline data to Azure

# Azure Data Box
>[!cue] Azure Data Box
>A physical 80TB Drive
>used to migrate data
- A phyisical migration service that helps transfer large amounts of data in a fast, inexpensive and reliable way.
	- Secure data transfer is accelerated by shipping you a proprietary Data Box storage device that has a maximum usable storage capacity of 80TB.
		- The Data Box is transported to and from your datacenter via a regional carrier
			- A rugged case protects and secures the Data Box from damage during transit

- Order the Data Box via the Azure portal to import or export data from Azure.
	- Once the device is received it can be set up fast by using the local web UI and connect it to your network
		- Once finished transferring the data, simply return the Data Box.
			- If transferi9ng data into Azure the data is automatically uploaded once Microsoft receives the Data Box back.
				- The entire process is tracked end-to-end by the Data Box service in the Azure Portal

# Use Cases
>[!cue] Examples of use cases
>Data box suited for sizes
>Larger than 40TB with no 
>limited network connectivity 
- Data Box is suited to transfer data sizes large than about 40TB in situations with no limited network connectivity.
	- The data movement can be on-time, periodic, or an initial bulk data transfer followed by periodic transfers.
- Here are various scenarios where the Data Box can be used to import to Azure
	- Onetime migration
		- A large amount of onsite data is moved to Azure
	- Moving a media library from offline tapes into Azure to create an online media library
	- Migrating your VM farm, SQL server, and applications to Azure
	- Moving historical data to Azure for in-depth analysis and reporting using HDInsight
	- Initial bulk transfer
		- when an initial bulk transfer is done using Data Box (seed) followed by incremental transfers over the network
	- Periodic uploads
		- when large amount of data is generated periodically and needs to be moved to Azure
- Here are various scenarios Data Box can be used to export data from Azure
	- Disaster Recovery
		- when a copy of the data fropm Azure is restored to an onsite network
		- In a typical disaster recovery scenario a large amount of Azure data is exported to a Data Box.  Then ships out the Data Box and the data is restored on your site in a short time
	- Security requirements
		- When you need to be able to export data out of Azure due to government or security requirements
	- Migrate back to onsite or to another cloud service provider
		- When you want to move all the data back to onsite or to another cloud serrvice provider export data via Data Box to migrate the workloads.

>[!cue] NIST
>800-88r1 standards
- Once your data is uploaded to Azure
	- Disks on the device are wiped clean complying with NIST 800-88r1 standards.
		- For an export order Disks are erased once the device reaches the Azure Datacenter