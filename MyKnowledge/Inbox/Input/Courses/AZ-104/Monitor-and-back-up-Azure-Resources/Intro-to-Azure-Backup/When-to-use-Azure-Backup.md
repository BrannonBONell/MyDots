---
tags: azure cloud devops microsoft backup
date: 18th-October-2024
---

# When to use Azure Backup

**Azure Backup** is a cloud-based service offering **secure, scalable, and zero-infrastructure** solutions for backing up Azure-managed data assets and on-premises environments. It is suitable for many common backup scenarios involving compliance, operational recovery, and long-term data retention.

---

### **Key Criteria to Evaluate Azure Backup:**

1. **Azure Workloads Supported:**
    
    - Azure Backup supports a variety of workloads, including:
        - **Azure VMs** (Windows and Linux)
        - **SQL Server** and **SAP HANA** running on Azure VMs
        - **Azure Managed Disks**, **Azure Blobs**, **Azure Files**
        - **Azure Database for PostgreSQL**
        - **On-premises files and system state** using the MARS agent
![Diagram of SQL Server hosted on an Azure VM backed up to a Recovery Services Vaults in Azure Backup. Displayed are also a data path and controls arrow depicting two-way flow for the data path and control path flow from Azure Backup to the backup extension on the VM.](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-backup/media/azure-backup-sql-overview.png)

	
 - Backup options:
     - **Full VM backup**
     - **Workload-aware SQL Server backups** with support for full, differential, and transaction log backups
     - **Point-in-time recovery** for SQL data with a recovery point objective (RPO) of 15 minutes
2. **Compliance and Long-Term Retention:**
    
    - **Backup policies** allow the definition of retention periods for compliance (weekly, monthly, yearly).
    - **On-demand backups** with custom retention settings are available for unscheduled, ad-hoc backups.
    - **Role-based access control (RBAC)** restricts access to authorized users.
    - Backup vaults are accessible via **Azure Portal**, **Backup Center**, **CLI**, and **APIs**, ensuring secure access.
3. **Operational Recovery:**
    
    - Self-service backup and restore for admins to handle issues like **accidental deletion** or **data corruption**.
    - **Backup Explorer** allows for detailed analysis and troubleshooting across multiple workloads, locations, and subscriptions.
    - Built-in **job monitoring** for backup, restore, and delete operations.

---

### **Key Benefits of Azure Backup:**

- **Zero Infrastructure**: No need to manage backup servers or storage; Azure scales resources automatically.
- **Comprehensive Workload Support**: Protection for Azure VMs, databases, and on-premises environments.
- **Flexible Retention Policies**: Supports both long-term retention and on-demand backups.
- **Enhanced Security**: Backups are encrypted and protected against ransomware and accidental deletion (with **soft-delete** feature).

---

### **Common Use Case Example:**

For a SQL Server database running on Azure VMs:

- **Backup Frequency**: Full backup daily, differential backup as needed, with transaction logs captured every 15 minutes.
- **Retention**: Data can be stored for up to **10 years** for compliance purposes.
- **Monitoring**: Use **Backup Explorer** for aggregated monitoring of backups and operational recovery.

---

Azure Backup provides a **cost-effective**, **secure**, and **reliable** solution for protecting Azure workloads and ensuring data availability, with strong support for **long-term retention** and **compliance**. It also simplifies backup management and monitoring through centralized tools like **Backup Center** and **Backup Explorer**.