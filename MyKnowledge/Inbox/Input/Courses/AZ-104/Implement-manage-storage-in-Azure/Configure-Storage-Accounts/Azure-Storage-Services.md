---
tags: microsoft azure storage service cloud devops
date: 13th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Azure storage services

### Overview

Azure Storage provides four main data services accessible through an Azure storage account. These services cater to different storage needs, from object storage to messaging.

### Azure Storage Services

1. **Azure Blob Storage (Containers)**
    
    - **Purpose**: Massively scalable object store for unstructured data (text and binary).
    - **Use Cases**:
        - Serving images/documents to browsers.
        - Distributed file access.
        - Streaming video/audio.
        - Backup, restore, disaster recovery, and archiving.
        - Data analysis.
    - **Access**: Via HTTP/HTTPS, URLs, REST API, Azure PowerShell, Azure CLI, and client libraries (.NET, Java, Node.js, Python, PHP, Ruby).
    - **Note**: Supports NFS protocol for data access.
2. **Azure Files**
    
    - **Purpose**: Managed file shares for cloud/on-premises.
    - **Protocols**: SMB and NFS.
    - **Use Cases**:
        - Migrating on-premises applications using file shares.
        - Storing configuration files for multiple VMs.
        - Sharing tools/utilities among developers.
        - Writing diagnostic logs, metrics, and crash dumps.
    - **Access**: Requires storage account credentials for authentication.
3. **Azure Queue Storage**
    
    - **Purpose**: Messaging store for reliable asynchronous messaging.
    - **Message Size**: Up to 64 KB.
    - **Use Cases**:
        - Creating a backlog of work (e.g., processing image uploads and creating thumbnails).
        - Scaling processing parts separately for better control.
4. **Azure Table Storage**
    
    - **Purpose**: Stores non-relational structured data (NoSQL).
    - **Features**:
        - Schemaless design for easy data adaptation.
        - Fast and cost-effective access.
        - Lower cost than traditional SQL for similar data volumes.
    - **Integration**: Part of Azure Cosmos DB, offering throughput-optimized tables, global distribution, and automatic secondary indexes.

### Considerations for Choosing Azure Storage Services

- **Massive Data Storage**: Use Azure Blob Storage for unstructured data accessible globally, ideal for direct browser serving, streaming, and backups.
- **High Availability**: Azure Files offers highly available network file shares, facilitating easy migration of on-premises apps and shared data access.
- **Message Storage**: Azure Queue Storage is suitable for storing large numbers of messages, creating asynchronous processing backlogs.
- **Structured Data Storage**: Azure Table Storage is optimal for structured, non-relational data, providing a managed NoSQL database service.