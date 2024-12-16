---
tags: microsoft entra azure b2b guest account collaborate
date: 12th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

## Microsoft Entra B2B Collaboration

### Overview

- **Purpose**: Facilitate secure and easy collaboration between internal and external teams using guest accounts.
- **Functionality**: Add external users as guest users in your Microsoft Entra tenant.

### Guest User Access

- **Use Case**: Temporary or restricted access for external users.
- **Process**: Invite users via the Azure portal; they receive an email or direct link to redeem access.
- **Control**: Default permissions allow user/admin invitations, but the Global Administrator can restrict this.

### Identity Management

- **Responsibility**: External partners manage their own identities.
- **Example**: External users use their existing credentials (e.g., [gcarvalho@proseware.com](mailto:gcarvalho@proseware.com)) for access.

### Benefits Over Federation

- **Simplicity**: No need for complex federation setups or managing external credentials.
- **Flexibility**: Any authorized user can invite external collaborators.
- **Reliability**: Authentication is done through Azure, not dependent on on-premises servers.

### Federation vs. B2B

- **Federation**: Requires trust establishment and on-premises infrastructure (e.g., AD FS).
- **B2B**: Direct Azure authentication, no need for on-premises dependencies, easier management.
![Diagram that shows a federation example between an on-premises Active Directory and Microsoft Entra ID.](https://learn.microsoft.com/en-us/training/modules/create-users-and-groups-in-azure-active-directory/media/6-federation-example.png)