---
tags: microsoft azure subscriptions devops cloud 
date: 11th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Implement Azure subscriptions

### Overview

- **Azure Subscription**: A logical unit of Azure services linked to an Azure account (identity in Microsoft Entra ID).
- **Purpose**: Organizes access, controls resource usage, billing, and payment.
![[Pasted image 20241011234153.png]]
### Key Points

- Every Azure service belongs to a subscription.
- Subscriptions can have different billing configurations.
- Multiple subscriptions can be linked to one Azure account and vice versa.
- Billing is done per subscription.
- Subscription ID may be needed for programmatic operations.

### Considerations for Implementation

- **Types of Accounts**: Use Microsoft Entra accounts or trusted directories. Microsoft Accounts are also supported.
- **Multiple Subscriptions**: Useful for different departments, projects, or regions. Each has specific resources, access, and billing.
- **Shared Services Subscription**: Centralize billing for common resources like Azure ExpressRoute.
- **Resource Access**: Requires authentication via Microsoft Entra ID.

---

This summary captures the essential information for easy review and study.