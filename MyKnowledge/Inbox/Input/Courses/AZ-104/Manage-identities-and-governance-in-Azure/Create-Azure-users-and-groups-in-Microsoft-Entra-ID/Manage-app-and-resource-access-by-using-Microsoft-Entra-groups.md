---
tags: microsoft azure cloud devops entra-id resource access app
date: 12th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Manage app and resource access with Microsoft Entra groups

#### Overview

- **Purpose**: Manage access for developers and control group membership within an organization using Microsoft Entra ID.
- **Resources**: Includes both internal (e.g., permissions, roles) and external resources (e.g., SaaS apps, Azure services).

#### Access Management in Microsoft Entra ID

- **Microsoft Entra Roles**: Manage resources like users, groups, billing, and application registration.
- **Role-Based Access Control (RBAC)**: Manage access to Azure resources such as virtual machines and SQL databases.

#### Access Rights Assignment

- **Single User or Group**: Assign access rights to individual users or groups.
- **Types of Assignments**:
    - **Direct Assignment**: Assign roles directly to users.
    - **Group Assignment**: Assign roles to groups, with members inheriting access rights.
    - **Rule-Based Assignment**: Use rules to determine group membership based on user or device properties. Membership is valid only if rules are met.

#### Next Steps

- **Exercise**: Assign users to a Microsoft Entra group and use rule-based assignment for automatic group membership management.