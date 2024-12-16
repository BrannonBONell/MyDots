---
tags: azure microsoft devops cloud storage explorer connect account
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Connect Azure Storage Explorer to an account

### **1. What is Azure Storage Explorer?**

Azure Storage Explorer is a free, cross-platform GUI application developed by Microsoft that simplifies accessing and managing data stored in Azure Storage accounts. It works on Windows, macOS, and Linux, and provides users with a flexible and visual interface to manage various types of Azure Storage, such as blobs, tables, queues, files, and more.

#### **Key Benefits**:

- **Manage Multiple Accounts**: Storage Explorer allows you to connect to and manage multiple Azure storage accounts across different subscriptions.
- **Easy Data Operations**: You can perform tasks like uploading, downloading, editing, deleting, and copying data within these storage accounts.
- **Free Tool**: Available at no cost and easy to install.

---

### **2. Supported Platforms and Versions**

The latest versions of Azure Storage Explorer work on the following platforms:

- **Windows**: Windows 11 and Windows 10
- **macOS**: macOS 10.15 Catalina and later
- **Linux**: Ubuntu 20.04, 18.04, and 16.04 (64-bit versions)

---

### **3. Azure Storage Types Managed by Storage Explorer**

Azure Storage Explorer helps manage a wide range of storage types:

1. **Azure Blob Storage**: Stores unstructured data like files, images, and videos as "blobs" (Binary Large Objects).
2. **Azure Table Storage**: Handles NoSQL, semi-structured data, useful for scenarios like logging or storing metadata.
3. **Azure Queue Storage**: Manages message-based storage, enabling queueing of tasks for processing by applications.
4. **Azure Files**: Provides file sharing with access via SMB protocol, allowing you to store files in a similar way to traditional file servers.
5. **Azure Data Lake Storage**: Used for storing large volumes of structured and unstructured data. It’s ideal for big data analytics.

---

### **4. Key Features of Azure Storage Explorer**

#### **1. Manage Multiple Storage Accounts Across Subscriptions**:

- Azure Storage Explorer helps your engineers manage and navigate multiple storage accounts and subscriptions with ease. It organizes these resources into a hierarchy for easy access.

#### **2. Local Emulators**:

- During development, using real Azure Storage might incur costs. To avoid this, your engineers can use **local emulators**, which simulate Azure Storage environments locally. The supported emulators are:
    - **Azure Storage Emulator** (uses SQL Server LocalDB)
    - **Azurite** (an open-source emulator based on Node.js)

These emulators allow testing and development without needing to connect to actual Azure Storage accounts, reducing costs.

#### **3. Connection Options**:

Azure Storage Explorer offers several ways to connect to storage accounts:

- **Microsoft Entra ID (formerly Azure AD)**:
    
    - Use this to connect securely via an Azure Active Directory account.
    - Steps:
        1. Open Storage Explorer and sign in with your Azure account.
        2. Choose the "Add Resource via Microsoft Entra ID" option.
        3. Select the right Azure tenant and storage account.
- **Connection String**:
    
    - Use a connection string to connect by copying the string from the Azure portal.
- **Shared Access Signature (SAS) URI**:
    
    - SAS tokens grant restricted access to a specific resource (e.g., blob, file). These tokens specify permissions and expiry times.
    - Steps:
        1. Open Storage Explorer and choose the “Shared Access Signature (SAS)” connection type.
        2. Paste the SAS URI to establish the connection.
- **Storage Account Name and Key**:
    
    - This method uses the storage account name and its associated access key (found in the Azure portal).
    - Steps:
        1. Select the “Storage Account Name and Key” connection method.
        2. Enter the name and key of the storage account.
- **Local Emulator**:
    
    - Attach to a locally running emulator for development and testing purposes.

---

### **5. Core Storage Explorer Operations**

#### **1. Blob Storage Operations**:

Azure Blob Storage is ideal for storing unstructured data. With Storage Explorer, you can:

- **Create Containers**: Logical groupings for blobs (e.g., images, logs).
- **Upload/Download Blobs**: Easily transfer files between your local system and the cloud.
- **Edit/Delete Blobs**: Update or remove files directly from the GUI.

#### **2. Table Storage Operations**:

Table Storage is useful for storing key-value pairs (NoSQL data). You can:

- **View/Edit Table Data**: Inspect data stored in Azure Tables and make updates directly in the application.
- **Insert/Update Entities**: Add or modify table rows (called entities).

#### **3. Queue Storage Operations**:

Queue Storage allows you to store messages. With Storage Explorer, you can:

- **Send/Receive Messages**: Manage messages in queues, view the contents, and delete messages once they’re processed.

#### **4. File Storage Operations**:

Azure File Storage provides file shares in the cloud. You can:

- **Upload/Download Files**: Transfer files to and from the file share.
- **Manage Directories and Files**: Perform operations like creating folders, renaming, or deleting files.

---

### **6. Setting Up and Connecting to Azure Storage Explorer**

#### **Step-by-Step Connection Using Microsoft Entra ID**:

1. Open Azure Storage Explorer.
2. Select **Sign in with Azure** to log in using your Microsoft Entra account.
3. After signing in, select **Add a Resource via Microsoft Entra ID**.
4. Choose the Azure tenant and storage account you want to connect to.
5. Verify the connection details and click **Connect**.
6. The storage account will appear in the resource tree under **Storage Accounts**.

#### **Step-by-Step Connection Using SAS URI**:

1. Open Azure Storage Explorer.
2. Select **Add Connection** > **Shared Access Signature (SAS)**.
3. Provide the **SAS URI** (available in the Azure portal).
4. Assign a friendly name to the connection.
5. Verify details and click **Connect**.
6. The storage account will appear in **Local & Attached** > **Storage Accounts**.

---

### **7. Best Practices for Using Azure Storage Explorer**

- **Use Role-Based Access Control (RBAC)**: Ensure your engineers only have the required level of access by assigning specific roles (e.g., read, write, delete) based on their job needs.
- **SAS Tokens for Security**: When granting access to external collaborators, use SAS tokens to limit their access to only the necessary resources for a limited time.
- **Monitor Costs**: While local emulators help during development, make sure your engineers switch to real Azure resources during production and monitor costs in the Azure portal.

---

### **8. Summary**

Azure Storage Explorer is a powerful, user-friendly tool that simplifies managing various types of Azure storage accounts. It provides a graphical interface to perform storage operations like uploading files, creating containers, editing data, and more across Blob, Queue, Table, and File storage. Engineers can benefit from this tool to manage resources efficiently, connect via various secure methods (like SAS or Entra ID), and even work with local emulators for development purposes without incurring Azure costs.

By mastering these features, your team can streamline CRM data maintenance, control cloud storage expenses, and ensure data security while working with Azure's scalable cloud storage solutions