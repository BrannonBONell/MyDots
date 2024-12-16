---
tags: azure cloud devops microsoft monitoring data tiers
date: 19th-October-2024
---

# Identify monitoring data tiers

**Azure Monitor** collects data from various sources and organizes it into tiers based on the source of the data. These tiers represent different layers of your environment, such as your application, operating system, Azure resources, and even Azure itself.

---

### **Key Data Collection Details**:

1. **Automatic Data Collection**: Azure Monitor starts collecting data as soon as you create an Azure subscription and add resources.
2. **Activity Logs**: Whenever resources are created or modified, these activities are stored in **Azure Monitor activity logs**.
3. **Performance Metrics**: Data about resource performance and consumption is stored as **Azure Monitor metrics**.
4. **Extended Monitoring**:
    - Use **Azure Monitor Agent** to collect more detailed data from compute resources (Windows/Linux).
    - The **Data Collector API** enables custom log data collection from any REST client, extending monitoring to other resources.

---

### **Monitoring Data Tiers**:

Azure Monitor organizes data into the following **tiers**:

|**Data Tier**|**Description**|
|---|---|
|**Application Tier**|Collects data about the performance and functionality of your **application code**. This applies regardless of the platform (Azure, on-premises, etc.).|
|**Guest OS Tier**|Gathers data about the **operating system** (Windows/Linux) where your application is running, whether it's in **Azure**, another cloud, or on-premises.|
|**Azure Resource Tier**|Includes data about the **operation** of any **Azure resource** (e.g., VMs, storage, databases) and consumption details for those resources.|
|**Azure Subscription**|Holds data about the **management** and **operation** of your **Azure subscription** and the health of Azure.|
|**Azure Tenant Tier**|Contains data about the **operation** of your tenant-level services, such as **Microsoft Entra ID (Azure Active Directory)**.|

---

### **Summary**:

- Azure Monitor organizes collected data into different **tiers** based on the source.
- These tiers provide a comprehensive view of your entire environment, from **applications** to **tenant-level services**.
- You can extend data collection using **Azure Monitor Agent** and **Data Collector API** to monitor internal operations and custom resources.