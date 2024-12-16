---
tags: microsoft azure cloud storage redundancy service devops
date: 10-03-2024
---

# Storage Redundancy

- Azure Storage always has multiple copies of your data so that its protected from things such as 
	- transient hardware failures
	- network or power outages
	- natural disasters
	- etc
- Redundancy ensures that your storage account has its availability and durability targets even in the face of failures

-  When deciding which redundancy option is best for your situations
	- consider the tradeoffs between lower costs and higher availability
		- Factors that help determine which redundancy option you should choose:
			- How your data is replicated in the primary region
			- Whether your data is replicated to a second region that is geographically distant to the primary region, to protect against regional disasters
			- Whether your application requires read access to the replicated data in the secondary region if the primary region becomes unavailable.

# Redundancy in the primary region

- Data in an Azure Storage account is replicated three times in the primary region.
- Azure storage offers two options for data replication in the primary region
	- Locally redundant storage (LRS) and 
	- zone-redundant storage (ZRS)

# Locally redundant storage

 - Locally redundant storage (LRS) replicates your data three times within a single data center in the primary region
 - LRS provides at leastt 11 nines of durability (99.9999999999999%) of objects over a given year.
 ![[Pasted image 20241003200624.png]]

- LRS is the lowest-cost redundancy option and offers the least durability compared to other options
	- LRS protects your data against server rack and drive failures
		- if a disaster such as a fire or flooding occurs in the data center
			- All replicas of storage account using LRS may be lost or unrecoverable.
	- To mitigate this risk, think about using zone-redundant storage (ZRS)
	- geo-redundant storage (GRS)
	- or geo-zone-redundant storage (ZGRS)

# Zone-redundant storage

- For Availability Zone-enabled regions, ZRS replicates your Storage data synchronously across three availability zones in the primary region.
- ZRS offers durability for Azure Storage data objects of at least 12 nines (99.999999999999%) over a given year
![[Pasted image 20241003201032.png]]

- With ZRS, your data is still accessible for both read and write operations even if a zone becomes unavailable.
- No remounting of Azure file shares from the connected clients is required
- If a zone becomes unavailable
	- Azure undertakes networking updates, such as DNS repointing.
		- These updates may affect your application if you access data before the updates have completed
	- ZRS is recommended in the primary region for situations that require high availability.
	- ZRS is also recommended for restricting replication of data within a country or region to meet data governance requirements.

# Redundancy in a secondary region

- For applications requiring high durability, additionally copy the data in your storage account to a secondary region that is hundreds of miles away from the primary region.
- If your data is copied to a secondary region then it is durable even in the event of a catastrophic failure that prevents the data in the primary region from being recovered

- When you create a storage account
	- Select the primary region for the account
	- The paired secondary region is based on Azure Region Pairs, and can't be changed

- Azure Storage offers two options for copying your data to a secondary region
	- geo-redundant storage (GRS)
		- Similar to running LRS in two regions
	- geo-zone-redundant storage (GZRS)\
		- similar =to running ZRS in the primary region and LRS in the secondary region-

- By default
	- Data in the secondary region isn't available for read or write access unless there's a failover to the secondary region
	- If the primary region becomes unavailable
		- you can choose to fail over to the secondary region.
		- After the failover has completed
			- the secondary region becomes the primary region, and you can again read and write data
> [!important] Important
> Data is replicated to the secondary region asynchronously a failure that affects the primary region may result in loss of data if the primary region can't be recovered. The time between the most recent writes to the primary region and the last write to the secondary region is the recovery point objective(RPO). The RIP is the point in time to which data can be recovered. Azure Storage typically has an RPO of less than 15 minutes,
> although there's currently no SLA on how long it takes to replicate data to the secondary region.


# Geo-redundant storage

- GRS copies your data synchronously 3 times within a single physical location in the primary region using LRS
	- It then copies yoru data asynchronously to a single physical location in the secondary region (region pair) using LRS.
		- GRS offers durability for Azure Storage data objects of at least 16 nines (99.9999999999999999%) over a given year

![[Pasted image 20241003202457.png]]

# Geo-zone-redundant storage

- GZRS combines the high availability provided by redundancy across availability zones with protection from regional outages provided by geo-replication
- Data in a GZRS storage account is copied acrosss three Azure availability zones in the primary region (similar to ZRS) and is also replicated to a secondary geographic region, using LRS, for protection from regional disasters
- It is recommended to use GZRS for application requiring maximum consistency, durability and availability, excellent performance, and resilience for disaster recover
![[Pasted image 20241003202809.png]]

- GZRS is designed to proivide at least 16 nines (99.99999999999999999%) of durability of objects over a given year.

# Read access to data in the secondary region

- Geo-redundant storage (with GRS or GZRS) replicates your data to another physical location in the secondary region to protect against regional outages.
	- The data is available to be read only if the customer o=r Microsoft initiates a failover from the primary to secondary region
		- If you enable read access to the secondary region your data is always available
			-  even when the primary region is running =optimally
	- For read access to the secondary region, enable read-access geo-redundant storage (RA-GRS) or read-access geo-zone-redundant storage (RA-GZRS)
> [!important] Important
> Remember that  the data in your secondary region may not be up to date due to RPO
