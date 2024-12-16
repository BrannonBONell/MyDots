---
tags: azure cloud devops microsoft backup
date: 18th-October-2024
---

# What is Azure Backup

#### **What is Azure Backup?**

Azure Backup is a **cloud-based** service providing **simple, secure, and cost-effective** backup solutions for protecting data in the Microsoft Azure cloud. It offers **zero-infrastructure** backup, meaning no need for dedicated hardware or backup servers.
![Diagram of the Azure Backup service implementing backup agents in the on-premises environment to the cloud. Middle section displays the components of Azure Backup for security and scalability with an underlying bar indicating central management.](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-backup/media/azure-backup-overview.png)
#### **Key Features of Azure Backup:**
![Diagram of Azure Backup architecture displaying workloads at the bottom, feeding upwards into the data plane, and tying into the management plane. Management contains backup policies, Azure policies, Azure Monitor, and Azure Lighthouse services.](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-backup/media/azure-backup-architecture.png)
1. **Zero-Infrastructure Backup:**
    
    - **No hardware** or **backup storage** required.
    - Azure Backup manages storage automatically, scaling as needed.
    - Reduces both **capital** and **operational expenses**.
2. **At-Scale Management:**
    
    - Centralized backup management via **Backup Center**.
    - Supports management through **APIs**, **PowerShell**, and **Azure CLI** for automation.
    - Simplifies data protection with a single interface to manage, monitor, and optimize backups.
3. **Security:**
    
    - Built-in security for **data in transit** and **at rest** using **encryption**.
    - Protection against **ransomware**, **malicious admins**, and **accidental deletions**.

#### **What Azure Backup Protects:**

Azure Backup supports backup for:

- **On-premises** files, folders, and system state.
- **Azure Virtual Machines (VMs)** and **Azure Managed Disks**.
- **Azure File Shares** and **SQL Server** in Azure VMs.
- **SAP HANA** databases in Azure VMs.
- **Azure Blobs**, **Azure Databases** (PostgreSQL, MySQL), and **Kubernetes clusters**.

---

#### **Key Backup Terms:**

1. **Recovery Time Objective (RTO):**
    
    - The **maximum time** within which a service must be restored after a disaster.
    - Example: If your business can tolerate a **maximum of 4 hours** of downtime, your RTO is **4 hours**.
2. **Recovery Point Objective (RPO):**
    
    - The **maximum data loss** (in terms of time) that your organization can tolerate.
    - Example: If your **RPO is 1 hour**, you perform backups every hour, meaning a maximum of **1 hour of data loss** in case of a failure.

---

#### **When to Use Azure Backup:**

- When you need a **centralized backup solution** to meet **compliance** and **security** needs.
- For **self-service backup and restore** to address issues like **data corruption** or **rogue-admin scenarios**.
- To protect **Azure-managed workloads** or **on-premises data** without needing **additional infrastructure**.

By using **Azure Backup**, you can manage and secure your data easily, scale efficiently, and ensure your organization meets its **backup** and **restore** requirements.
![Screenshot of Azure Backup center displaying a list of backup jobs. The list displays the backup instance, data source, operation type, and status.](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-backup/media/backup-center-jobs.png)