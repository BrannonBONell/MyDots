---
tags: azure cloud devops microsoft monitoring activity log events
date: 19th-October-2024
---

# Activity log events

**Azure Monitor Activity Log** provides insights into subscription-level events, helping you track operations and understand their status across your Azure resources.

---

### **Key Features of Azure Activity Logs**:

1. **Track Resource Operations**: The activity log records operations like **PUT, POST, DELETE** on your Azure resources, enabling you to see what changes have occurred.
2. **Determine "What, Who, and When"**: You can identify:
    - **What** operations occurred.
    - **Who** initiated them.
    - **When** they happened.
3. **Data Retention**: Activity logs are retained for **90 days**, and you can query any date range within this period.
4. **Access Options**: You can retrieve activity log data using:
    - **Azure Portal**
    - **Azure CLI**
    - **PowerShell**
    - **Azure Monitor REST API**

![Diagram that shows how Azure Monitor activity logs gather information from compute and non-compute resources in Azure.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-monitor/media/activity-log-7d1913ad.png)

---

### **Business Scenarios for Using Activity Logs**:

- **Track Resource Changes**: Monitor all the **operations** performed on your resources, such as updates and deletions.
- **Audit Who Made Changes**: Determine **who** initiated the actions on specific resources, useful for auditing.
- **Check Timing**: Find out **when** particular actions took place.
- **Analyze Operation Status**: Review the **status** and other properties (such as errors or warnings) for detailed analysis.

---

### **Summary**:

- **Azure Activity Logs** are a powerful tool for understanding the operations performed within your subscription.
- Logs help answer key questions like **who** did what, **when** it was done, and **what** the outcome was.
- You can easily access and analyze these logs using various tools and interfaces.
