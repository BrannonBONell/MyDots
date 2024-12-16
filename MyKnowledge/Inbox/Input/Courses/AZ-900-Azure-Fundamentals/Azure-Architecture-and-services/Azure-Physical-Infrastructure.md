---
tags: microsoft azure cloud compute infrastructure physical
date: 09-30-2024
---

# Core architectural Compoenents

- Physical Infrastructure

- Management Infrastructure

# Physical Infrastructure

- Starts with datacenters with Azure
	- Datacenters are the same as large corporate datacenters
	- They're facilities with resources arranged in racks, with dedicated power, cooling, and network infrastructure.

- As a global provider, Azure has datacenters around the world
	- These individual datacenters aren't directly accessible.
		- Datacenters are grouped into Azure Regions or Azure Availability Zones that are designed to help achieve resiliency and reliability for your business critical workloads.
- The Global Infrastructure site gives you a chance to interactively explore the underlying Azure Infrastructure.

# Regions

- Geographical area on the planet that contains at least one but potentially multiple datacenters that are nearby and networked together with a low latency network
- Azure intelligently assigns the controls the resources within each region to ensure workloads are appropriately balanced.

- When you deploy a resource in azure you often have to choose which region.

# Availability Zones

- Physically seperated datacenters within an Azure region.
	- Each availability zone is made up of one or more datacenters equipped with independent power, cooling, and networking.
	- An availability zone is set up to be an isolation boundary
		- If one zone goes down, the other continues working
	- Availability zones are connected through high-speed, private fiber-optic networks.
![[Pasted image 20240930141409.png]]

# Use availability zones in your apps

- To ensure your services and data are redundant so yo can protect your information in case of failure.
	- When you host your infrastructure setting up your own redundancy requires that you create duplicate hardware environments.
		- Azure can help make your app highly available through availability zones.

- Use availability zones to run mission critical applications and build hgigh-availability into your application architecture by co-locating your compute, storage, and networking, and data resources within an availability zone and replicating in other availability zones.
	- Keep in mind that there could be a cost to duplicating your services and transferring data between availability zones.

- Availability zones are primarily for VMs
	- managed disks, load balancers, and SQL databases
- Azure services that support availability zones fall into three categories:
	- Zonal services:
		- You pin the resource to a specific zone (VMs, managed disks, Ip addresses)
	- Zone-redundant services:
		- The platform replicates automatically across zones (zone-redundant storage, SQL database)
	- Non-regional services:
		- Services are always available from Azure geographies and are resilient to zone-wide outages as well as region-wide outages

- Even with the resiliency that availability zones provide
	- An event could be so large that it impacts multiple availability zones in a single region
		- To provide even further resilience, Azure has Region Pairs

# Region Pairs

- Most Azure regions are paired with another region within the same geography (at least 300 miles away)
	- This approach allows for the replication of resources across a geography that helps reduce the likelihood of interruptions because of events such as natural disasters, civil unrest, power outages, or physical network outages that affect an entire region
		- If a region in a pair was affected by a natural disaster
			- Services would automatically fail over to the other region in its region pair.

- Examples of region pairs in Azure are West US paired with the East US and South-East Asia paired with East Asia.
	- Because the pair of regions are directly connected and far enough apart to be isolated from regional disasters
		- You can use them to provide reliable services and data redundancy
![[Pasted image 20240930143324.png]]

## Additional advantages of region paris:

- If an extensive Azure outage occurs
	- One region out of every pair is prioritized to make sure at least one is restored as quicklyu as possible for applications hosted in that region pair
	- Planned Azure updates are rolled out to paired regions.
		- One region at a time to minimize downtime and risk of application outage.
	- Data continues to reside within the same geography as its pair (except for Brazil South) for tax- and law-enforcement jurisdiction purposes.

> [!important] 
> Most regions are paired in two directions, meaning they are the backup for the region that provides a backup for them (West US and East US back each other up). However, some regions, such as West India and Brazil South, are paired in only one direction. In a one-direction pairing, the Primary region does not provide backup for its secondary region. So, even though West India’s secondary region is South India, South India does not rely on West India. West India's secondary region is South India, but South India's secondary region is Central India. Brazil South is unique because it's paired with a region outside of its geography. Brazil South's secondary region is South Central US. The secondary region of South Central US isn't Brazil South.

# Sovereign Regions

-  In addition to regular regions
	- Azure also has sovereign regions
		- Sovereign regions are instances of Azure that are isolated from the main instance of Azure.
		- You may need to use a sovereign region for compliance or legal purposes.

- Azure sovereign regions include:
	- US DoD Central, US Gov Virginia, US Gov Iowa and more:
		- These regions are physical and logical network-isolated instances of Azure for U.S. government agencies and partners.  These datacenters are operated by screened U.S. peronnel and include additional compliance certifications.
	- Chine East, China North, and more.
		- These regions are available through a unique partnership between Microsoft and 21Vianet, whereby Microsoft doesn't directly maintain the datacenters.