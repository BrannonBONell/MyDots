---
tags: cloud compute microsoft azure SaaS PaaS IaaS service types
date: 09-30=2024
---

# Infrastructure as a Service

- Is the most flexible of =cloud services
	- Provides the maximum amount of control for your cloud resources.
	- IaaS model the cloud provider is responsible for maintaining
		- Hardware, network connectivity, and physical security.
	- You're responsible for everything else.
		- OS installation, configuration, and maintenance; network configuration; database and storage configuration, and so on.
	- With IaaS essentially you are renting the hardware in a cloud datacenter.

# Shared Responsibility Model

- Applies to all cloud service types.
	- IaaS places the largest share of responsibility with the customer.
	- The cloud provider is responsible for maintaining the physical infrastructure and its access to the internet.
	- Customer responsible for installation and configuration, pattching and updates, and security

![[Pasted image 20240930115939.png]]

# Scenarios

- Common scenarios where IaaS might make sense:
	- Lift-and shift migration:
		- You're setting up cloud resources similar to your on site datacenter
			- Simply moving the things running on site to running on the IaaS infrastructure
	- Testing and development
		- You have established configurations for development and test environments that you need to rapidly replicate.
		- Can start up or shut down the different environments rapidlyh wi9th an IaaS structure, while maintaining complete control

# Platform as a Service

- PaaS is the middle ground between renting space in a datacenter or IaaS, and paying for a complete and deployed solution SaaS.
	- In a PaaS environment cloud provider maintains the physical infrastructure, physical security and connection to the internet
	- Also maintain the OSs, middleware, development tools, and business intelligence services that make up a a cloud solution.
	- PaaS don't have to worry about the licensing or patching of OSs and databases
- Paas is well suited to provide a complete development environment without the headache o9f maintaining all of the development infratstructure

# Shared responsibility model

- PaaS splits the responsibility between customer and cloud provider.
	- Cloud provider is responsible for maintaining physical infrastructure and its access to the internet just like IaaS.
	- In the PaaS model the cloud provider will also maintain the OSs, database, and development tools
		- PaaS is like using a domain joined machine:
			- IT maintains the device with regular updates, patches, and refreshes.

- Depending on the config
	- You or the cloud provider may be responsible for networking settings and connectivity wi8thin your cloud environment, network and application security, and the directory Infrastructure.
![[Pasted image 20240930120821.png]]

# Scenarios

- Common scenarios where PaaS might make sense:
	- Development Framework:
		- PaaS provides a framework that developers can build upon to develop or customize cloud-based applications.
		- PAAS lets developers create applications using built-in software components.
		- Cloud features such as scalability, high-availability, and multi-tenant capability are included reducing the amount of coding that developers must do.
	- Analytics or business intelligence:
		- Tools provided as a service with Paas allow organizations to analyze and mine their data, finding insights and patterns and predicting outcomes to prove forecasting, product design decisions, investment returns, and other business decisions.

# Software as a Service

- SaaS is the most complete cloud service model from a product perspective.
	- SaaS is essentially renting or using a fully developed application.
		- Email, financial software, messaging applications, and connectivity software are all common examples of SaaS implementation.

# Shared Responsibility Model

- SaaS is the model that places the most responsibility with the cloud provider and least on the user.
	- SaaS environment you're responsible for tthe data that you put into the system, the devices that you allow to connect to the system, and the users that have access.
	- Everything else falls on the cloud provider.
	- The cloud provider is responsible for physical security of the datacenters, power, network connectivity, and application development and patching
![[Pasted image 20240930121532.png]]

# Scenarios
- common SaaS scenarios:
	- Email and messaging
	- Business productivity applications
	- Finance and expense tracking

## Summary

You should now be able to:

- Describe infrastructure as a service (IaaS).
- Describe platform as a service (PaaS).
- Describe software as a service (SaaS).
- Identify appropriate use cases for each cloud service (IaaS, PaaS, SaaS).