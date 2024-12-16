---
tags: microsoft azure devops clolud intiative definition
date: 12th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---
# Create an initiative definition

#### Overview

- **Purpose**: Create an initiative definition to group policy definitions ensuring resources comply with security regulations.
- **Recommendation**: Even with few policy definitions, create and apply an initiative definition.

#### Creating an Initiative Definition

- **Format**: Use the specific JSON format required by Azure.
- **Resource**: Refer to [Azure Policy initiative definition structure](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/initiative-definition-structure) for detailed guidance.
![Screenshot that shows how to create a new initiative definition.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-policy/media/create-initiative-definition-e1198a51.png)
#### Using Built-in Initiative Definitions

- **Options**: Create custom initiatives or use Azure's built-in definitions.
- **Sorting**: Built-in initiatives can be sorted by category for easier search.

#### Examples of Built-in Initiative Definitions

1. **Audit machines with insecure password security settings**
    
    - **Purpose**: Deploys an audit policy to check for insecure password settings.
    - **Category**: Guest Configuration.
2. **Configure Windows machines to run Azure Monitor Agent**
    
    - **Purpose**: Monitors and secures Windows VMs and associates them with a Data Collection Rule.
    - **Category**: Monitoring.
3. **Configure Azure Defender on SQL servers**
    
    - **Purpose**: Enables Azure Defender to detect unusual activities on SQL servers.
    - **Category**: SQL.