---
tags: azure microsoft cloud devops security authenticate defense
date: 8th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Defence in Depth
>[!summary] 
>- Defence in depth is just multiple security layer that protect data.
>- there are many layers including
>- Physical Security, Identity & Access, Perimeter, Network, Compute, and Application.
- Objective is to protect information and prevent it from being stolen by those who aren't authorized to access it.
- A defence-in-depth strategy uses a series of mechanisms to slow the advance of an attack that aims at acquiring unauthorized access to data.

# Layers of defence-in-depth

- You can visualize it as a set of layers
	- Data to be secured at the center and all the other layers functioning to protect that central data layer
![[Pasted image 20241008200315.png]]

>[!cue] What is
>Layers of defence-in-depth
>protecting?
- Each layer provides protection so that if one layer is breeched
	- A subsequent layer is already in place to prevent further exposure.
	- This approach removes reliance on any single layer of protections
		- It slows down an attack and provides alert information that security teams can act upon
			- Automatically or manually.

- Here's a brief overview of the role of each layer
	- The physical security layer is the first line of defence to protect computing hardware in the datacenter
	- The identity and access layer controls access to infrastructure and change control.
	- The perimeter layer uses distributed denial of service (DDoS) protection to filter large-scale attacks before they can cause a denial of service for users.
	- The network layer limits communication between resources through segmentation and access controls.
	- The compute layer secures access to virtual machines.
	- The application layer helps ensure that applications are secure and free of security vulnerabilities.
	- The data layer controls access to business and customer data that you need to protect.

>[!cue] What are
>the roles of each layer?
- These layers are to be used as a guideline for you to help make security config decisions in all layers of your applications

- Azure provides security tools and features At every layer of defence .

# Physical security

- First line of defence is securing buildings and controlling access to computing hardware within the datacenter are the first line of defence

- Intent is to provide safeguards against access to assets.
	- Safeguards make sure that other layers can't be bypassed
	- and loss or theft is handled properly.
		- Microsoft uses various physical security mechanisms in its cloud datacenters.

# Identity and access

- This layer is all about making sure that identities are secure
	- Access is granted only to what's needed
		- Sign-in events and changes are logged
- At this layer its important:
	- Control access to infrastructure and change control.
	- Use single sign-on (SSO) and multifactor authentication.
	- Audit events and changes.

# Perimeter

- Protects from network-based attacks against your resources.
	- Identifying attacks
	- eliminating their impact
	- alerting you when they happen
- Are important ways to keep your network secure

- At this layer it important:
	- Use DDoS protection to filter large-scale attacks before they can affect the availability of a system for users.
	- Use perimeter firewalls to identify and alert on malicious attacks against your network.

# Network

- At this layer
	- focus is on limiting network connectivity across all you resources and allow only what's required.
	- Limiting this communication you reduce the risk of an attack spreading to other systems.

- At this layer its Important
	- Limit communication between resources.
	- Deny by default.
	- Restrict inbound internet access and limit outbound access where appropriate.
	- Implement secure connectivity to on-premises networks.

# Compute

- Malware, unpatched systems, and poorly secured systems leave your environment open to attacks.
	- Focus is on making sure that your compute resources are secure and that you have the proper controls in place to minimize security issues.

- At this layer its important
	- Secure access to virtual machines.
	- Implement endpoint protection on devices and keep systems patched and current.

# Application

- Integrating security into app development helps reduce vulnerabilities introduced in code
	- Development teams should ensure that its applications are secure by default

- At this layer its important:
	- Ensure that applications are secure and free of vulnerabilities.
	- Store sensitive application secrets in a secure storage medium.
	- Make security a design requirement for all application development

# Data

- Often regulatory requirements dictate the controls aned processes that must be in place to ensure the co9nfidentiality, integrity, and availability of data.

- In almost all cases attackers are after data:
	- Stored in a database.
	- Stored on disk inside virtual machines.
	- Stored in software as a service (SaaS) applications, such as Office 365.
	- Managed through cloud storage.