---
tags: microsoft azure entra domain service devops cloud
date: 11th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Examine Microsoft Entra Domain Services
### Microsoft Entra Domain Services Overview

#### Purpose

- Provides domain services like Group Policy management, domain joining, and Kerberos authentication for Microsoft Entra tenants.
- Offers an alternative to deploying additional domain controllers in Azure or using a site-to-site VPN for authentication.

#### Integration and Functionality

- Compatible with locally deployed AD DS, allowing use without managing extra domain controllers.
- Integrates with local AD DS via Microsoft Entra Connect, enabling use of organizational credentials across on-premises and cloud environments.
- Can be used as a cloud-only service, providing AD DS-like functionality without on-premises domain controllers.

#### Benefits

- Reduces administrative overhead by eliminating the need to manage domain controllers and Active Directory replication.
- No requirement for Domain Admins or Enterprise Admins groups.

#### Limitations

- Supports only base computer Active Directory objects; schema extensions are not possible.
- Flat organizational unit (OU) structure; nested OUs are unsupported.
- Built-in Group Policy Objects (GPOs) exist but cannot target OUs or use advanced filtering.

#### Use Cases

- Facilitates migration of applications using LDAP, NTLM, or Kerberos to the cloud.
- Supports applications like Microsoft SQL Server or SharePoint Server on Azure VMs without needing cloud domain controllers or a VPN.

#### Implementation

- Enabled via the Azure portal, with charges based on directory size and usage time.

This note outlines the key features, benefits, and limitations of Microsoft Entra Domain Services, emphasizing its role in simplifying cloud-based domain service management.