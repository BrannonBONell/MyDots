---
tags: microsoft azure devops cloud configure create deplolyment slots
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Create deployment slots

**Overview:** Deployment slots in Azure App Service allow you to deploy web apps, mobile backends, or API apps to separate environments before releasing them to production. These slots act as live apps with their own hostnames, and are available in **Standard, Premium,** and **Isolated** pricing tiers.

---

### **Key Features of Deployment Slots**:

1. **Separate Hostnames**:
    
    - Each deployment slot is a live app with its own unique **hostname**.
2. **Pricing Tiers**:
    
    - Deployment slots are available in **Standard, Premium,** and **Isolated** tiers.
    - The number of slots varies by tier.
3. **Swap Content and Configurations**:
    
    - You can **swap** app content and configurations between two slots, including the **production slot**.

---

### **Benefits of Using Deployment Slots**:

1. **Validation**:
    
    - **Validate changes** in a staging slot before swapping into production.
    - Ensures that updates are tested in a live environment without affecting production.
2. **Reduction in Downtime**:
    
    - **Warmed-up deployments**: When you swap a slot into production, all instances of the app in the slot are warmed up first, which eliminates downtime.
    - **Seamless traffic redirection**: The swap process ensures no dropped requests, leading to uninterrupted service.
3. **Restore to Last Known Good State**:
    
    - After a swap, the slot holding the previous production app retains the older version.
    - If issues arise after the swap, you can easily swap back to the **last known good site**.
4. **Auto Swap**:
    
    - **Automates swaps** from a staging slot to production once the app is warmed up, streamlining **continuous deployment**.
    - Auto swap ensures zero downtime and no cold starts for customers.
    - **Note**: Auto swap is not supported for Web Apps on Linux.

---

### **Things to Keep in Mind**:

- **Staging and Validation**: Always deploy and test your app in a staging slot to ensure its stability before pushing it into production.
- **Zero Downtime**: Use deployment slots to avoid downtime during updates, especially for critical production apps.
- **Auto Swap for Automation**: Enable **Auto Swap** for seamless continuous integration and delivery, especially in DevOps workflows.
- **Quick Rollback**: Take advantage of the ability to quickly roll back to the previous version if issues are detected after a swap

![[Pasted image 20241014130055.png]]