---
tags: microsoft azure create management-groups cloud devops
date: 12th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---
# Create management groups

### Overview

Azure management groups provide a way to manage access, policies, and compliance across multiple subscriptions. They act as containers for organizing subscriptions under a unified policy and access management structure.

### Key Characteristics

- **Default Placement**: New subscriptions are placed under the top-level management group, or _root group_.
- **Inheritance**: Subscriptions within a management group inherit the conditions applied to that group.
- **Hierarchy Depth**: Supports up to six levels of depth in the management group tree.
- **Access Control**: Azure role-based access control for management group operations is not enabled by default.
![Diagram that shows how Azure management groups can be used to organize subscriptions in a hierarchy of unified policy and access management.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-policy/media/management-groups-aa92c04a.png)
### Considerations for Using Management Groups

- **Custom Hierarchies**: Align subscriptions with your organizational structure using custom hierarchies and groups.
- **Policy Inheritance**: Control access and privileges through hierarchical policy definitions. Policies applied to a management group affect all subscriptions and resources under it.
- **Compliance Rules**: Organize subscriptions to meet compliance rules for departments and teams.
- **Cost Reporting**: Use management groups for cost reporting by department or business scenario.

### Creating Management Groups

- **Methods**: Create management groups using the Azure portal, PowerShell, or Azure CLI.
- **Identifiers**: Each management group has a unique ID and an optional display name. The ID is permanent, while the display name can be changed.
- ![Screenshot that shows how to create a management group in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-policy/media/create-management-groups-66ff9f21.png)