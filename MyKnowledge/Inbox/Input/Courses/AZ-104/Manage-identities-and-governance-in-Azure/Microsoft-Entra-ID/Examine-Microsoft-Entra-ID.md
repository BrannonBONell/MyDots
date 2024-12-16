---
tags: entra-id microsoft azure security authenticate
date: 11th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

#  Microsoft-Entra-ID
>[!summary] 
>- Is part of PaaS offering and operates as directory service in the cloud
>- Is mostly used for ID access supports MFA identity protection and self service password reset
>- Provides more Access to cloud based resources by many different methods
>- Comes in free basic and premium offerings.


- __Active Directory Domain Services (AD DS).
	- AD DS a directory service that provides methods for storing directory data
		- user accounts
		- passwords
	- Makes the data available to network users, administrators and other devices and services.
- It runs as a service on Windows Server
	- Referred to as a domain controller

- Entra ID is part of the (PaaS) offering and operates as Microsoft-managed directory service in the cloud.
	- Not part of the core infrastructure that customers own and manage
	- and its not an infrastructure as a service offering.
	- This implies you have less control over its implementation
		- Also you don't have to dedicate resources to its deployment or maintenance

- __Entra ID access to a set of features that aren't natively available in a AD DS
	- Support for MFA
	- Identity protection
	- self-service password reset

- __Entra ID provides a more secure access to cloud-based resources for organizations and individuals by:
	- Configuring access to applications
	- Configuring single sign-on (SSO) to cloud-based SaaS applications
	- Managing users and groups
	- Provisioning users
	- Enabling federation between organizations
	- Providing an identity management solution
	- Identifying irregular sign-in activity
	- Configuring multi-factor authentication
	- Extending existing on-premises Active Directory implementations to Microsoft Entra ID
	- Configuring Application Proxy for cloud and local applications
	- Configuring Conditional Access for users and devices
![[Pasted image 20241011071603.png]]

>[!cue] Entra ID
>What does Entra ID offer that aren't available in a ADS?
- __Microsoft Entra constitutes a separate Azure service
	- Its most elementary form, which any new Azure subscription includes automatically, doesn't incur any extra cost and is referred to as the Free tier.
		- If you subscribe to any Microsoft Online business services (Microsoft 365 or Microsoft Intune)
			- Automatically get Entra ID with access to all the free features
>[!note]
>By default, when you create a new Azure subscriptions by using a Microsoft account, the subscription automatically includes a new Microsoft Entra tenant named Default Directory.

- More advanced identity management features require paid versions of Entra ID
	- Offered in Basic and Premium tiers
	- Some of these features are also automatically included in Entra instances generated as part of Microsoft 365 subscriptions.

- Implementing Entra ID isn't the same as deploying VMs in Azure, adding AD DS, and then deploying some domain controllers for a new forest and domain.
	- Entra ID is a different service much more focused on providing identity management services to web-based apps, unlike Ad DS, which is more focused on  onsite apps.

# Microsoft Entra tenants

- Entra ID is multi-tenant by design and is implemented to ensure isolation between its individual directory instances.
- World's largest multi-tenant directory
	- hosting over a million directory services instances, with billions of authentication requests per week.
- The term tenant in this context usually represents a company or organization that signed up for a subscription to a Microsoft cloud-based service such as Microsoft 365, Intune, or Azure, each of which uses Entra ID
	- From a technical standpoint, the term tenant represents an individual Microsoft Entra instance.
	- Within an Azure subscription, you can create multiple Microsoft Entra tenants.
	- Having multiple Microsoft Entra tenants might be convenient if you want to test Microsoft Entra functionality in one tenant wwithout affecting the others.

>[!cue] Entra tenants
>What is an Entra tenant?
- An Azure subscription must be associated with one, and only one, Microsoft Entra tenant.
	- This association allows you to grant permissions to resources in the Azure subscription (via RABC) to users, groups, and applications that exist in that particular Microsoft Entra tenant.
>[!note]
>You can associate the same Microsoft Entra tenant with multiple Azure subscriptions.  This allows you to use the same users, groups, and applications to manage resources across multiple Azure subscriptions.

- Each Microsoft Entra tenant is assigned the default Domain Name System (DNS) domain name
	- consisting of a unique prefix
		- The prefix derived from the name of the Microsoft account you use to create an Azure subscription or provided explicitly when creating a Microsoft Entra tenant, is followed by the onmicrosoft.com suffix.
		- Adding at least on custom domain name to the same Microsoft Entra tenant is possible and common.
		- This name utilizes the DNS domain namespace that the corresponding company or organization owns.
		- The Microsoft Entra tenant serves as the security boundary and a container for Microsoft Entra objects such as users, groups, and applications
		- A single Microsoft Entra tenant can support multiple Azure subscriptions.

# Microsoft Entra schema

- **Schema Differences**:
    
    - Fewer object types than AD DS.
    - Lacks a computer class but includes a device class.
    - Easily extensible and extensions are reversible.
- **Device Management**:
    
    - Different process for joining devices compared to AD DS.
    - Does not support traditional computer domain membership.
    - Cannot use Group Policy Objects (GPOs) for management.
- **Modern Management**:
    
    - Focuses on modern management techniques.
    - Strengths in directory services, user/device/application data management, and authentication/authorization.
    - Integral to cloud services like Microsoft 365, supporting millions of users.
- **Organizational Structure**:
    
    - No organizational unit (OU) class.
    - Objects cannot be arranged in hierarchical custom containers.
    - Use group memberships for organizing and managing objects.
- **Application Management**:
    
    - Applications represented by Application and servicePrincipal classes.
    - Application class: Contains application definition.
    - servicePrincipal class: Represents application instance in a tenant.
    - Allows cross-tenant application usage by creating service principal objects in each tenant.

This note highlights the key features and differences of Microsoft Entra ID, emphasizing its modern management capabilities and cloud integration.