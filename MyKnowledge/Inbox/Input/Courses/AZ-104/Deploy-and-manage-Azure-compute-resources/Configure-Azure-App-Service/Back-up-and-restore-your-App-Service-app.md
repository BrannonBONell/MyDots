---
tags: azure microsoft cloud devops configure app service backup restore
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Back up and restore your App Service app

**Overview:** The **Backup and Restore** feature in Azure App Service allows you to create backups of your app, including its configuration, file content, and connected databases. You can restore your app to a previous state, either by overwriting the existing content or restoring it to another app.

---

### **Key Features of Backup and Restore**:

1. **App Service Plan Requirement**:
    
    - The **Backup and Restore** feature is available only in the **Standard** or **Premium** App Service plan tiers.
2. **Backup Destination**:
    
    - You need an **Azure storage account** and **container** in the same subscription as your app to store backups.
3. **Backup Contents**:
    
    - Backups include:
        - **App configuration settings**.
        - **File content**.
        - **Databases** connected to your app (e.g., SQL Database, Azure Database for MySQL, Azure Database for PostgreSQL).
4. **Backup Files**:
    
    - Each backup consists of:
        - A **Zip file** containing your app's data.
        - An **XML file** serving as a manifest of the backup contents.
5. **Backup Types**:
    
    - **Full Backups** (default): Includes all app content, configuration settings, and database data.
    - **Partial Backups**: Allows you to exclude specific files or folders from the backup.
6. **Storage Limits**:
    
    - Backup files can hold up to **10 GB** of app and database content.

---

### **Backup and Restore Configuration**:

1. **Manual or Scheduled Backups**:
    
    - You can configure backups manually or set up **scheduled backups** based on your needs.
2. **Restoring Backups**:
    
    - You can restore your app from a backup by **overwriting the existing app** or restoring it to a **new app**.
    - **Full Restore**: Replaces all existing content with the content in the backup (any files not in the backup will be deleted).
    - **Partial Restore**: Restores the files included in the backup while leaving the excluded files intact.
3. **Browse Backup Files**:
    
    - You can unzip and browse the contents of the backup (Zip and XML files) without restoring the app to view what’s included.

---

### **Things to Consider**:

1. **Full Backups**:
    
    - Ideal for saving **all configuration settings, file content, and databases** associated with your app.
    - When restoring a **full backup**, it replaces all content, and any missing files will be deleted from the app.
2. **Partial Backups**:
    
    - Useful when you want to back up only **specific files or folders**.
    - Restoring a **partial backup** leaves any excluded files or folders unchanged.
3. **Firewall Restrictions**:
    
    - If your **storage account** has a firewall enabled, you **cannot use it as a backup destination**. Disable the firewall or use a different storage account.

---

### **Summary of Steps**:

1. Ensure your app is on the **Standard** or **Premium** App Service plan.
2. Set up an **Azure storage account and container** for backups.
3. Choose between **manual or scheduled backups**.
4. Select **full or partial backups** based on your app’s needs.
5. Restore backups by overwriting the existing app or restoring to a new app.
6. Optionally, browse backup files before restoring to inspect the contents.