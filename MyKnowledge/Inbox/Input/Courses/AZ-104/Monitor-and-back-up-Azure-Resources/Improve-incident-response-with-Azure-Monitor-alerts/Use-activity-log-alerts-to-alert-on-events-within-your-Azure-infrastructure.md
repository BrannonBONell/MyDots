---
tags: azure cloud devops microsoft activity log alerts events infrastructure
date: 19th-October-2024
---

# Use activity log alerts to alert on events within your Azure infrastructure

**Activity log alerts** notify you when specific events happen within your Azure resources or subscriptions. They are useful for monitoring changes or health events and help improve team responsiveness and system stability.

#### Types of Activity Log Alerts:

1. **Specific Operations**:
    
    - Alerts are triggered when specific changes occur on resources within your Azure subscription (e.g., VM creation or deletion).
    - Scope: Individual resources or resource groups.
    - Example: Get an alert if a virtual machine is deleted or new roles are assigned to a user.
2. **Service Health Events**:
    
    - Alerts notify you of Azure service health incidents, planned maintenance, or health advisories.
    - Scope: Affects the entire Azure region, not individual resources.

#### Composition of an Activity Log Alert:

- **Category**: Administrative, service health, autoscale, policy, or recommendation.
- **Scope**: Can be at resource, resource group, or subscription level.
- **Resource Group**: Defines where the alert rule is saved.
- **Resource Type**: Specifies the namespace for the target resource.
- **Operation Name**: Indicates the specific operation (e.g., VM start/stop).
- **Level**: Severity level such as Verbose, Informational, Warning, Error, or Critical.
- **Status**: Shows if the operation started, failed, or succeeded.
- **Event Initiated By**: Specifies who triggered the event (email address or Microsoft Entra ID).

#### How to Create Activity Log Alerts:

1. **Create Resource-Specific Log Alerts**:
    
    - Select **Activity Log** as the signal type in Azure Monitor.
    - Filter available signals to focus on specific resource operations.
    - Example: Create an alert for when a VM is powered off.

![Screenshot of the signal logic for activity log alerts related to VMs.](https://learn.microsoft.com/en-us/training/modules/incident-response-with-alerting-on-azure/media/6-example-activity-log-alert.png)

1. **Create Service Health Alerts**:
    
    - Navigate to **Service Health** in the Azure portal.
    - Choose **Health Alerts**, then create a new alert.
    - Select the type of health event (e.g., service issues, planned maintenance).
    - No need to select specific resources, as the alert is for an entire Azure region.

![Screenshot that shows how to create a new service health alert.](https://learn.microsoft.com/en-us/training/modules/incident-response-with-alerting-on-azure/media/6-service-health-alerts.png)

#### Use Cases for Activity Log Alerts:

- **Specific Operations**: Monitor when key actions (e.g., VM creation/deletion) occur in your subscription.
- **Service Health**: Receive notifications when there are platform-level service issues, planned maintenance, or advisories that may affect your region.

By implementing activity log alerts, you can effectively track critical changes and health events across your Azure environment and act quickly to resolve issues.