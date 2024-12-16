---
tags: microsoft azure entra-id user accounts manage
date: 11th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Manage user accounts

- Several ways to add cloud identity user accounts in Microsoft Entra ID.
	- You can use the Azure portal
	- Can add through Microsoft 365 Admin Center, Microsoft Intune admin console, and the Azure CLI

# Thing to know about cloud identity accounts

- Here is an example of the new user page in the Azure portal
	- Administrator can Create a user within the organization or Invite a guest user.
![[Pasted image 20241011090926.png]]

- New user account must have a display name and associated user account name
	- Display Name: ARAN SAWYER-Miller 
	- User Account Name: asawmill@contoso.com
- Information and settings describing a user are stored in the user account profile
- Profile can have other settings job title, contact email, etc.
- User with Global administrator or User administrator privileges can preset profile data in user accounts, such as the main phone number for the company
- Non-admin users can set some profile data, can't change display name or account name.

# Things to consider when managing cloud identity accounts

- __Consider user profile data:
	- Allow users to set their profile data for their accounts as needed.  User profile data includes picture, job, contact info is all optional.  You can also supply certain profile settings for each user5 based on your organizations requirements.
- __Consider restore options for deleted accounts:
	- Include restore options in your account management plan.  Restore operations are available for up to 30 days.  After 30 days a deleted account cannot be restored.
- __Consider gathered account data:
	- Collect sign-in and audit log info for user accounts.  Microsoft Entra ID lets you gather this data  to help you analyse and improve your infrastructure.