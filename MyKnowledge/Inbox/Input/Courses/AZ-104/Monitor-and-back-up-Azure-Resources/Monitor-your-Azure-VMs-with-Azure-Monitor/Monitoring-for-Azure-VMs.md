---
tags: azure cloud devops microsoft monitor VM
date: 19th-October-2024
---

# Monitoring for Azure VMs

**Azure Monitor** provides a comprehensive solution for monitoring **Azure VMs** and **non-Azure resources**. It offers two main features: **Azure Monitor Metrics** and **Azure Monitor Logs**.

#### Key Data Types:

1. **Metrics**: Numerical values collected at intervals (e.g., CPU usage, memory usage, etc.).
2. **Logs**: Structured or unstructured system events (e.g., VM startup, modifications).

#### VM Monitoring Layers:

1. **Host VM**: Compute, storage, and network resources allocated by Azure.
2. **Guest OS**: Operating system running on the VM.
3. **Client Workloads**: Applications and workloads running on the VM.

![Diagram that shows fundamental VM architecture.](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/monitoring-layers.png)

### Host VM Monitoring

#### **VM Host Metrics**:

- Automatically collected metrics for VM performance and resource usage.
- Available on the VM **Overview** page in the Azure portal.
- Important metrics include:
    - VM Availability
    - CPU Usage (%)
    - Disk Operations per Second
    - Network Operations

[![Screenshot showing CPU percentage usage and inbound flow chart.](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/2-vm-metrics-screenshot.png)](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/2-vm-metrics-screenshot.png#lightbox)

#### **Metrics Explorer**:

- Visualize and track metrics over time.
- Compare metrics across multiple VMs.
- Pin metrics to dashboards or send to workbooks.

#### **Recommended Alert Rules**:

- Predefined alert rules for CPU, memory, disk, and network usage.
- You can quickly enable alerts when creating a VM or configure custom alerts via **Azure Monitor Alerts**.

#### **Activity Logs**:

- Automatically record and display VM activity (e.g., startup, shutdown).
- Logs can be sent to **Azure Monitor Logs**, **Azure Storage**, or **Azure Event Hubs** for archiving and analysis.

#### **Boot Diagnostics**:

- Helps troubleshoot VM boot issues.
- Provides screenshots and serial console logs during VM startup.
- Boot data is stored in a managed storage account.

### Guest OS, Workload, and Application Monitoring

#### **Azure Monitor Agent and Data Collection Rules (DCRs)**:

- Install Azure Monitor Agent on the VM to collect metrics and logs.
- **DCRs** define what data to collect and where to send it (to Azure Monitor Logs or Metrics).
- **Metrics** store numerical data, while **Logs** store event logs.

#### **VM Insights**:

- Simplified monitoring setup for VMs' guest OS and workloads.
- Preconfigured DCR to monitor common performance counters (CPU, memory, etc.).
- Predefined workbooks for analyzing VM performance, traffic, and connections.
- Can track processes running on the VM and display dependency maps.

### Custom Workbooks and Event Logs

- **Workbooks**: Predefined or custom charts showing performance over time.
- **Client Event Log Data**: Collect additional log data by creating separate DCRs.
- Analyze collected data using **Kusto Query Language (KQL)** in **Log Analytics**.

This overview of **Azure Monitor for VMs** allows you to effectively monitor performance, set alerts, and analyze logs to ensure optimal performance and issue resolution.