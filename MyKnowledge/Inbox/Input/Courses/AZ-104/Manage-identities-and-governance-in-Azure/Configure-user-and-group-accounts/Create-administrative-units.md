---
tags: microsoft azure entra-id administrative-units devops cloud
date: 11th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

### Creating Administrative Units in Microsoft Entra

#### Purpose

- **Administrative Units (AUs)**: Used to restrict administrative scope and manage identities and governance in Azure, particularly useful for organizations with multiple independent divisions.

#### Use Case Example

- **University Scenario**: A large university with various schools (e.g., Business, Engineering, Medicine) uses AUs to manage resources and access across different departments and buildings.
- **IT Management**: IT admins have varying privileges, and a central authority oversees the structure. AUs help streamline management by assigning specific roles and responsibilities.
![[Pasted image 20241011094056.png]]
#### Implementation Steps

- **Role Creation**: Assign administrative permissions specific to a department (e.g., Engineering).
- **AU Creation**: Establish an AU for each department and populate it with relevant users and resources.
- **Role Assignment**: Add department-specific IT teams to the corresponding AU roles.

#### Considerations

- **Management Tools**: Use the Azure portal, PowerShell, or Microsoft Graph to manage AUs.
- **Role Requirements**: Only Global Administrators or Privileged Role Administrators can manage AUs in the Azure portal.
- **Scope Limitations**: AUs apply only to management permissions; members can still browse users, groups, or resources outside their AU with default user permissions.

This note outlines the purpose, implementation, and considerations for using administrative units in Microsoft Entra to manage complex organizational structures effectively.

2024/10/11 09:36:06