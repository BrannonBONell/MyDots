---
tags:
  - azure
  - microsoft
  - devops
  - cloud
  - storage
  - account
  - settings
cssclasses: cornell-left cornell-border
date: "10-14-2024"
---

# Choose-Your-Account-Settings

Azure Storage accounts serve as containers for various Azure storage services, employing specific settings that dictate how these services are managed and billed. This note covers three crucial settings that apply to the storage account itself, affecting overall account management and associated costs.

## Key Settings of Azure Storage Accounts

### 1. Name

- **Global Uniqueness**: Each storage account name must be globally unique across Azure. This means no two storage accounts can share the same name, irrespective of the region they are created in.
  
- **Character Restrictions**: 
  - The name must use only lowercase letters (a-z) and digits (0-9).
  - The length should be between **3 and 24 characters**, making it easy to type and reference.

### 2. Deployment Model

The deployment model determines how resources are organized and managed within Azure. There are two primary deployment models:

- **Resource Manager**:
  
  - **Current Standard**: The Azure Resource Manager (ARM) model is the preferred and recommended deployment method due to its advanced feature set.
  
  - **Resource Group Concept**: ARM introduces resource groups, allowing for efficient management and deployment of related resources as a single unit. This simplifies resource management, organization, and access control.

- **Classic**:
  
  - **Legacy System**: The Classic model is being deprecated and lacks the advanced features found in the ARM model, such as resource grouping.
 
  - **Limited in Functionality**: While it still supports basic functionalities for some existing Azure resources, it is not advisable to create new storage accounts under this model.

**Recommendation**: Microsoft strongly advocates using the **Resource Manager** deployment model for all new resource creations, including storage accounts.

### 3. Account Kind

The account kind determines the types of data services that can be included in a storage account and how pricing is structured. There are four primary account kinds:

1. **Standard - StorageV2 (General Purpose v2)**:
   - **Best Practice**: This is the recommended account kind supporting all storage services (Blobs, Files, Queues, Tables) and features. It provides the latest storage capabilities and generally optimized pricing.

2. **Premium - Page Blobs**:
   - Designed primarily for hosting Virtual Machine disks that support I/O-intensive applications, offering lower latency and high throughput.

3. **Premium - Block Blobs**:
   - This type is specifically optimized for block and append blobs, enhancing performance for workloads involved with append operations, streaming data, etc.

4. **Premium - File Shares**:
   - Offers premium storage specifically for files, providing low latency access for applications that need fast file share performance.

**Recommendation**: For most use cases, utilize the **Standard - StorageV2 (General Purpose v2)** option for new storage accounts as it encompasses versatility and efficiency in managing various storage services.

## Conclusion

When creating and configuring Azure Storage accounts, understanding the implications of the name, deployment model, and account kind is essential. Selecting the correct deployment model (Resource Manager) and account kind (Standard - StorageV2) encompasses clarity in management, reduces complexity, and enhances performance. These settings not only dictate operational parameters and costs but also serve as foundational decisions in planning Azure architecture effectively.
