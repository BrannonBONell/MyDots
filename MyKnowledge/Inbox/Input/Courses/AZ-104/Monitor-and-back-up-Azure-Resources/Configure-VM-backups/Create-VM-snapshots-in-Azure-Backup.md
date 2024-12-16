---
tags: azure cloud devops microsoft create VM snapshots backup
date: 18th-October-2024
---

# Create VM snapshots in Azure backup

**Azure Backup** creates snapshots for virtual machines (VMs) in **two phases**:

- **Phase 1**: Takes a snapshot of the VM's data.
- **Phase 2**: Transfers the snapshot to an **Azure Recovery Services vault**.

After both phases are complete, the **recovery points** created can be used to restore the entire VM or specific files.

![Illustration that shows the Azure Backup job process for a virtual machine as described in the text.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-virtual-machine-backups/media/virtual-machine-snapshot-aeddf5a2.png)
---

### **Key Concepts: Snapshots and Recovery Points**

1. **Snapshot Retention**:
    
    - **Default Retention**: Snapshots are kept for **two days** to speed up backup and restore processes.
    - **Configurable Retention**: Can be adjusted to **1 to 5 days** based on your restore needs.
    - **Storage**: Snapshots are stored as **Azure page blobs** (Azure Disks).
2. **Incremental Snapshots**:
    
    - Azure Backup captures **incremental snapshots**, which means only changes since the last backup are stored. This saves storage space and reduces backup time.
3. **Recovery Points**:
    
    - Available only after both **Phase 1** (snapshot creation) and **Phase 2** (snapshot transfer to vault) are completed.
    - **Recovery Point Types**:
        - After **Phase 1**: Labeled as "Snapshot".
        - After **Phase 2**: Labeled as "Snapshot and Vault".

---

### **Considerations for Using Snapshots and Recovery Points**

1. **Recovery After Phase 1**:
    
    - You can **restore a VM** from the **snapshot** immediately after Phase 1 completes. There's no need to wait for the snapshot to be transferred to the Recovery Services vault.
2. **Supported Disk Types**:
    
    - Azure Backup supports backing up:
        - **Standard SSD**
        - **Standard HDD**
        - **Premium SSD**
    - Disks of sizes up to **32 TB** can be backed up.
    - **Premium storage**: Instant recovery points count toward the **10-TB limit** of allocated space for Premium storage accounts.
3. **Cost Considerations**:
    
    - Configure snapshot retention based on your **restore frequency**. Setting a lower retention period (e.g., **1 day**) can help reduce storage costs.