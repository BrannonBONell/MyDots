---
tags: azure cloud devops microsoft features monitor logs
date: 19th-October-2024
---

# Features of Azure Monitor Logs

**Azure Monitor** is a service that collects and analyzes telemetry data to ensure maximum performance and availability for your cloud applications and on-premises resources.

#### Key Data Types Collected by Azure Monitor:

1. **Metrics**:
    - **Definition**: Numerical values that describe system performance at a point in time.
    - **Collected at regular intervals** and stored in a time-series database.
    - **Uses**: Fast detection of issues and alerting.
2. **Logs**:
    - **Definition**: Time-stamped records of resource changes and events.
    - **Includes**: Both numerical and text data.
    - **Use**: Helps to identify the root causes of issues.

#### Data Collection Sources:

- **Application Data**: Information from custom application code.
- **Operating System Data**: Data from Windows or Linux VMs hosting your applications.
- **Azure Resource Data**: Data from Azure resources like web apps and load balancers.
- **Azure Subscription Data**: Data related to your subscription’s health and availability.
- **Azure Tenant Data**: Data on organization-level services (e.g., Microsoft Entra ID).

#### Extending Data Collection:

1. **Enable Diagnostics**: Required for some services like Azure SQL Database for full logging.
2. **Install Agents**: Install the Log Analytics agent on VMs to send data to a Log Analytics workspace.
3. **Custom Data via APIs**: Developers can send data using the Data Collector API.

![Diagram of Azure Monitor's architecture, displaying the sources of monitoring data, the data stores, and functions performed on the data.](https://learn.microsoft.com/en-us/training/modules/analyze-infrastructure-with-azure-monitor-logs/media/2-azure-monitor.svg)

#### Metrics vs. Logs:

- **Metrics**:
    - Collected in real-time and sampled at fixed intervals.
    - Suitable for alerting and performance analysis.

![Screenshot of an example chart in Azure Metrics displaying average CPU percentage.](https://learn.microsoft.com/en-us/training/modules/analyze-infrastructure-with-azure-monitor-logs/media/2-azure-monitor-metrics.png)

- **Logs**:
    - Records events that occur at irregular intervals.
    - Ideal for troubleshooting and root cause analysis.
    - Stored in **Log Analytics** with querying via **Kusto Query Language (KQL)**.

![Screenshot of an example query against Azure logs with the query text on top and a graph displaying the results below.](https://learn.microsoft.com/en-us/training/modules/analyze-infrastructure-with-azure-monitor-logs/media/2-azure-logs-query-example.png)

#### Analyzing and Visualizing Data:

- **Log Analytics Workspace**: Store log data and use KQL to analyze and retrieve insights.
- **Dashboards**: Customizable views that can display both logs and metrics.
    - Can visualize data from various sources (e.g., charts, tables, and log query results).

By using **Azure Monitor**, you can consolidate and visualize critical information on a single pane, helping to identify performance issues, respond to system faults, and improve resource management.