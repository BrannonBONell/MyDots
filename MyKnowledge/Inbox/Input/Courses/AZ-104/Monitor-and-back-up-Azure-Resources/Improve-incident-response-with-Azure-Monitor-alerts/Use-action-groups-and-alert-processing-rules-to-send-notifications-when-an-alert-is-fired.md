---
tags: azure cloud devops microsoft action groups alert processing rules notifications fired
date: 19th-October-2024
---

# Use action groups and alert processing rules to send notification when an alert is fired

### Azure Monitor: Action Groups and Alert Processing Rules

#### Action Groups:

- **Action groups** are collections of notification preferences and actions executed when an alert is triggered.
- You can reuse action groups across multiple alerts.
- When creating an alert rule, you can:
    - Create a new action group.
    - Add an existing action group to the alert rule.
    - Edit an existing alert to include an action group.

#### Actions Supported by Azure Monitor:

1. Send an email.
2. Send an SMS message.
3. Create an Azure app push notification.
4. Make a voice call to a number.
5. Call an Azure function.
6. Trigger a logic app.
7. Send a notification to a webhook.
8. Create an IT Service Management (ITSM) ticket.
9. Use a runbook (e.g., restart or scale a virtual machine).

#### Alert Processing Rules:

- **Alert processing rules** modify the behavior of alerts as they are triggered.
- Use these rules to:
    - Suppress or add action groups during alerts.
    - Apply management logic at scale.
    - Add an action group to all alert types.
- Apply processing rules to a single resource or entire subscription.
- Control when the rule applies:
    - **Always active** by default.
    - **One-time window** or set a **recurrence schedule** (e.g., weekly).

#### Common Use Cases for Alert Processing Rules:

1. **Suppress notifications** during maintenance windows.
2. **Implement management at scale** using centralized logic.
3. **Add an action group** to all alert types across resources.

This setup ensures that alerts trigger the right notifications and actions for improved system monitoring and management in Azure.