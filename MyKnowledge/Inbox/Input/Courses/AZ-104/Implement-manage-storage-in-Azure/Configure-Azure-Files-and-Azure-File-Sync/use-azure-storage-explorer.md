---
tags:
  - microsoft
  - azure
  - storage
  - file
  - sync
  - explorer
cssclasses: cornell-left cornell-border
date: "10-14-2024"
---

# Use-Azure-Storage-Explorer


![2024-10-14-at-00-45-07.png](2024-10-13.21-20-49.597-img/2024-10-14-at-00-45-07.png)

![2024-10-14-at-00-45-33.png](2024-10-13.21-20-49.597-img/2024-10-14-at-00-45-33.png)

![2024-10-14-at-00-45-54.png](2024-10-13.21-20-49.597-img/2024-10-14-at-00-45-54.png)

![2024-10-14-at-00-46-14.png](2024-10-13.21-20-49.597-img/2024-10-14-at-00-46-14.png)


Azure Storage Explorer is a powerful and user-friendly tool designed to help users manage data stored in Azure Storage accounts seamlessly across various operating systems, including Windows, macOS, and Linux. This note explores key concepts, features, and best practices for effectively using Azure Storage Explorer in your Azure storage management.

## Overview of Azure Storage Explorer

Azure Storage Explorer provides a graphical interface for accessing and managing your Azure Storage resources. You can work with various Azure services, including Azure Blob Storage, Azure File Shares, Azure Table Storage, and Azure Queue Storage.

### Key Features and Characteristics

1. **Multi-Platform Support**:
   - Available on Windows, macOS, and Linux, which allows developers and administrators from diverse platforms to access Azure Storage.

2. **Account and Subscription Management**:
   - You can connect to multiple Azure storage accounts and manage data across different subscriptions in a single interface.

3. **Permission Requirements**:
   - Azure Storage Explorer requires both Azure Resource Manager (ARM) permissions for management actions and data layer permissions for data operations. 
   - Users must have Azure Active Directory (Azure AD) permissions to access the storage account, the containers within it, and the data contained in those containers.

4. **Connection Capabilities**:
   - **Connect to Storage Accounts**:
     - Handle accounts associated with your Azure subscriptions.
     - Access accounts and services shared from other Azure subscriptions.
     - Manage local storage instances by utilizing the Azure Storage Emulator.

### Scenarios to Consider When Using Azure Storage Explorer

Azure Storage Explorer facilitates a variety of tasks related to Azure Storage management. Consider the following scenarios:

- **Data Migration**:
  - Easily transfer files between local storage, Azure Storage, and between different Azure accounts or subscriptions.

- **Data Management**:
  - Perform CRUD operations (Create, Read, Update, Delete) efficiently on blobs, file shares, tables, and queues.

- **Troubleshooting and Diagnostics**:
  - Quickly inspect meta-information about blobs, file shares, or used storage space. It can help in resolving connectivity issues or permission-related problems.

### Attaching to External Storage Accounts

1. **Connecting to External Accounts**:
   - Azure Storage Explorer enables you to attach to and manage external storage accounts. For this, you will need:
     - **External Storage Account Name**: Can be easily found in the Azure portal.
     - **Account Key**: PowerShell or Azure CLI can retrieve this. In the portal, it's referred to as "key1".

2. **Creating Connections**:
   - Use the following to establish connections:
     - Open Azure Storage Explorer and select to add a new resource.
     - You can select the type of connection (e.g., via storage account name and key, or an Azure account).
     - Input the required credentials as prompted.

3. **Custom Storage Endpoints**:
   - For national Azure clouds, you must select "Other" from the storage endpoints domain drop-down menu and enter the custom endpoint domain of the storage account.

### Understanding Access Keys

Access keys provide authorization to access all resources in a storage account. Key characteristics include:

1. **Two Access Keys**:
   - Each storage account provides two keys to facilitate key rotation. This allows a smooth transition—keeping the old key active while transitioning to a new one.

2. **Security Recommendations**:
   - **Store Access Keys Securely**: Treat these access keys with the same sensitivity as passwords.
   - **Regular Key Rotation**: Update your access keys regularly to maintain security. This minimizes risks from key exposure.

3. **Key Update Implications**:
   - When you regenerate your access keys, remember to update any applications or Azure resources that rely on those keys. This does not impact access to disks from virtual machines, which maintain their connections through existing keys until updated.

### Conclusion

Azure Storage Explorer greatly simplifies the management of your Azure Storage resources, integrating several robust features and user-friendly workflows for data handling. By keeping security best practices in mind, such as managing permissions carefully and handling access keys securely, users can effectively utilize this powerful tool to enhance their Azure storage management capabilities.
