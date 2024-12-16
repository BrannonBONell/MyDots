---
tags:
  - azure
  - microsoft
  - access
  - signatures
  - shared
  - cloud
  - devops
  - storage
  - security
cssclasses: cornell-left cornell-border
date: "10-13-2024"
---

# Create-shared-access-signatures

### Big Picture: Understanding Shared Access Signatures

SAS are tokens appended to the Azure Storage resource URIs to control access to those resources. They empower fine-grained, temporary access control, protecting the confidentiality of your primary account keys while still providing resource access to authorized users.

### Detailed Focus: Characteristics and Configuration of SAS

#### Key Characteristics of SAS

1. **Granular Control**:
   - Define specific permissions such as read, write, or delete on individual resources.
   - Allows limited, front-facing access for user operations while safeguarding broader storage account permissions.

2. **Time-Bounded Access**:
   - SAS can be configured with explicit start and expiration times, controlling precisely when a client can access the resource.

3. **SAS Types**:

   - **Account-Level SAS**:
     - Grants access to resources across multiple services within a storage account (e.g., Blobs, Files, Queues, Tables).
     - Useful for broader, multi-service permission allocation.

   - **Service-Level SAS**:
     - Restricts scope to resources within a single service, such as only dealing with Blob storage or Queue storage.
     - Ideal for more precise control over specific operations within Azure Storage.

#### Enhanced Security Options

- **Stored Access Policies**: 
  - Define rules on the storage account itself to logically group SAS configurations, allowing centralized updates to restrictions and lifetimes.

- **IP Range Restrictions**:
  - Network control by limiting SAS accessibility to specific IP addresses. This restricts SAS use to requests originating from specified network ranges.

- **Protocol Enforcement**:
  - Bind SAS access to specific protocols, preferring HTTPS to encrypt data transit and enhance security against man-in-the-middle attacks.

#### Configuring a SAS Token in Azure

**Configuration Steps**:


![2024-10-13-at-22-40-53.png](2024-10-13-at-22-40-53.png)

1. **Signing Method**:
   - **Account Key**: Directly leverage storage account keys to sign the SAS.
   - **User Delegation Key**: Involves generating a key via Microsoft Entra ID, aligning with identity-based access paradigms.

2. **Define Permissions**:
   - Choose exact operations allowed (e.g., Read, Write) for the resource.

3. **Set Validity Interval**:
   - Define the SAS start and expiry times, allowing temporary access control.

4. **Specify Network and Access Protocols** (Optional):
   - Define allowed IP address ranges for access.
   - Enforce specific protocols (e.g., HTTPS only) to improve security during transfers.

### Application of SAS in Storage Security Strategy

#### Use Cases

- **Selective Resource Sharing**:
  - Enable partners to upload files directly into a blob container securely or allow developers to submit logs.

- **Flexible Access Control**:
  - Create time-limited download links available only for specific users or applications interacting through trusted IP addresses.

### Considerations for Using SAS

1. **Security Hygiene**: Ensure active SAS is monitored, including any suspicious access attempts.
2. **Key Rotations and Governance**: Regularly review SAS permissions and alignment with policy changes.
3. **Evaluation and Testing**: Simulate scenarios to ensure SAS usage adheres to intended access scopes and periods.

### Conclusion

Shared Access Signatures provide a robust mechanism to facilitate secure, temporary access to Azure resources without compromising core account security. By leveraging SAS’s granularity and flexibility in policy management, organizations can manage data sharing securely yet efficiently. As requirement structures become more complex, combining SAS with additional strategies like stored access policies can further dovetail access management to operational realities.
