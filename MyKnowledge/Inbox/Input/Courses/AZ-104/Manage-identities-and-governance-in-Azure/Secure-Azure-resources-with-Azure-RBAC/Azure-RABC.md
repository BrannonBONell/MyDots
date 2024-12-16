---
tags: azure microsoft rabc devops cloud
date: 12th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

## Azure Role-Based Access Control (RBAC)

### Overview

- **Purpose**: Manage access to Azure resources, ensuring security and proper governance.
- **Integration**: Works with Microsoft Entra ID for identity and access management.

### Key Concepts

1. **Azure Subscriptions**
    
    - Each subscription is linked to a Microsoft Entra directory.
    - Uses Microsoft Entra ID for single sign-on and access management.
2. **Azure RBAC**
    
    - Provides fine-grained access management for Azure resources.
    - Assign roles to users, groups, or applications at different scopes (management group, subscription, resource group, or resource).
![Diagram that depicts how the classic subscription administrator roles, Azure roles, and Microsoft Entra roles are related at a high level.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/2-azuread-and-azure-roles.png)

1. **Role Assignment Components**
    
    - **Security Principal (Who)**: User, group, or application.
![An illustration showing security principal including user, group, and service principal.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/2-rbac-security-principal.png)
    - **Role Definition (What)**: Collection of permissions (e.g., Owner, Contributor, Reader).
![An illustration listing different built-in and custom roles with zoom-in on the definition for the contributor role.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/2-rbac-role-definition.png)
    - **Scope (Where)**: Level of access (e.g., subscription, resource group).
![An illustration showing a hierarchical representation of different Azure levels to apply scope. The hierarchy, starting with the highest level, is in this order: Management group, subscription, resource group, and resource.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/2-rbac-scope.png)
1. **Built-in Roles**
    
    - **Owner**: Full access, can delegate.
    - **Contributor**: Manage resources, can't delegate.
    - **Reader**: View resources.
    - **User Access Administrator**: Manage user access.
5. **Role Assignment**

	![An illustration showing a sample role assignment process for Marketing group, which is a combination of security principal, role definition, and scope. The Marketing group falls under the Group security principal and has a Contributor role assigned for the Resource group scope.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/2-rbac-overview.png)
- Combines security principal, role definition, and scope to grant access.
- Inherited permissions from parent to child scopes.
\
1. **Azure RBAC Model**
    
    - **Allow Model**: Grants permissions based on role assignments.
    - **NotActions**: Define exceptions to allowed actions.

### Usage Scenarios

- Manage access for different teams (e.g., development, marketing).
- Assign specific roles for managing virtual machines, databases, etc.

### Azure Portal
![Screenshot of the Azure portal showing the Access control Role assignment pane with the Backup operator section highlighted.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/2-resource-group-access-control.png)
- Use the **Access control (IAM)** pane to view and manage access.