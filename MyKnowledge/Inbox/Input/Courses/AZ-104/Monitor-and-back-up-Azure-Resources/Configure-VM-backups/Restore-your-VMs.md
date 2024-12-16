---
tags: azure cloud devops microsoft restore VM
date: 18th-October-2024
---

# Restore your VMs

![Screenshot that shows recovery points in a Recovery Services vault for a virtual machine snapshot in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-virtual-machine-backups/media/virtual-machine-restore-876df613.png)

After backing up your virtual machine, you can restore it using **snapshots** or **recovery points** stored in the **Recovery Services vault**. Here’s what you need to know:

---

### **Key Points about Restoring Virtual Machines**:

1. **Selecting Recovery Points**:
    
    - You can choose specific recovery points from the snapshots stored in the vault.
    - These recovery points represent points-in-time to which you can restore the machine.
2. **Restore Operation**:
    
    - When you initiate a restore, **Azure Backup** creates a restore job.
    - This job handles the restore process and allows you to track its progress.
3. **Notifications**:
    
    - **Temporary notifications** inform you about the restore job's progress.
    - You can monitor these job notifications in the **Azure portal**.

---

This streamlined process ensures that you can quickly restore your virtual machines to a previous state, minimizing downtime and data loss.