---
tags: microsoft azure entra-id create user group accounts
date: 11th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Create User accounts
>[!summary] 
>- Every user needs an Azure user account to access Azure resources.
>- Three types of accounts; Cloud identity, Directory-synchronized identity, Guest user
>- Consider if users are within your Microsoft Entra organization, external Microsoft Entra instances, external to your organization
>- You can have a combination of user account types.


- Every user who wants access to Azure resources needs and Azure user account.
	- A user account has all the info to authenticate
	- Entra ID supports 3 types of user accounts:
		- The types indicate where the user is defined (in the cloud or on-premise), whether the user is internal or external to your Microsoft Entra organization.

>[!cue] What 
>do you need to access azure resources?
# Thing so know about user accounts

- Following table describes user accounts
![[Pasted image 20241011085444.png]]

# Things to consider when choosing user accounts

- __Consider where users are defined:
	- Are all users defined within your Microsoft Entra organization.  Are some users defined in external Microsoft Entra instances? Do you have users who are external to your organization?  It's common for businesses to support two or mor account types in their infrastructure
- __Consider support for external contributers:
	- Allow external contributors access to Azure resources in your organization by supporting Guest user types.  When the external contributor no longer requires access, you can remove the account and their access privileges.
- __Consider a combination of user accounts:
	- Implement types that enable your organization to fulfil their business requirements.  Directory-synchronized identity user accounts for users defined in Windows Swerver AD.  Cloud identities for users defined in your internal Microsoft Entra structure or for user defined in an external Microsoft Entra instance.

>[!cue] What
>should you consider when choosing accounts?