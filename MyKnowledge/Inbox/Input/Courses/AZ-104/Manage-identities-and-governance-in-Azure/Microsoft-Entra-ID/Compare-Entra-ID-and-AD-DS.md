---
tags: microsoft azure entra-id ad-ds identity access
date: 11th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Comparison of Microsoft Entra ID and Active Directory Domain Services (AD DS)
>[!summary] 
>- **AD DS Characteristics**: Traditional, hierarchical directory service using DNS, LDAP, and Kerberos, with management through OUs and GPOs.
>- **Azure Deployment**: AD DS can be deployed on Azure VMs but requires additional data disks for storage.
>- **Microsoft Entra ID Structure**: Cloud-based identity solution with a flat, multi-tenant structure, lacking OUs and GPOs.
>- **Authentication Protocols**: Entra ID uses modern protocols like SAML, WS-Federation, OpenID Connect, and OAuth.
>- **Federation Services**: Entra ID includes federation services and is trusted by third-party services like Facebook. 
## Characteristics of AD DS

>[!cue] AD DS
>What are the characteristics of AD DS?
- **Traditional Deployment**: Windows Server-based, can be on physical or virtual servers.
- **Components**: Part of the Windows Active Directory suite, including AD CS, AD LDS, AD FS, and AD RMS.
- **Directory Service**: Hierarchical X.500-based structure.
- **Resource Location**: Uses Domain Name System (DNS).
- **Management Protocol**: Managed via Lightweight Directory Access Protocol (LDAP).
- **Authentication**: Primarily uses Kerberos protocol.
- **Management Tools**: Utilizes Organizational Units (OUs) and Group Policy Objects (GPOs).
- **Computer Objects**: Represents computers in an Active Directory domain.
- **Trusts**: Uses domain trusts for delegated management.
- **Azure Deployment**: Can be deployed on Azure VMs for scalability, but requires additional data disks (not on drive C).



## Characteristics of Microsoft Entra ID
>[!cue] What are
>The characteristics of Microsoft Entra ID?
- **Identity Solution**: Designed for internet-based applications using HTTP and HTTPS.
- **Multi-Tenant**: Supports multiple tenants in a flat structure without OUs or GPOs.
- **API Access**: Uses REST API over HTTP/HTTPS instead of LDAP.
- **Authentication Protocols**: Uses SAML, WS-Federation, OpenID Connect for authentication, and OAuth for authorization.
- **Federation Services**: Includes federation services; trusted by third-party services like Facebook.

This note highlights the key differences and characteristics of Microsoft Entra ID and AD DS, focusing on their deployment, management, and authentication methods.