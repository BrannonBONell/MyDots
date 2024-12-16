---
tags: microsoft azure devops cloud manage storage
date: 13th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Azure Storage 

### Overview

Azure Storage is Microsoft's cloud storage solution designed for modern data storage needs. It offers scalable storage options for various data types and is used in applications ranging from file sharing to virtual machine support.

### Key Features of Azure Storage

- **Massively Scalable**: Supports large-scale data storage needs.
- **Versatile**: Suitable for storing files, messages, tables, and more.
- **Integration**: Used by IaaS virtual machines and PaaS cloud services.

### Categories of Data in Azure Storage

1. **Virtual Machine Data**
    
    - **Description**: Includes disks and files for Azure IaaS virtual machines.
    - **Storage Examples**: Managed disks for database files, website content, etc.
    - **Capacity**: Each data disk can hold up to 32,767 GB.
2. **Unstructured Data**
    
    - **Description**: Least organized, nonrelational format.
    - **Storage Examples**: Azure Blob Storage (scalable object store) and Azure Data Lake Storage (HDFS as a service).
3. **Structured Data**
    
    - **Description**: Relational format with shared schema.
    - **Storage Examples**: Azure Table Storage, Azure Cosmos DB (globally distributed), and Azure SQL Database (managed SQL service).

|Category|Description|Storage examples|
|---|---|---|
|**Virtual machine data**|Virtual machine data storage includes disks and files. Disks are persistent block storage for Azure IaaS virtual machines. Files are fully managed file shares in the cloud.|Storage for virtual machine data is provided through Azure managed disks. Data disks are used by virtual machines to store data like database files, website static content, or custom application code. The number of data disks you can add depends on the virtual machine size. Each data disk has a maximum capacity of 32,767 GB.|
|**Unstructured data**|Unstructured data is the least organized. Unstructured data may not have a clear relationship. The format of unstructured data is referred to as _nonrelational_.|Unstructured data can be stored by using Azure Blob Storage and Azure Data Lake Storage. Blob Storage is a highly scalable, REST-based cloud object store. Azure Data Lake Storage is the Hadoop Distributed File System (HDFS) as a service.|
|**Structured data**|Structured data is stored in a relational format that has a shared schema. Structured data is often contained in a database table with rows, columns, and keys. Tables are an autoscaling NoSQL store.|Structured data can be stored by using Azure Table Storage, Azure Cosmos DB, and Azure SQL Database. Azure Cosmos DB is a globally distributed database service. Azure SQL Database is a fully managed database-as-a-service built on SQL.|

### How to create a storage account
### Creating a Storage Account

- **Types of Storage Accounts**:
    - **Standard**: Uses HDD, cost-effective for bulk storage or infrequent access.
    - **Premium**: Uses SSD, offers low-latency performance for I/O-intensive applications.
- **Note**: Conversion between Standard and Premium accounts is not possible; a new account must be created for a different type.

### Considerations for Using Azure Storage

- **Durability and Availability**: Data is replicated across datacenters for protection and remains available during outages.
- **Secure Access**: Data is encrypted, with fine-grained access control.
- **Scalability**: Designed to meet the demands of modern applications.
- **Manageability**: Microsoft handles hardware maintenance and updates.
- **Data Accessibility**: Accessible globally via HTTP/HTTPS, with SDKs available in multiple programming languages.

### Tools and Interfaces

- **Azure PowerShell and Azure CLI**: For scripting and automation.
- **Azure Portal and Azure Storage Explorer**: Provide visual interfaces for managing data.