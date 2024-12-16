---
tags: azure cloud devops microsoft backup VM
date: 18th-October-2024
---

# Backup your VMs

![Illustration that shows the three basic steps to back up an Azure virtual machine by using Azure Backup.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-virtual-machine-backups/media/backup-steps-97429b0d.png)

**Azure Backup** provides an easy way to protect your Azure virtual machines by following a **three-step process**: creating a vault, defining a backup policy, and running the backup job.

---

### **Step 1: Create a Recovery Services Vault**

- **Purpose**: A vault is a secure storage entity for your backup data.
- **Location**: Must be created in the same region as your virtual machine.
- **Storage Replication Options**:
    - **Geo-Redundant Storage (GRS)**: Default option, replicates your data to a secondary region for extra protection.
    - **Locally Redundant Storage (LRS)**: Reduces storage costs by keeping the data in the same region.

---

### **Step 2: Define Your Backup Policy**

- **Backup Policy**: Specifies when snapshots (recovery points) are taken and how long they are kept.
    - **Frequency**: You can trigger backups 1-5 times per day.
    - **Retention**: Determines how long recovery points are stored in the vault.
- **Recovery Points**: Snapshots stored in the Recovery Services vault can be used to restore your virtual machine if needed.

---

### **Step 3: Back Up Your Virtual Machine**

- **Backup Job**: To initiate the backup, the **Azure Backup extension** uses the **Microsoft Azure Virtual Machine Agent**.
    - **Pre-installed**: The agent is automatically installed for Azure gallery VMs.
    - **Manual Installation**: If your VM was migrated from on-premises, you must manually install the agent.

For more details on the agent installation, refer to the official documentation on installing the Azure Virtual Machine Agent.

By following these three steps, you can ensure that your Azure virtual machines are protected with **Azure Backup**.