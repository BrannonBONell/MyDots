---
tags: microsoft azure cloud dns devops
date: 01-10-2024
---

# Azure DNS

- A hosting service for DNS domains that provides name resoluti0on by using Microsoft Azure infrastructure.
	- By hosting your domains in Azure, you can manage your DNS records using the same credentials, APS tools and billing as your other Azure services

# Benefits of Azure DNS

- Uses the scope and scale of Microsoft Azure to provide benefits
	- Reliability and performance
	- Security
	- Ease of Use
	- Customizable virtual networks
	- Alias records

# Reliability and Performance

- Hosted on Azure's global network of DNS name servers
	- providing resiliency and high availability
- Azure DNS uses anycast networking
	- The closest available DNS server answers each DNS query, providing fast performance and high availability for your domai8n.

# Security

- Azure DNS is based on Azure Resource Manager which has features:
	- Azure role-based access control (Azure RBAC) to control who has access to specific actions for your organization.
	- Activity logs to monitor how a user in your organization m0odified a resource or to find an error when troubleshooting.
	- Resource locking to lock a subscription, resource group, or resource
		- Locking prevents other users in your organization from accidently deleting or modifying critical resources.

# Ease of Use

- Can manage DNS records for your Azure services and provide DNS for your external resources as well
- Azure DNS is integrated in the Azure portal aND USES THE SAME CREDENTIALS, SUPPORT CONTRACT, AND BILLING AS YOUR OTHER aZURE SERVICES

- You can manage your domains and records with Azure portal, Azure PowerShell cmdlets, and the cross-platform Azure CLI.
- Apps that require automated DNS management can integrate with the service by using the REST API and SDK's.

# Customizable virtual networks with private domains

-  Azure DNS supports private DNS domains.
	- Allows you to use your own custom domain names in your private virtual networks, rather than being stuck with an Azure-provided name

# Alias Records

- Azure DNS also supports alias record sets. You can use an alias record set to refer to an Azure resource, such as an Azure public IP address, an Azure Traffic Manager profile, or an Azure Content Delivery Network (CDN) endpoint. If the IP address of the underlying resource changes, the alias record set seamlessly updates itself during DNS resolution. The alias record set points to the service instance, and the service instance is associated with an IP address.


>[!Important] You can't use Azure DNS to buy a domain name. For an annual fee, you can buy a domain name by using App Service domains or a third-party domain name registrar. Once purchased, your domains can be hosted in Azure DNS for record management.