---
tags: azure cloud devops microsoft soft delete VM
date: 18th-October-2024
---

# Implement soft delete for VMs

![Flowchart that shows how backup items remain in the soft delete state for 14 days until the item is permanently deleted.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-virtual-machine-backups/media/soft-delete-93edca4c.png)

**Soft Delete Overview**:

- **Soft delete** helps recover modified or deleted backup data, protecting backups from accidental deletion by preserving them for **14 days** before permanent deletion.

---

### **Key Points about Soft Delete for Virtual Machine Backups**:

1. **Stops Backup Jobs**:
    
    - Before deleting or retaining backup data, stop the **active backup job** in the Azure portal.
2. **Apply Soft Delete**:
    
    - When you stop a backup job and delete the backup data, the data enters the **soft delete state** and is retained for **14 days**.
    - During this period, the virtual machine is considered **soft deleted** and can be recovered.
3. **Viewing Soft Deleted Data**:
    
    - Soft deleted virtual machines are displayed in the **Recovery Services vault** with a **red soft delete icon**.
    - **Note**: A vault containing soft deleted items **cannot be deleted** until those items are either permanently deleted or undeleted.
4. **Undelete and Restore**:
    
    - To **restore** a soft deleted virtual machine, you must first **undelete** the backup data.
    - Once undeleted, you can restore the virtual machine by selecting the desired **recovery point**.
5. **Resume Backups**:
    
    - After undeleting and restoring the backup, the backup status returns to **Stop backup with retain data**.
    - You can then **resume the backup** based on the selected **backup policy**.

---

### **Important Notes**:

- Soft delete **only protects backup data**. If the virtual machine itself is deleted without a backup, **soft delete cannot recover it**.
- Ensure all critical resources are protected with **Azure Backup** for full resilience.