---
tags: azure microsoft directory service cloud devops
date: 5th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Directory Services
>[!summary] Directory Services
>- Entra ID enables sign into and access both Microsoft cloud apps and cloud apps you develope
>- Active Directories run on Windows Servers provide identity and access management thats managed by your organization.
>- Common users of Entra ID IT Administrators, App Developers, Users, Online service subscribers
>- Entra ID  does authentication, SSO, App management, and Device management
>- Entra Connect synchronizes Entra ID with AD

- Microsoft Entra ID is a directory service that enables you to sign in and access both Microsoft cloud applications and cloud application you develop.
	- Entra ID can help you maintain onsite Active Directory deployment
	
>[!cue] Entra ID
>Microsofts cloud-based identity and access management service
- Onsite environments
	- Active Directory running on Windows server provides an identity and access management service that's managed by your organization
- Entra ID is Microsofts cloud based identity and access management service
	- With Entra ID you control the identity of accounts
		- Microsoft ensures that the service is available globally
		
>[!cue] Active Directory
>Identity and access
>management service 
>managed by your organization
- secured onsite identities with Active Directory
	- Microsoft doesn't monitor sign in attempts.
	- When connecting Active Directory and Entra ID Microsoft can help protect you by detecting suspicious sign-in attempts at no extra cost
		- Entra ID can detect sign-in attempts from unexpected locations or unkown devices

# Who uses Microsoft Entra ID

- IT Administrators
	- Entra ID can control access to applications and resources based on their business requirements
	
>[!cue] Used by
>IT Administrators
>APP Developers
>Users
>Online Service Subs
- App developers
	- Entra ID can provide a standards-based approach for adding functionality to applications that they build
		- such as adding SSO functionality to an app or enabling an app to work with an user's existing credentials.
		
- Users
	- Users can manage their identities and take maintenance actions like self-service password reset
	
- Online service subscribers
	- Microsoft 365, Microsoft Office 365, Azure, and Microsoft Dynamics CRM Online subscribers are already using Entra ID to authenticate into their accounts.

# What does Microsoft Entra ID Do?

- Authentication
	- Verifying identity to access applications and resources
	- Provides functionality like self-service password reset
	- Multifactor authentication
	- a custom list of banned passwords
	- and smart lockout services

>[!cue] Entra ID
>Does four things
>what are they?
- Single sign-on
	- (SSO) one username and one password to access multiple applications
	- Single identity is tied to a user
	- As users change roles or leave that organization
		- access modifications are tied to the identity.
			- Reduces the effort needed to change or disable accounts

- Application management
	- Manage your cloud and onsite apps using Entra ID
	- Feature like
		- Application proxy
		- SaaS apps
		- My Apps portal
		- and SSO provide a better user expierence

- Device Management
	- Entra ID suppports the registration of devices
		- enables devices to be managed through tools like Microsoft Intune.
		- Device-based Conditional Access Policies to restrict access attempts to only those coming from known devices
			- regardless of the requesting user account

# Can I connect my onsite AD with Microsoft Entra ID?

- onsite environment running Active Directory and a cloud deployment using Microsoft Entra ID you would need to maintain two identity sets.
	-   Connect Active Directory with Microsoft Entra ID
		- enabling a consistent identity experience between cloud and onsite
		
>[!cue] Microsoft Entra Connect
>Synchronizes
>user identites between
>AD and Entra ID
- One way of connecting Entra ID with y9our onsite AD is using Microsoft Entra Connect
	- Entra Connect synchronizes user identities between onsite Active Directory and Microsoft Entra ID
		- Entra IConnect synchronizes changes bewtween both identity systems you can use features like
			- SSO
			- multifactor authentication
			- and self service password reset under both systems

# What is Microsoft Entra Domain Services?

- Service that provides managed domain services
	- domain join
	- group policy
	- lightweight directory access protocol (LDAP)
	- Kerberos/NTLM authentication

>[!cue] Entra Domain Services
>Get Domain Services
>without DCs in
>the cloud
- Entra ID has the ability to have directory services without having to maintain the infrastructure supporting it
	- Entrta Domain Services you get domain services without the need to deploy, manage, and patch domain controllers (DCs) in the cloud

- Managed domain lets you run legacy applications in the cloud that can't use modern authentication methods or where you don't want directory lokups to always go back to an onsite AD DS environment.
	- You can lift and shift those legacy applications from onsite environment into a managed domain without needing to manage the AD DS environment in the cloud

- Entra Domain Services integrates with your existing Microsoft Entra tenant.
	- Integration lets users sign into services and applications connected to the managed domain using their existing credentials
		- can use existing groups and user accounts to secure accesss to resources.
			- These features provide a smother lift and shift of onsite resources to Azure

# How does Microsoft Entra Domain Service Work?

- When creating a Microsoft Entra Domain Services managed domain you define a unique namespace
	- This namespace is the domain name
		- Two Windows Server domain controllers are then deployed into your slected Azure region
			- This deployment of DCs is known as a replica set

>[!cue] Entra Domain Service
>define with namespace
>Two Windows Server DCs
>known as a replica set
- No need to manage configure or update these DCs.
	- The Azure platform handles the DCs as part of the managed domain including backups and encryption at rest using Azure Disk Encryption

# Is information synchronized?

- Managed domain is configured to perform a one way synchronization from Entra ID to Entra Domain Servicves
	- can create resources directly 9in the managed domain
		- they are not synchronized back to Entra ID.
			- A hybrid environment with an onsite AD DDS environment Entra Connect synchronizes identity information with Entra ID then synchronized to the managed domain.
![[{55E6BAD9-299E-48BC-B095-A8500E379B40}.png]]

- Applications services and VMs in Azure that connect to the managed domain can then use common Entra Domain Services features such as:
	- domain join
	- group policy
	- LDAP
	- and Kerberos/NTLM authentication