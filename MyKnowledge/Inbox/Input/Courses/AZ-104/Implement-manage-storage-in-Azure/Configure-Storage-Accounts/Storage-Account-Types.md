---
tags: microsoft azure storage account types devops cloud
date: 13th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Storage account types

### Overview

Azure Storage offers various storage account types, each designed to support different features and pricing models. Understanding these options is crucial for selecting the right storage account to meet your application's needs.

### Storage Account Types

1. **Standard General-Purpose v2**
    
    - **Supported Services**:
        - Blob Storage (including Data Lake Storage)
        - Queue Storage
        - Table Storage
        - Azure Files
    - **Recommended Usage**:
        - Suitable for most scenarios, including blobs, file shares, queues, tables, and disks (page blobs).
        - Offers a versatile solution for a wide range of applications.
2. **Premium Block Blobs**
    
    - **Supported Services**:
        - Blob Storage (including Data Lake Storage)
    - **Recommended Usage**:
        - Ideal for applications with high transaction rates.
        - Suitable for working with smaller objects or when low storage latency is required.
        - Designed to scale with application demands.
3. **Premium File Shares**
    
    - **Supported Services**:
        - Azure Files
    - **Recommended Usage**:
        - Best for enterprise or high-performance scale applications.
        - Supports both Server Message Block (SMB) and Network File System (NFS) file shares.
        - Provides high-performance file sharing capabilities.
4. **Premium Page Blobs**
    
    - **Supported Services**:
        - Page blobs only
    - **Recommended Usage**:
        - High-performance storage for page blobs.
        - Ideal for storing index-based and sparse data structures.
        - Commonly used for operating systems, data disks for virtual machines, and databases.

### Key Considerations

- **Encryption**: All storage account types use Storage Service Encryption (SSE) for data at rest, ensuring data security.
- **Management**: Managing your storage account effectively is crucial. Resources are available to guide you through the management process.

### Additional Resources

- For more detailed information on managing your storage account, refer to the provided [video resource](https://www.youtube.com/embed/-j_8clCWYn8).

---

This study note provides a comprehensive overview of the different Azure Storage account types, their supported services, recommended usage scenarios, and key considerations for choosing the right storage account for your needs.