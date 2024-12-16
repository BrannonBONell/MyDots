---
tags: microsoft azure create policies devops cloud
date: 12th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Create Azure Policies

### Overview

Azure Policy allows administrators to create policies that define resource conventions. A policy definition sets compliance conditions and actions, while an initiative definition groups multiple policy definitions to manage scope and evaluate compliance.
![Diagram that shows an initiative definition for a group of policy definitions that are applied to resources.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-policy/media/implement-azure-policy-b4a4a47c.png)
### Steps to Create and Manage Azure Policies

1. **Create Policy Definitions**
    
    - Define conditions and actions for compliance.
    - Use built-in or custom definitions.
    - Example: Prevent VMs with public IP addresses from being deployed.
2. **Create Initiative Definitions**
    
    - Group policy definitions to track compliance for broader goals.
    - Use built-in or custom initiative definitions.
    - Example: Ensure resources comply with security regulations.
3. **Scope the Initiative Definition**
    
    - Control application of initiatives to specific management groups, subscriptions, or resource groups.
4. **Determine Compliance**
    
    - Evaluate compliance state for resources after assigning an initiative.
    - Exempt specific resources, groups, or subscriptions from policy rules as needed.