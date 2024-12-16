---
tags: microsoft azure devops cloud app service plans scale-up scale-out
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Scale up and scale out Azure App Service

**Overview:** There are two methods to scale your Azure App Service plan: **Scale Up** (vertical scaling) and **Scale Out** (horizontal scaling). Scaling can be done manually or automatically through autoscale to meet the changing resource needs of your applications.

---

### **1. Scale Up (Vertical Scaling):**

- **What it does**: Increases CPU, memory, and disk space by moving your app to a higher pricing tier.
- **How to scale up**: Change the pricing tier of the Azure App Service plan.
- **Benefits**:
    - Adds more features like dedicated VMs, custom domains, SSL certificates, staging slots, and autoscaling.
    - Suitable when your application requires more powerful compute resources.

---

### **2. Scale Out (Horizontal Scaling):**

- **What it does**: Increases the number of virtual machine instances running your application.
- **Instance limits**:
    - Up to **30 instances** in most pricing tiers.
    - Up to **100 instances** in the Isolated tier with App Service Environments.
- **How to scale out**: Increase the instance count manually or use **autoscale**.

#### **Autoscale**:

- Automatically adjusts the number of VM instances based on predefined rules (like CPU usage, memory, or custom metrics) or schedules.
- Reduces costs by scaling down when load decreases.
- Ensures high availability by scaling up during periods of high traffic.

---

### **Benefits of Azure App Service Scaling**:

1. **Manual Plan Adjustments**:
    
    - **Start small, scale up as needed**: Begin with a lower-tier plan and move up as your app requires more resources.
    - **Example**: Start with the Free tier, move to Shared for custom DNS, and then to Basic or Standard for SSL or staging environments.
    - **Scale down**: When higher-tier features are no longer required, move back to a lower tier to save on costs.
2. **Autoscale to Reduce Costs**:
    
    - Automatically **increase resources** during high traffic and **reduce** them during low traffic, saving costs by optimizing resource usage.
    - Customize autoscale rules based on your app's unique usage patterns.
3. **No Redeployment Required**:
    
    - **No need to redeploy code** when scaling your app. Scaling changes are applied instantly across all apps in the plan without affecting existing applications.
4. **Scaling Other Azure Services**:
    
    - Services like **Azure SQL Database** or **Azure Storage** used by your App Service can be scaled separately as they are not part of the App Service plan.
    - This ensures that dependent services can handle the increased load as your app scales.

---

### **Things to Consider**:

- **Manual vs. Autoscale**: Use manual scaling to control pricing and scale features as needed. Implement autoscale for automated, efficient resource allocation during traffic spikes.
- **Flexible Scaling**: Scaling up or down can happen at any time without downtime, and the changes are quick to apply.
- **Resource Dependencies**: Ensure other Azure services your app depends on (e.g., databases, storage) can scale to support your app’s growth.