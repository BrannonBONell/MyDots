---
tags: microsoft azure regions devops cloud subscriptions
date: 11th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Azure Regions
- Azure is made up of datacenters around the world.
	- Datacenters are organized and made available by region
	- A region a geographical area on the planet containing at least one datacenter/s
	- Datacenters in close proximity are networked together with a low-latency network
	- A few regions are West US, Canada Central, West Europe, Australia East, and Japan West

# Know about Regions

- Azure is available in more than 60 regions and 140 countrires.
- Azure has the more regions than any other cloud provider
- Regions provide flexibility and scale needed to bring apps close to users.
- Regions perserve data residency and offer compliance and resiliency options.

# Regional Pairs

- Most Regions are paired with another region within the same geography to make a region pair
- Regional pairs help to support always-on availablity of Azure Resources used by infrastructure.
- Following table describes some characteristics of region pairs:
![[Pasted image 20241011233233.png]]

# Consider when using regions and regional pairs.

- __Consider resource region deployment:
	- Plan regions where you want to deploy resources. Most Azure services when you deploy a resource you choose the region where you want your resource to be deployed.
- __Consider service support by region:
	- Some services or Azure VM's features are available only in certain regions, such as specific VMs sizes or storage types
- __Consider services that don't require regions
	- Some global Azure services that don't require you to select a region.  These services include Microsoft Entra ID, MIcrosoft Azure Traffic Manager, and Azure DNS
- __Consider benefits of data residency:
	- Take advantage of benefits of data residency offered by region pairs.  This feature can help you meet requirements for tax and law enforcement jurisdiction purposes.


# Regions for your business geography

- Visit the Azure global infrastructure website to find supported regions for your business geography.  You can search by country/region name or by Microsoft product, A list of supported region pairs and exceptions is also available.
![[Pasted image 20241011233935.png]]
![[Pasted image 20241011233940.png]]
