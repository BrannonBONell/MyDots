---
tags: azure cloud devops microsoft collect client performance counters VM insights
date: 19th-October-2024
---

# Collect client performance counters by using VM insights

**VM insights** is a feature of **Azure Monitor** that helps you monitor the **guest OS** and **workloads** running on your VM. This includes processes, performance, and dependencies. Here's how to set it up and use it:

---

### **Steps to Enable VM Insights**

1. **Open the Azure portal** and navigate to your VM.
2. On the VM's **Overview** page, select **Insights** from the **Monitoring** section in the left navigation pane.
3. On the **Insights** page, select **Enable**.
4. Review the **Data Collection Rule (DCR)** that is created. This rule collects a predefined set of performance data from the VM and sends it to a **Log Analytics workspace**.
    - **Processes and dependencies (Map)** may be disabled by default, but you can enable it if needed.
5. Select **Configure** to finish the setup.

[![Screenshot that shows enabling and configuring VM insights.](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/enable-insights.png)](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/enable-insights.png#lightbox)

The setup typically takes about 5-10 minutes, and the data will be available for viewing after an additional 5-10 minutes.

---

### **Verify Installation of Azure Monitor Agent**

- After setup, you can confirm that the **Azure Monitor Agent** is installed by going to the **Properties** tab under **Extensions + applications** on the VM's Overview page.

[![Screenshot that shows Guest OS metrics on the VM's Monitoring tab.](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/guest-os-metrics.png)](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/guest-os-metrics.png#lightbox)

---

### **Viewing VM Insights Data**

1. **Guest OS Metrics**:
    
    - Once VM insights is enabled, **Guest OS metrics** will appear under **Performance and utilization** on the VM's **Monitoring** tab.
2. **Viewing Performance Data**:
    
    - Go to **Insights** under the **Monitoring** section of your VM.
    - Select the **Performance** tab to view prebuilt charts and graphs showing the VM’s performance data (such as CPU, memory, disk, and network usage).
    - Customize the view by adjusting the **Time range** or **Aggregations** for each graph.
    - You can select **View Workbooks** to see other prebuilt performance workbooks or go to the **Gallery** to explore and customize new workbooks.

[![Screenshot that shows the prebuilt VM insights Performance workbook.](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/vm-insights-performance.png)](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/vm-insights-performance.png#lightbox)

1. **Dependency Mapping**:
    
    - If the **Processes and dependencies (Map)** feature is enabled, select the **Map** tab on the Insights page.
    - This map visualizes the VM’s dependencies by showing running processes and their active network connections over a defined time range.

[![Screenshot that shows a dependency map on the Map tab of VM insights.](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/dependency-map.png)](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/dependency-map.png#lightbox)

---

### **Key Features of VM Insights**:

- **Preconfigured Data Collection**: Automatically installs the Azure Monitor Agent and sets up DCRs to collect key performance metrics.
- **Visual Performance Insights**: Provides built-in workbooks to quickly analyze performance data.
- **Dependency Mapping**: Visualizes how different processes and services interact over the network.
- **Customization**: You can customize the views, workbooks, and time ranges to meet your specific monitoring needs.

---

By using **VM insights**, you can quickly monitor your VM’s operating system and workloads, helping you identify and resolve performance or resource-related issues more effectively.