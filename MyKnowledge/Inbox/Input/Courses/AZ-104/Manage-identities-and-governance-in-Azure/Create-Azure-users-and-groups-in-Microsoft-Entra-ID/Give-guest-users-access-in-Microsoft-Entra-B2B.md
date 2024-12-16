---
tags: microsoft entra b2b guest user access azure cloud devops
date: 12th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

## Microsoft Entra B2B Guest User Access

### Overview

- **Purpose**: Enable collaboration between internal and external developer teams by creating guest-user access.

### Adding Guest Users
![Screenshot that shows the New guest user button.](https://learn.microsoft.com/en-us/training/modules/create-users-and-groups-in-azure-active-directory/media/7-new-guest-user.png)

1. **Invite Users**: Use the Azure portal to invite external users to your Microsoft Entra organization.
    
    - Navigate to **Microsoft Entra ID** > **Users** > **New user** > **Invite external user**.
    - Provide a display name and email, then send the invitation.
2. **Add to Groups**:
    
    - Go to **Groups** > select a group (e.g., Developer group) > **Members** > **Add members**.
    - Search and select the guest account to add them to the group.
3. **Add to Applications**:
    
    - Navigate to **Enterprise applications** > **New application** > select an app (e.g., DocuSign).
    - Add the guest user under **Users and groups** and assign the appropriate role (e.g., DocuSign Sender).
![Screenshot that shows the New Application button.](https://learn.microsoft.com/en-us/training/modules/create-users-and-groups-in-azure-active-directory/media/7-enterprise-application.png)
![Screenshot that shows the Docusign application user and groups page.](https://learn.microsoft.com/en-us/training/modules/create-users-and-groups-in-azure-active-directory/media/7-application-users-groups.png)
![Screenshot that shows the user selected on the users and groups page.](https://learn.microsoft.com/en-us/training/modules/create-users-and-groups-in-azure-active-directory/media/7-select-user.png)
![Screenshot that shows role selected for user.](https://learn.microsoft.com/en-us/training/modules/create-users-and-groups-in-azure-active-directory/media/7-select-role.png)
![Screenshot that shows the DocuSign app in the browser for the guest user after they've accepted the invitation.](https://learn.microsoft.com/en-us/training/modules/create-users-and-groups-in-azure-active-directory/media/7-application-visible-invitation-accepted.png)
### Resend Invitations

- If a guest user doesn't receive the invitation, resend it via **Users** > select user > **B2B invitation** > **Resend invitation**.

### Key Points

- Guest users are added with a _Guest user_ type.
- Invitations can be sent via email or direct link.
- Ensure correct access levels by assigning roles within applications.