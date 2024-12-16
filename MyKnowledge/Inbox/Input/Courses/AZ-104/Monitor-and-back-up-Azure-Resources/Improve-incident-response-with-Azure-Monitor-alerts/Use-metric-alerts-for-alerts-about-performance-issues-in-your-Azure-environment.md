---
tags: azure cloud devops microsoft metric alerts performance issues
date: 19th-October-2024
---

# Use metric alerts for alerts about performance issues in your Azure environment

**Metric alerts** in Azure Monitor help you achieve regular threshold monitoring of your resources. These alerts are triggered when certain conditions, such as high CPU utilization or low storage space, are met. This helps address potential issues before they impact your system.

### Key Features of Metric Alerts:

1. **Stateful Alerts**: Azure Monitor sends notifications only when the alert conditions are met, avoiding unnecessary alerts.
2. **Regular Monitoring**: Alerts are evaluated at set intervals (e.g., every two minutes for the last 10 minutes of data).

### Types of Metric Alerts:

1. **Static Threshold Metric Alerts**:
    
    - Based on simple, predefined thresholds (e.g., CPU > 85%).
    - Evaluates the data at regular intervals and triggers alerts if the condition is met.
2. **Dynamic Threshold Metric Alerts**:
    
    - Utilizes machine learning to automatically adjust thresholds.
    - No fixed threshold; instead, the system assesses the data behavior over a **look-back period** and triggers alerts based on **number of violations** from expected behavior.

### Dimensions in Metric Alerts:

- **Dimensions** allow you to monitor multiple target instances with a single alert rule.
- Example: Monitoring CPU usage across all servers running an app.
- You can specify target instances or use the wildcard `*` to apply the alert to all available instances.

### Scaling Metric Alerts:

- Supports monitoring of multiple resources, but currently limited to **Azure Virtual Machines** within a single Azure region.
- Each scaling alert is tied to the specific resource that triggers it.

### Summary:

Metric alerts in Azure Monitor provide a flexible and scalable solution for proactive system monitoring. They allow for both static and dynamic thresholds, can apply to multiple instances using dimensions, and can scale across virtual machines, ensuring effective resource management and timely notifications.
