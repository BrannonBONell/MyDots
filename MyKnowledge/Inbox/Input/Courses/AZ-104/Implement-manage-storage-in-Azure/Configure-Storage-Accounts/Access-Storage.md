---
tags: azure microsoft devops cloud access storage
date: 13th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Access Storage

### Overview

Azure Storage provides unique URL addresses for every object stored, allowing easy access and management. The storage account name forms the subdomain of the URL, creating endpoints for different Azure services.

### Default Endpoints for Azure Services

For a storage account named `mystorageaccount`, the default endpoints are:

| Service               | Default endpoint                                    |
| --------------------- | --------------------------------------------------- |
| **Container service** | `//`**`mystorageaccount`**`.blob.core.windows.net`  |
| **Table service**     | `//`**`mystorageaccount`**`.table.core.windows.net` |
| **Queue service**     | `//`**`mystorageaccount`**`.queue.core.windows.net` |
| **File service**      | `//`**`mystorageaccount`**`.file.core.windows.net`  |

We create the URL to access an object in your storage account by appending the object's location in the storage account
- **Container Service**: `mystorageaccount.blob.core.windows.net`
- **Table Service**: `mystorageaccount.table.core.windows.net`
- **Queue Service**: `mystorageaccount.queue.core.windows.net`
- **File Service**: `mystorageaccount.file.core.windows.net`

### Accessing Objects in Azure Storage

To access a specific object, append the object's location to the service endpoint. For example, to access `myblob` in `mycontainer`:

```
mystorageaccount.blob.core.windows.net/mycontainer/myblob
```

### Configuring Custom Domains

You can configure custom domains to access blob data, allowing users to use a familiar domain name instead of the default Azure endpoint.

- **Default Endpoint**: `<storage-account-name>.blob.core.windows.net`
- **Custom Domain Example**: `www.contoso.com`

#### HTTPS Support

- Azure Storage does not natively support HTTPS with custom domains.
- Use Azure Content Delivery Network (CDN) to access blobs over HTTPS with custom domains.

### Methods for Configuring Custom Domains

1. **Direct Mapping**
    
    - **Description**: Directly maps a subdomain to an Azure storage account using a `CNAME` record.
    - **Example**:
        - Subdomain: `blobs.contoso.com`
        - Azure Storage Account: `<storage-account>.blob.core.windows.net`
        - `CNAME` Record: `contosoblobs.blob.core.windows.net`
2. **Intermediary Domain Mapping**
    
    - **Description**: Used for domains already in use within Azure, minimizing downtime during mapping.
    - **Process**:
        - Use `asverify` keyword to validate the domain without modifying the DNS record.
        - After DNS modification, the domain maps to the blob endpoint with no downtime.
    - **Example**:
        - `CNAME` Record: `asverify.blobs.contoso.com`
        - Intermediate `CNAME` Record: `asverify.contosoblobs.blob.core.windows.net`

For more details on intermediary domain mapping, refer to the [Azure documentation](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-custom-domain-name?tabs=azure-portal).