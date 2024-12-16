---
tags: microsoft entra password reset azure cloud devops governance
date: 13th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

## Implement Microsoft Entra Self-Service Password Reset (SSPR)

### Objective

- Trial SSPR with 20 marketing department users before organization-wide rollout.

### Prerequisites

- **Microsoft Entra Organization**: Must have at least a trial license.
- **Global Administrator Account**: Required for setup.
- **Non-Administrative User Account**: For testing SSPR.
- **Security Group**: To limit initial SSPR rollout.

### SSPR Rollout Scope

- **None**: Default setting; no users can use SSPR.
- **Selected**: Only specified security group members can use SSPR.
- **All**: All users can use SSPR.

### Steps to Configure SSPR

1. **Access Azure Portal**:
    
    - Navigate to **Microsoft Entra ID** > **Manage** > **Password reset**.
2. **Properties**:
    
    - Enable SSPR for all or selected users.
    - Specify security group for selected users.
\
![Screenshot of the Password Reset configuration panel. Properties option is selected allowing user to enable self service password resets.](https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/media/3-enable-sspr.png)
1. **Authentication Methods**:
    
    - Choose one or two methods.
    - Select available authentication methods.
![Screenshot of the Password Reset panel's Authentication methods option selected displaying panel with authentication options.](https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/media/3-auth-methods.png)
1. **Registration**:
    
    - Decide if users must register for SSPR at next sign-in.
    - Set frequency for reconfirming authentication info.
![Screenshot of the Password Reset panel's Registration option selected displaying panel with registration options.](https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/media/3-registration-options.png)
1. **Notifications**:
    
    - Choose to notify users and admins of password resets.
![Screenshot of the Password Reset panel's Notification option selected displaying panel with notification options.](https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/media/3-notification-settings.png)
1. **Customization**:
    
    - Provide contact info for user assistance.
- ![Screenshot of the Password Reset panel's Customization option selected displaying panel with helpdesk options.](https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/media/3-customization-settings.png)