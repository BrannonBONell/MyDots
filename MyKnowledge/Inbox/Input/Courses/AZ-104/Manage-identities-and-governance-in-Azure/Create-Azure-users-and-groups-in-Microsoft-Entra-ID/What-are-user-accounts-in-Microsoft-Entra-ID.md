---
tags: azure microsoft entra devops cloud entra-id
date: 12th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# What are user accounts in Microsoft Entra ID

#### Overview

- **User Accounts**: Include user type, role assignments, and ownership of objects.
- **Types of Users**: Administrators, member users, and guest users.

#### Permissions and Roles

- **Role-Based Access**: Permissions are controlled through roles.
- **Role Assignment**: Critical for maintaining privacy and security compliance.
- **Example**: User Administrator role allows creating and deleting user accounts.

#### Administrator Roles

- **Purpose**: Provide elevated access for managing identity tasks.
- **Capabilities**: Create/edit users, assign roles, reset passwords, manage licenses.
- **Tools**: Use Azure portal, Azure CLI (`az ad user create`), or PowerShell (`New-MgUser`).

#### Member Users

- **Characteristics**: Native members with default permissions.
- **Role**: Internal users without administrative capabilities.
- **Permissions**: Manage profile information but cannot manage other users.

#### Guest Users

- **Access**: Restricted permissions for external collaborators.
- **Invitation**: Can be invited via email or direct app link.
- **Purpose**: Collaborate with external partners with limited access.

#### Adding User Accounts

- **Methods**: Azure portal, Azure PowerShell, Azure CLI.
- **Bulk Creation**: Use CSV files for bulk inviting guest users with PowerShell.
	- __Using Azure CLI__:
![[Pasted image 20241012113619.png]]
	- __Using Azure PowerShell:__
![[Pasted image 20241012113646.png]]
	- __Bulk create member users and guest accounts:
![[Pasted image 20241012113720.png]]
#### Deleting User Accounts

- **Methods**: Azure portal, Azure PowerShell (`Remove-MgUser`), Azure CLI (`az ad user delete`).
- **Suspension**: Deleted accounts remain suspended for 30 days, allowing restoration.