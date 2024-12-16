---
tags: azure cloud devops microsoft different alert types monitor
date: 19th-October-2024
---

# Explore the different alert types that Azure Monitor supports

### Azure Monitor Overview

**Azure Monitor** is a comprehensive tool used for monitoring and gaining insights into the performance and health of your resources and applications. You can proactively respond to system faults by setting up **alerts**.

### Data Types in Azure Monitor

Azure Monitor collects data from various target resources (applications, operating systems, Azure resources, subscriptions, tenants) in the form of:

1. **Metrics**: Time-sensitive numerical values representing resource aspects (e.g., CPU usage).
2. **Logs**: Record-based data stored in log files for deeper querying.

![Diagram that represents the target resources feeding into Azure Monitor and the two principal signal types: metrics and logs.](https://learn.microsoft.com/en-us/training/modules/incident-response-with-alerting-on-azure/media/2-azure-resource-signal-types.svg)

### Signal Types for Monitoring

1. **Metric Alerts**: Trigger when a specified threshold (e.g., CPU > 95%) is exceeded.
2. **Activity Log Alerts**: Trigger when resources change state (e.g., a resource is deleted).
3. **Log Alerts**: Based on log searches (e.g., alert when a web server returns multiple 404 errors).

### Components of an Alert Rule

An **alert rule** in Azure Monitor consists of four main parts:

1. **Resource**: The target resource being monitored (e.g., a virtual machine or storage account).
2. **Condition**: The signal (metric, log, or activity log) and logic that define when the alert is triggered.
3. **Actions**: The response to the alert (e.g., email, SMS, webhook), configured within an **action group**.
4. **Alert Details**: A name, description, and severity level (0 = Critical to 4 = Verbose) for the alert.
![Screenshot of the Create rule page in the Azure Monitor portal.](https://learn.microsoft.com/en-us/training/modules/incident-response-with-alerting-on-azure/media/2-creating-an-alert.png)
### Managing Alert Rules

- Alerts can be **enabled** or **disabled** as needed, such as during application updates or changes.
- Alerts are presented in an **alert summary view**, allowing filtering by subscription, condition, severity, and time range.

### Key Points

- **Monitor Condition**: Alerts have two states — **Fired** (alert is active) or **Resolved** (condition cleared).
- Custom alerts can be tailored based on the resource, condition, and required action.

![Screenshot of Azure Monitor alerts page in the Azure Monitor portal.](https://learn.microsoft.com/en-us/training/modules/incident-response-with-alerting-on-azure/media/2-alerts-page.png)

This overview provides a high-level understanding of how **Azure Monitor** alerts work, allowing you to create, manage, and respond to critical system events proactively.
