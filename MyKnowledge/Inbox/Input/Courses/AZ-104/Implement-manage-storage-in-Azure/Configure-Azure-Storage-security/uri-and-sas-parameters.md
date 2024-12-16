---
tags:
  - uri
  - sas
  - azure
  - cloud
  - devops
  - microsoft
  - security
  - storage
cssclasses: cornell-left cornell-border
date: "10-13-2024"
---

# URI-and-SAS-parameters

### Big Picture: Purpose of SAS URI

A SAS URI allows the secure distribution of resource access without sharing the storage account keys. It offers time-bound and permission-defined access to Azure Storage resources such as blobs, tables, files, or queues.

### Anatomy of a SAS URI

Here’s a detailed look at a typical service-level SAS URI and its parameters:

```url
https://myaccount.blob.core.windows.net/?restype=service&comp=properties&sv=2015-04-05&ss=bf&st=2015-04-29T22%3A18%3A26Z&se=2015-04-30T02%3A23%3A26Z&sr=b&sp=rw&sip=168.1.5.60-168.1.5.70&spr=https&sig=F%6GRVAZ5Cdj2Pw4tgU7IlSTkWgn7bUkkAg8P6HESXwmf%4B
```

#### Parameter Breakdown:

1. **Resource URI (`https://myaccount.blob.core.windows.net/`)**:
    - Points to the Azure Blob Storage account endpoint.
    - The query string starts with `?` and integrates parameters to modify the operation.

2. **Query Parameters**:

    - **`restype=service`**: 
        - Defines the type of resource targeted by the operation. The `service` type specifies that this SAS is at the service level.

    - **`comp=properties`**:
        - Indicates operations to check or set properties at the service layer.

    - **`sv=2015-04-05`**:
        - API version of Azure Storage to be used. Controls feature set compatibility.

    - **`ss=bf`**:
        - Represents the storage services impacted: `b` for Blob and `f` for Files. It denotes that this SAS token affects both services, if appropriate scopes are defined.

    - **`st=2015-04-29T22%3A18%3A26Z`**:
        - Start time in UTC for SAS validity. Defines when the SAS becomes active.

    - **`se=2015-04-30T02%3A23%3A26Z`**:
        - Expiry time in UTC for SAS. Limits when the SAS is valid, securing the time window for access.

    - **`sr=b`**:
        - Stands for "resource" and specifies access to Blob Storage (`b`).

    - **`sp=rw`**:
        - Permissions granted by the SAS: `r` for read and `w` for write, allowing specified operations on resources.

    - **`sip=168.1.5.60-168.1.5.70`**:
        - Defines an allowable IP range for requests. Restricts SAS use to predefined network addresses for security adherence.

    - **`spr=https`**:
        - Restricts protocol to HTTPS only, providing data-in-transit encryption.

    - **`sig=F%6GRVAZ5Cdj2Pw4tgU7IlSTkWgn7bUkkAg8P6HESXwmf%4B`**:
        - Signature authenticating the authorization of the SAS. Created using HMAC SHA256 and Base64 encoding, verifying request integrity under SAS constraints.


![2024-10-13-at-22-51-39.png](2024-10-13-at-22-51-39.png)

### Practical Uses of SAS

- **Controlled Sharing**:
  - Enable partners or third-party clients access to specific blob data for collaboration and data processing tasks, without disclosing master storage keys.

- **Temporary Data Operations**:
  - Facilitate time-restricted operations, like temporary file uploads or downloads during defined maintenance windows.

- **Managed Network Access**:
  - Enforces access only from corporate networks by using IP address restrictions, thereby reducing exposure risks from unauthorized networks.

### Security and Management Considerations

1. **Key Management**:
   - Regularly rotate signatures and keys to minimize security risks.

2. **Usage Monitoring**:
   - Utilize Azure Monitor and logging tools to track SAS activity, helping identify discrepancies or misuse.

3. **Deployment Testing**:
   - Test SAS settings and scope in development environments to ensure they meet operational and security needs.

4. **Policy Enforcement**:
   - Implement stored access policies for collective management and revocation of SAS settings when needed.

### Conclusion

Crafting comprehensive SAS URIs allows administrators to strike a beneficial balance: ease of data sharing with fortified security practices. Effective parameterization ensures precise control over data access while leveraging Azure's versatile storage offerings. Further exploration can involve setting up stored access policies or encoding practices if additional exploration is needed!


