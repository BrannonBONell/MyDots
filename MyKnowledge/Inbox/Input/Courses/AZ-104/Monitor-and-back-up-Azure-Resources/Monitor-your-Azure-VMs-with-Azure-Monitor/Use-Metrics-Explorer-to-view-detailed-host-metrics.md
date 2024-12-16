---
tags: azure cloud devops microsoft metrics explorer host metrics
date: 19th-October-2024
---

# Use Metrics Explorer to view detailed host metrics

In this unit, you'll learn how to use **Azure Monitor Metrics Explorer** to create a custom chart that shows the relationship between **CPU usage** and **network traffic** (inbound flows) for a virtual machine (VM).

#### Steps to Create a Custom Metrics Graph:

1. **Open Metrics Explorer**:
    
    - Go to the Azure portal.
    - **Access from the VM**:
        - Select **Metrics** from the VM's left navigation menu under **Monitoring**.
        - Or, select **See all Metrics** on the **Monitoring** tab of the VM's Overview page.

[![Screenshot that shows Metrics Explorer.](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/metrics-explorer.png)](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/metrics-explorer.png#lightbox)

1. **Select Metrics**:

[![Screenshot of the Percentage CPU metrics graph for a VM.](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/3-view-host-level-metrics.png)](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/3-view-host-level-metrics.png#lightbox)

    - The **Scope** and **Metric Namespace** should be prepopulated with your VM.
    - From the **Metric** dropdown, select **Percentage CPU**.
    - Change the **Aggregation** option from **Avg** (Average) to **Max** (Maximum).
3. **Add Inbound Traffic Data**:
    
    - Select **Add metric** at the top of the page.
    - From the **Metric** dropdown, select **Inbound Flows**. Leave **Aggregation** at **Avg**.
4. **Configure Time Range**:
    
    - At the top right, select the time range option (for example, **Last 24 hours**).
    - Change the time range to **Last 30 minutes** to display more recent data and select **Apply**.
5. **Review the Combined Graph**:
    
    - The graph will now show both **Maximum CPU usage** and **Average Inbound Flows** on the same chart.
    - You can observe how **traffic flowing into the VM** correlates with **CPU usage**.

[![Screenshot that shows a graph of CPU usage and inbound traffic.](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/3-metric-graph.png)](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/3-metric-graph.png#lightbox)

#### Key Features of Metrics Explorer:

- **Aggregation Options**:
    - **Count**: Number of data points.
    - **Avg**: Average value.
    - **Max**: Maximum value.
    - **Min**: Minimum value.
    - **Sum**: Sum of all values.
- **Time Range**: You can select time intervals from the past 30 minutes to 30 days, or define a custom range.
- **Granularity**: You can adjust the time granularity from as small as 1 minute to 1 month.

#### Summary:

Using Azure Monitor Metrics Explorer, you can easily visualize the relationship between **CPU performance** and **inbound network traffic** on your VM, allowing you to identify potential resource issues or performance bottlenecks.