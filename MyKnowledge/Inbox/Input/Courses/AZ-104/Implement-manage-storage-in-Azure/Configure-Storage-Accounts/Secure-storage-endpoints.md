---
tags: microsoft azure devops cloud storage secure endpoints
date: 13th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Secure Storage Endpoints

### Overview

Azure Storage requires configuration of service endpoints to secure and restrict network access. This is done through the Azure portal using the **Firewalls and virtual networks** settings.
![Screenshot of the Storage Account Firewalls and virtual networks settings in the Azure portal. One virtual network is selected and the firewall has an IP address range.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-storage-accounts/media/secure-storage-access-d32868ef.png)

### Configuring Service Endpoints

1. **Access Settings**
    
    - Use the **Firewalls and virtual networks** settings in the Azure portal to manage access to your storage account.
    - These settings allow you to specify which virtual networks and subnets can access the storage account.
2. **Restricting Access**
    
    - Access can be restricted to specific subnets on virtual networks or to certain public IP ranges.
    - This ensures that only authorized networks can interact with your storage account, enhancing security.
3. **Network Requirements**
    
    - Subnets and virtual networks must be located in the same Azure region or region pair as your storage account.
    - This geographical alignment is necessary for the configuration to work properly.

### Important Considerations

- **Testing**: It is crucial to test the service endpoint configuration to ensure that access is restricted as intended.
- **Verification**: Regularly verify that the endpoint limits access appropriately to maintain security.

### Visual Aid

- The Azure portal provides a visual interface to configure these settings, allowing you to select virtual networks and specify IP address ranges for the firewall.