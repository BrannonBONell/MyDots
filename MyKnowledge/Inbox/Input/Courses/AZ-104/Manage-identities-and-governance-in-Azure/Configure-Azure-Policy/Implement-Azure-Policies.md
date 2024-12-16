---
tags: microsoft azure policies cloud devops
date: 12th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Azure policies

### Overview

Azure Policy is a service that allows you to create, assign, and manage policies to enforce rules on Azure resources, ensuring compliance with corporate standards and service level agreements.

### Key Advantages

1. **Enforce Rules and Compliance**
    
    - Use built-in or custom policies for all resource types.
    - Support real-time and periodic compliance evaluations.
2. **Apply Policies at Scale**
    
    - Apply policies across your organization using management groups.
    - Use policy initiatives to manage multiple policies and define exclusion scopes.
3. **Perform Remediation**
    
    - Conduct real-time and existing resource remediation.
4. **Exercise Governance**
    
    - Support multiple teams and manage multiple subscriptions.
    - Standardize resource configurations and manage compliance, cost, security, and design consistency.
![[Pasted image 20241012034304.png]]
### Considerations for Using Azure Policy

- **Deployable Resources**
    
    - Specify which resource types and VM SKUs your organization can deploy.
- **Location Restrictions**
    
    - Restrict geographic locations for resource deployment.
- **Rules Enforcement**
    
    - Enforce compliance rules, such as required tags and allowed values.
- **Inventory Audits**
    
    - Use Azure Policy with Azure Backup for VM inventory audits.