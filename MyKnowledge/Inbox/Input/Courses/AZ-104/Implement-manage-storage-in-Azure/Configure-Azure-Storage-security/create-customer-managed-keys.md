---
tags:
  - microsoft
  - azure
  - security
  - storage
  - customer
  - managed
  - keys
  - devops
  - cloud
cssclasses: cornell-left cornell-border
date: "10-13-2024"
---

# create-customer-managed-keys

Using Azure Key Vault to manage encryption keys for Azure Storage gives you the advantage of greater control and flexibility over your encryption practices. This approach is often referred to as using customer-managed keys (CMKs). Let’s explore how CMKs work, their characteristics, and the steps to configure them within your Azure environment.

### Big Picture: Customer-Managed Keys in Azure

Azure Storage encryption is built around secure data handling, and integrating Azure Key Vault for managing your encryption keys adds depth to your security strategy. CMKs allow you to exercise detailed control over encryption operations, including the autonomy to perform key rotation, access audits, and key lifecycle management.

### Detailed Focus: Characteristics of Customer-Managed Keys

1. **Flexibility and Control**:
   - CMKs enhance your control over key management, supporting custom generation, disabling, auditing, rotation, and access control specifications.

2. **Integration with Azure Storage**:
   - CMKs seamlessly support Azure Storage encryption, using either newly generated keys or existing ones within a key vault.
   - Ensures compliance with data sovereignty as the storage account and corresponding key vault must be situated within the same geographic region but can be hosted in different subscriptions.

3. **Security Posture**:
   - By leveraging Azure Key Vault, you can enhance your data protection strategy. It supports advanced security features like controlled access permissions, detailed logging, and integration with Azure Security Center for threat monitoring.

### Configuration Steps for Customer-Managed Keys

You can configure CMKs for your Azure Storage encryption through the Azure Portal. Here’s a step-by-step overview:

1. **Access Azure Portal**:
   - Navigate to the storage account settings and locate the encryption settings.

2. **Choose Encryption Type**:
   - Select "Customer-Managed Keys" to personally handle the encryption key lifecycle.

3. **Specify Encryption Key**:
   - **Key URI Input**: Enter the URI of your desired encryption key if it is set by you, within an existing Azure Key Vault.
   - **Select from Vault**: Alternatively, choose an encryption key directly from a pre-configured Azure Key Vault.

4. **Ensure Regional Compliance**:
   - Verify that both the storage account and the key vault exist within the same Azure region to meet geographical compliance standards.


![2024-10-13-at-22-56-30.png](2024-10-13-at-22-56-30.png)

### Best Practices

- **Key Rotation Policies**:
  - Regular key rotation helps mitigate risks from key exposure. Use Key Vault’s API to implement automatic rotation policies per security specifications.

- **Auditing and Monitoring**:
  - Activate auditing for key usage to track access and manipulation of encryption keys. Azure Key Vault logs all operations for completed transparency.
  - Integrate insights into **Azure Monitor** or **Azure Security Center** for more expansive security awareness.

- **Access Control and Permissions**:
  - Define and enforce role-based access controls (RBAC) for who can manipulate or utilize encryption keys—clearly demarcating operations personnel and security.

### Potential Questions for Planning

- How does deeper control over encryption keys align with your organization’s security policies or regulatory obligations?
- What processes are in place to ensure timely manual or automated key rotation cycles?
- How can you leverage Azure’s monitoring tools to improve your oversight on encryption waypoints?

### Conclusion

Implementing customer-managed keys using Azure Key Vault can significantly deepen your control over encryption handling, embedding robust security into your data practices. With stringent regional adherence for compliance and auditing trails to support forensic analysis and monitoring, you position your Azure Storage deployment for secure and efficient operations.
