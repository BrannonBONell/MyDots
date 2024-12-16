---
tags: azure cloud devops microsoft app service add deployment slots
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Add deployment slots

**Overview:** Deployment slots in Azure App Service allow you to deploy and test updates in separate environments before releasing them to production. You can swap the content and configurations between slots, including the production slot, ensuring smooth transitions with minimal downtime.

---

### **Creating Deployment Slots**:

1. **Empty or Cloned Slots**:
    
    - You can create **new deployment slots** that are either **empty** or **cloned** from an existing slot.
    - **Cloned configurations** are editable after creation.
2. **Deployment Slot Settings**:
    
    - Settings are divided into three categories:
        1. **Slot-specific app settings and connection strings** (if configured as such).
        2. **Continuous deployment settings**, if enabled.
        3. **Azure App Service authentication settings**, if enabled.

---

### **Swapped vs. Slot-Specific Settings**:

When swapping between deployment slots, some settings move with the swap, while others stay in the source slot.

#### **Swapped Settings**:

- **General settings** (e.g., framework version, 32/64-bit architecture, web sockets).
- **App settings** (if not configured as slot-specific).
- **Connection strings** (if not configured as slot-specific).
- **Handler mappings**.
- **Public certificates**.
- **WebJobs content**.
- **Hybrid connections** (feature not currently available).
- **Service endpoints** (feature not currently available).
- **Azure Content Delivery Network (CDN)** (feature not currently available).
- **Path mapping**.

#### **Slot-Specific Settings** (Stay in the Source Slot):

- **Custom domain names**.
- **Nonpublic certificates and TLS/SSL settings**.
- **Scale settings**.
- **Always On**.
- **IP restrictions**.
- **WebJobs schedulers**.
- **Diagnostic settings**.
- **CORS (Cross-origin resource sharing)**.
- **Virtual network integration**.
- **Managed identities**.
- **Settings ending in _EXTENSION_VERSION**.

---

### **Key Points to Remember**:

1. **Slot-specific settings** (such as app settings and connection strings) can be configured independently for each slot.
2. **Swapped settings** (like general settings and WebJobs content) move between slots when swapped, ensuring the environment is consistent across deployments.
3. **Slot-specific settings** remain in the source slot after the swap, allowing flexibility in managing configurations like custom domains and TLS/SSL settings.

---

### **Best Practices**:

- **Test first in a staging slot**: Validate app changes in a separate slot before swapping into production.
- **Configure slot-specific settings** for variables that should not change between different environments, such as connection strings or app settings.
- **Seamless transition**: Take advantage of swap operations to ensure smooth app updates without downtime.

![[Pasted image 20241014130243.png]]