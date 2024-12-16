---
tags: cloud models azure microsoft services az900 private public hypbrid
date: 09-292024
---

# Private cloud

- The natural evolution from a corporate datacenter.
	- It's a cloud (Delivering IT services over the internet)
		- that's used by a single entity
	- Private cloud provides much greater control for the company and its IT department
	- Comes with greater cost and fewer of the benefits of a public cloud deployment
	- Private cloud may be hosted from your on site datacenter
	- Hosted in a dedicated datacenter offsite
	- and potentially even by a third party that has dedicated that datacenter to your company

# Public Cloud
- Built, controlled and maintained by a third-party cloud provider.
	- Anyone that wants to purchase cloud services and resources can use them
	- General public availability is key difference between public and private cloud

# Hybrid cloud

- Computing environment that uses both public and private clouds in an inter-connected environment.
	- Can be used to allow private cloud to surge for increased, temporary demand by deploying public cloud resources
	- Used to provide an extra layer of security
		- Users can flexibly chose which service es to keep in public cloud and which to deploy to their private cloud infrastructure.

![[Pasted image 20240929042608.png]]

# Multi-cloud

- Increasingly likely scenario is multi-cloud.
	- In a multi-cloud, you use multiple public cloud providers
		- Possibly using different features from the different cloud providers.
		- Or you just started your cloud journey with one provider and are in the process of migrating to a different provider.
		- In a multi-cloud environment you deal with two (or more) public cloud providers and manage resources and security in both environments.

# Azure Arc

- Set of technologies that help manage your cloud environment.
	- Azure Arc can help, whether its a public cloud solely on Azure
	- A private cloud in your datacenter
	- A hybrid configuration
	- Or even a multi-cloud environment running on multiple cloud providers at once

# Azure VMware Solutions

- What if you have established with VMware in a private cloud environment but now want to migrate to public or hybrid cloud?
	- Azure VMware Solution lets you run your VMware workloads in Azure with seamless integration and scalability.