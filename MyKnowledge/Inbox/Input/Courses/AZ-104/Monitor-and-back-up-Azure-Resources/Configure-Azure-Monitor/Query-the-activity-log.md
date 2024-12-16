---
tags: azure cloud devops microsoft query activity log
date: 19th-October-2024
---

# Query the activity log

Use the Azure portal to filter Azure Monitor activity logs to view specific information.
![Screenshot that shows filter options for activity logs in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-monitor/media/query-activity-log-a92271d9.png)

In the Azure portal, you can apply **filters** to your activity logs to focus on specific data, making it easier to review relevant information. Here are key filters you can set:

1. **Subscription**: Select data from specific Azure subscriptions.
2. **Timespan**: Set a start and end time to filter events within a specific period (e.g., peak business hours).
3. **Event Severity**: Filter events by severity levels such as:
    - **Informational**
    - **Warning**
    - **Error**
    - **Critical**
4. **Resource Group**: Filter events related to specific resource groups within the selected subscription.
5. **Resource (name)**: Choose data for specific resources (e.g., virtual machines, databases).
6. **Resource Type**: Narrow down events for particular types of resources (e.g., virtual machines, databases).
7. **Operation Name**: Filter data for specific operations (e.g., creating or deleting resources).
8. **Event Initiated By**: See events triggered by a specific user (caller).

You can save and pin these filters to the **Azure Monitor dashboard** for easy access. You can also download the filtered results as a **CSV file** for offline analysis.

---

#### **Event Categories in Azure Monitor Activity Logs**

There are several **event categories** that Azure Monitor logs, based on the type of events in your Azure environment. Here’s a breakdown:

|**Event Category**|**What it Logs**|**Examples**|
|---|---|---|
|**Administrative**|Logs actions like create, update, and delete operations, including role-based access control (RBAC) changes.|- Create a virtual machine  <br>- Delete network security group|
|**Service Health**|Shows events related to service status, such as downtime or maintenance.|- SQL Azure experiencing downtime  <br>- Maintenance completed on Azure SQL Data Warehouse|
|**Resource Health**|Reports on the health status of specific resources (e.g., available, unavailable).|- Virtual machine status changed to unavailable|
|**Alert**|Tracks activation of Azure alerts for monitored resources.|- CPU usage over 80% on a virtual machine|
|**Autoscale**|Logs actions related to scaling resources up or down based on settings.|- Autoscale action failed|
|**Recommendation**|Provides optimization recommendations for resource usage.|- Recommendations to improve web server performance|
|**Security**|Records alerts from Microsoft Defender for Cloud related to security threats.|- Suspicious file executed|
|**Policy**|Logs actions performed by Azure Policy to enforce or audit resource compliance.|- Policy audit or deny actions|

---

#### **Key Takeaways**:

- **Filtering** allows you to focus on specific data by setting criteria such as **time**, **severity**, and **resource type**.
- **Event categories** provide a structured way to view different types of events, such as **administrative actions**, **service health**, **security alerts**, and **recommendations**.

By effectively using **filters** and understanding **event categories**, you can better analyze and act on Azure activity log data to maintain optimal performance and security of your resources.