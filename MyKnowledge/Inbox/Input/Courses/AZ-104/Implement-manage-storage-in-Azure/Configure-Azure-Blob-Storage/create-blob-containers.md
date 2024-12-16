---
tags:
  - azure
  - microsoft
  - breate
  - blob
  - containers
  - cloud
  - devops
cssclasses: cornell-left cornell-border
date: "10-13-2024"
---

# Create-blob-containers

### Big Picture: Understanding Azure Blob Storage

Azure Blob Storage is a service provided by Microsoft Azure to store large amounts of unstructured data, such as text or binary data. It’s optimized for:

- **Storing large amounts of unstructured data**, such as text or binary data.
- **Serving images or documents** directly to a browser.
- **Streaming video and audio**.
- **Writing to log files**.
- **Backing up** critical data.
- **Disaster recovery** and **archiving**.

A **blob** is an acronym for Binary Large Object, and in Azure Blob Storage, a blob can be a text file, image file, video file, etc. These blobs are organized into containers within an Azure storage account.

### Key Concepts: Containers and Blobs

1. **Containers:**
   - Containers are logical groupings for blobs.
   - All blobs must reside inside a container.
   - An Azure storage account can have an unlimited number of containers.
   - Containers can be managed through the Azure portal, CLI, PowerShell, or programmatically via APIs.

2. **Blobs:**
   - Blobs are the actual files/data stored within Azure Blob Storage.
   - There are different types of blobs such as block blobs, append blobs, and page blobs, each suited for different use cases.

3. **Storage Accounts:**
   - A storage account provides a unique namespace in Azure for your data.

### Detailed Focus: Configuring a Container

![2024-10-13-at-21-25-29.png](2024-10-13-at-21-25-29.png)
To organize blobs, you first need to create a container. In the Azure Portal, configuring a container involves setting a **name** and a **public access level**:

1. **Name:**
   - Must be unique within the storage account.
   - **Naming rules**:
     - Only lowercase letters, numbers, and hyphens allowed.
     - Must start with a letter or number.
     - Length between 3 and 63 characters.

2. **Public Access Level:**
   - Controls the visibility of your container and its blobs. Options include:
     - **Private:** No public read access (default).
     - **Blob:** Public read access to the blobs only.
     - **Container:** Public read and list access to the container and its blobs.

**Creating a Container:**

- **Azure Portal:** Navigate to the storage account, choose the "Containers" section, and click "Add" to create a new container.
- **PowerShell:** Use the `New-AzStorageContainer` command.

### Moving Content Between Containers

While the document mentions moving content, it doesn't provide a detailed method. So, let’s consider how this could be done:

- **Azure Portal:** You can download blobs from one container and upload them to another manually.
- **Azure CLI/Powershell/SDK:** You can script the process to copy blobs between containers programmatically.
  - With the Azure CLI, the `az storage blob copy start` command can be used.
  - Programmatic access through SDKs allows more automated processes for blob transfers, enabling quicker scaling and modifications.

### Questions to Consider:

To delve deeper into content management within Azure Blob Storage, consider:

- What types of blobs (block, append, page) suit your specific use cases?
- How do access levels impact the security and usability of your stored data?
- How can you automate blob management between containers in a way that optimizes for performance and cost?
