---
tags: microsoft azure devops cloud app service plans
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Azure App Service Plans

**Overview:** An Azure App Service plan defines the compute resources for hosting web applications. These resources are similar to a server farm in traditional hosting, where multiple applications can run using the same compute resources within a plan.

#### Key Concepts of App Service Plans:

1. **Region**: The geographical location where the compute resources are hosted (e.g., West US, Central India, North Europe).
2. **Number of VM Instances**: Specifies how many virtual machine instances are allocated to the plan.
3. **Size of VM Instances**: Determines the VM size (Small, Medium, Large, etc.), impacting performance and capacity.

#### Application Scaling in App Service Plans:

- **App Service Plan as Scale Unit**:
    
    - The scale and performance of applications are determined by the pricing tier and scaling configuration of the plan.
    - Applications share the compute resources of the plan.
- **Free or Shared Tier**:
    
    - Applications run with shared CPU on a virtual machine.
    - No scaling out capability (no additional VMs).
- **Basic, Standard, Premium, or Isolated Tier**:
    
    - Applications run on all VM instances defined in the plan.
    - Multiple applications and deployment slots share these VM resources.
    - Diagnostic logs, backups, and WebJobs also consume resources from the same VMs.

#### Important Considerations:

1. **Cost Savings**:
    
    - Group multiple applications into a single App Service plan to save costs, as you only pay for the computing resources allocated to the plan.
2. **Multiple Applications in One Plan**:
    
    - Placing multiple applications in the same plan can make resource management easier but requires careful monitoring to avoid performance issues.
3. **Plan Capacity**:
    
    - Monitor the resource capacity of the plan before adding new applications to ensure it can handle additional load without affecting existing applications.
    - Overloading a plan can cause downtime for all applications running in the plan.
4. **Application Isolation**:
    
    - Isolate resource-intensive applications into their own App Service plan.
    - Isolate applications if they need to scale independently from others or require resources in a different region.

#### When to Create Separate App Service Plans:

- When the application is resource-heavy.
- When the application needs to scale independently.
- When the application needs to be hosted in a different region.

These notes provide a clear and concise understanding of Azure App Service plans and their configurations for handling web applications and scaling efficiently.