---
tags: azure microsoft cloud devops
date: 09-28-2024
---

# Shared Responsibility Model

- In a traditional datacenter.  The company is responsible for maintaining the physical space, ensuring security, and maintaining or replacing the servers if anything happens
- The IT department is responsible for maintaining all the infrastructure and software needed to keep the datacenter up and running
- They're also likely to be resp9onsible for keeping all systems patched and on the correct version
	- The Shared Responsibility Model
		- These responsibilities get shared between the cloud provider and the consumer.
		- Physical security, power, cooling , and network connectivity is the cloud providers responsibility
		- The consumer isn't collocated with the datacenter, so it wouldn't make sense for the consumer to have any of those responsibilities
	- The consumer is responsible for the data and information stored on the cloud. (You don't want the cloud provider to be able to read your information)
	- The consumer is also responsible for access security, meaning you only give access to those who need it.
- Then for some things, responsibility depends on the situation
	- You're using an cloud SQL database,  the cloud provider would be responsible for maintaining the actual database
	- The consumer is still responsible for the data that gets ingested by the database.
	- If deployed a VM and installed an SQL database on it, you would be responsible for the database patches and updates, as well as maintaining the data and information stored on the database
- With an on site datacenter, you are responsible for everything
	- With cloud, those responsibilities shift.
	- The Shared Responsibility model is heavily tied into the cloud service types:
		- Infrastructure as a service (IaaS), platform as a service (PaaS, and software as a service (SaaS)
		- IaaS places the most responsibility on the consumer, with the cloud provider being responsible only for the basics of physical security, power and, connectivity
		- SaaS places places most of the responsibility with the cloud provider
		- PaaS, being in the middle between IaaS and SaaS, and evenly distributes responsibility between the cloud and the consumer.
- This highlights how shared responsibility model informs who is responsible for what, depending on the service type:
![[{50357899-9EED-4085-A5ED-58BFE2157BBC}.png]]

- When using a cloud you'll always be responsible for
	- Information and data stored on the cloud.
	- Devices that are allowed to connect to your cloud
	- Accounts and Identities of the people, services and devices within your organization
- The Cloud will always be responsible for
	- The Physical datacenter
	- The Physical network
	- The Physical hosts
- Your service model will determine responsibility for things like
	- Operating Systems
	- Network Controls
	- Applications
	- Identity and infrastructure
