---
tags: microsoft azure resource tagging devops cloud
date: 11th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Resource tagging

### Overview

Resource tagging in Azure allows you to logically organize resources by categories using tags, which consist of a name and a value. Tags help in sorting, searching, managing, and analyzing resources.

### Key Characteristics
![[Pasted image 20241011235004.png]]
- **Tag Structure**
    - Each tag has a name and a value.
    - The tag name is consistent across resources, while the value can vary.
    - A resource or resource group can have up to 50 tag name/value pairs.
    - Tags applied to a resource group are not inherited by the resources within it.

### Considerations for Using Resource Tags

- **Searching and Managing Resources**
    
    - Search for resources by querying tag names and values.
    - Retrieve related resources across different groups using tags.
- **Billing and Cost Management**
    
    - Group resources by tags like cost center or environment for billing purposes.
    - Tags appear in the `Tags` column of the resource usage CSV file.
- **Automation and Scalability**
    
    - Use Azure PowerShell or Azure CLI to create and manage tags programmatically.