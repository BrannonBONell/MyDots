---
tags: azure cloud devops microsoft create log analytics workspace
date: 19th-October-2024
---

# Create a log analytics workspace

### Azure Monitor: Log Analytics Workspace Overview

A **Log Analytics workspace** is the central environment where data and logs collected by **Azure Monitor** are stored. The workspace is used to organize, manage, and analyze logs collected from various Azure resources, services, and applications.

### Key Details About the Log Analytics Workspace

1. **Unique Identifiers**
    
    - Each workspace has a **unique workspace ID** and **resource ID**.
    - After creating the workspace, you can configure data sources and solutions to store their logs and data in that workspace.
2. **Key Configuration Parameters**
    
    - **Name**: A unique name for the workspace within your resource group.
    - **Subscription**: The Azure subscription where the workspace will reside.
    - **Resource Group**: A group in Azure where the workspace is located. It must contain at least one Azure Virtual Machine (VM).
    - **Region**: The geographical Azure region where your virtual machines and workspace are deployed. The region must support Log Analytics.
    - **Pricing**: By default, the pricing model is **pay-as-you-go**, meaning you only incur charges when data is collected.

![Screenshot that shows how to create a Log Analytics workspace in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-log-analytics/media/create-workspace-f37a5b11.png)
### How to Create a Log Analytics Workspace

1. **Provide Workspace Name**: The name must be unique within your resource group.
2. **Select Subscription**: Choose the Azure subscription where the workspace will be created.
3. **Choose a Resource Group**: Select an existing resource group or create a new one.
4. **Select Region**: The region must support Log Analytics. Verify regional support for the service.
5. **Select Pricing Tier**: The default pricing tier is **pay-as-you-go**. Pricing tiers can be changed based on your needs.

### Summary

A **Log Analytics workspace** in Azure Monitor is essential for managing and storing collected logs and metrics. Once created, you can start gathering logs from different sources, including Azure Virtual Machines and other resources. The configuration is flexible, allowing you to choose the best region, subscription, and pricing tier based on your requirements.