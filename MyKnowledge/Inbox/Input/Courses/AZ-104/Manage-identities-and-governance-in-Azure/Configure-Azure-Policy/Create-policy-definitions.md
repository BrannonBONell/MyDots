---
tags: azure microsoft cloud devops policy definitions
date: 12th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---
# Create policy definitions

### Overview

Azure Policy provides built-in policy definitions to help configure control conditions for resources. Users can also create custom definitions or import them from other sources.

### Access Built-in Policy Definitions
![Screenshot that shows a list of built-in policy definitions in Azure Policy.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-policy/media/policy-definition-3ce7a058.png)

- **Sorting and Searching**: Use the [list of built-in definitions](https://learn.microsoft.com/en-us/azure/governance/policy/samples/built-in-policies) sorted by category to find policies that fit your needs.
- **Examples of Built-in Policies**:
    - **Allowed Virtual Machine Size SKUs**: Restrict VM size SKUs deployable by your organization (Compute category).
    - **Allowed Locations**: Limit resource deployment locations to enforce geo-compliance (General category).
    - **Configure Azure Device Update for IoT Hub**: Disable public network access for IoT Hub resources (Internet of Things category).

### Add New Policy Definitions

- **Custom Definitions**: Create new policy definitions if built-in options don't meet your needs.
- **Import from GitHub**: Import policy definitions from the [Azure Policy GitHub repository](https://github.com/Azure/azure-policy/tree/master/samples), which is updated frequently.
- **JSON Format**: Ensure new policy definitions use the specific JSON format required by Azure. Refer to the [Azure Policy definition structure](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure) for guidance.
![Screenshot that shows how to add a new policy definition, and the option to import a sample policy definition from GitHub.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-policy/media/new-policy-definition-46cb3ecb.png)