---
tags: azure cloud devops microsoft backup
date: 18th-October-2024
---



# How Azure Backup Works


#### How Azure Backup Works:

Azure Backup is a cloud-based service providing **secure, scalable, and cost-effective** solutions for backing up data from on-premises machines, Azure Virtual Machines (VMs), and Azure services.

#### **1. Workload Integration Layer - Backup Extension:**

- Azure Backup integrates with workloads like Azure VMs, SQL databases, or Azure Blobs using a **backup extension**.
- The backup extension generates backups based on a user-defined schedule.

#### 2. **Data Plane - Access Tiers:**

Azure Backup provides three **storage access tiers** for backups, offering different speeds and costs:

1. **Snapshot Tier:**
    - **Fast restore** from locally stored snapshots in the customer's resource group.
    - Ideal for quick recovery.
2. **Vault-Standard Tier:**
    - **Primary storage** for backups.
    - Backups are stored in **Azure-managed** storage accounts.
    - Provides protection if the original data source is deleted or compromised.
3. **Archive Tier:**
    - Long-term storage for **rarely accessed** backup data, typically for compliance.
    - Lowest cost but slower recovery times.
![Diagram of the various workloads such as on-premises server, Azure VMs, Azure files, etc. feeding into the data plane where the access tiers are located.](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-backup/media/data-plane.png)
#### **3. Data Plane - Availability and Security:**

- **Redundancy Options:**
    - **Locally Redundant Storage (LRS)**: Copies data three times within a single datacenter.
    - **Geo-Redundant Storage (GRS)**: Copies data to a second region.
    - **Zone-Redundant Storage (ZRS)**: Copies data across availability zones within the same region.
- **Security Features:**
    - **Encryption**: Data is encrypted in transit and at rest.
    - **Role-Based Access Control (RBAC)**: Defines who can perform backup and restore operations.
    - **Soft Delete**: Protects backups from accidental or malicious deletion (backups are retained for 14 days after deletion).
![Graphic displaying the three security options of Azure RBAC, encryption, and soft delete as icons.](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-backup/media/built-in-security.png)
#### **4. Management Plane - Recovery Services Vault/Backup Vault and Backup Center:**

- **Recovery Services Vault** and **Backup Vault** store backup data and manage backup policies.
    - You can create one or multiple vaults based on your organization’s needs.
- **Backup Center**:
    - Provides a **centralized dashboard** for managing all backup-related tasks.
    - Supports management across **multiple workloads**, **regions**, and **subscriptions**.
![Diagram of the management plane. The recovery services vault shows the options for backup policies and management with the portal, SDK, or the Command-line interface (CLI).](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-backup/media/backup-vaults.png)
#### **Supported Backup Types:**

- **Full Backup**: First backup of the entire dataset.
- **Incremental Backup**: Only backs up data that changed since the last backup (more efficient).
- **SQL Server Backup**: Supports full, differential, and transaction log backups for point-in-time restoration.

#### **Backup Integration with Azure Workloads:**

- **Azure VMs**: Backup entire VMs or specific disks.
- **SQL Server**: Backup running databases with options for full or transaction log backups.
- **On-Premises Machines**: Backup on-premises Windows servers using the MARS agent or through Azure Backup Server (MABS).

---

#### Benefits of Azure Backup:

- **Simple Setup**: No infrastructure needed; Azure manages everything.
- **Secure**: Built-in encryption, RBAC, and soft delete protect your data.
- **Scalable**: Backup solutions scale with your business needs.

#### **Backup and Recovery Terminology:**

- **Recovery Time Objective (RTO)**: How quickly you need to restore data after a disaster.
- **Recovery Point Objective (RPO)**: Maximum data loss in terms of time.

Azure Backup provides a complete solution for protecting data across various environments while ensuring **security, availability,** and **cost efficiency**.

![Screenshot of the Backup center user interface in the Azure portal displaying backup information for Azure Virtual machines related to jobs and backup instances.](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-backup/media/backup-center.png)