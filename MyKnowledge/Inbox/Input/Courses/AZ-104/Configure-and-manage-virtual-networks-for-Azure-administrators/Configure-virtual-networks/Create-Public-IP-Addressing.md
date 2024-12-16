---
tags: azure microsoft devops cloud virtual networks create public ip-addressing
date: 15th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Create Public IP Addressin

![Screenshot that shows how to create a public IP address in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-virtual-networks/media/create-public-ip-address-f07bd67d.png)

When you create a **public IP address** for your Azure resources, this address allows your resource (like a virtual machine or load balancer) to communicate with the internet. Here’s a breakdown of the key settings and considerations when creating a public IP address in the Azure portal.

---

### **1. Key Settings for Creating a Public IP Address**

#### **1.1 IP Version**

- **Options**:
    - **IPv4**: Creates a standard IPv4 address (most common).
    - **IPv6**: Creates an IPv6 address (less common, used for modern networking).
    - **Both**: Creates both IPv4 and IPv6 addresses for your resource.

#### **1.2 SKU (Stock Keeping Unit)**

- **Basic SKU**:
    - Simple and less expensive, but lacks advanced features.
    - Supports dynamic IP assignments.
- **Standard SKU**:
    - More advanced, offers better security, reliability, and availability features.
    - Static by default and required for load balancing scenarios.
    - Provides better resiliency for critical workloads.
- **Note**: The SKU you choose must match the **SKU of the Azure load balancer** if the IP address will be used with one.

#### **1.3 Name**

- **Unique Name**: Enter a **unique name** for the public IP address within the selected resource group. This name is used to identify the IP address resource.

---

### **2. IP Address Assignment Types**

There are two methods for assigning public IP addresses in Azure:

#### **2.1 Dynamic IP Address Assignment**

- **When It’s Used**: The IP address is assigned when the public IP resource is associated with an Azure resource (like a VM) and starts for the first time.
- **Address Behavior**:
    - The address **can change** if the resource is stopped (deallocated) and restarted.
    - The address **remains the same** if the resource is rebooted or stopped from within the guest OS.
    - When the resource is detached from the IP, the address is **released**.

#### **2.2 Static IP Address Assignment**

- **When It’s Used**: The IP address is assigned as soon as the public IP is created and does not change.
- **Address Behavior**:
    - The address remains **fixed** until the public IP resource is deleted.
    - You can change the assignment type from static to dynamic if the IP is not currently associated with a resource.
    - **Use Case**: Recommended for scenarios where a fixed IP address is needed, such as for DNS, SSL certificates, or security rules.

---

### **3. Notes for Specific Configurations**

- **IPv6 with Basic SKU**: If you select **IPv6** and use the **Basic SKU**, the assignment method must be **Dynamic**.
- **Standard SKU**: For both **IPv4** and **IPv6**, **Static assignment** is used by default with the Standard SKU.

---

### **4. Summary of Key Points**

- **IP Version**: Choose **IPv4**, **IPv6**, or both depending on your networking requirements.
- **SKU**:
    - **Basic SKU**: Simple, cheaper, dynamic by default.
    - **Standard SKU**: More features, static by default, better for critical workloads.
- **Name**: Enter a **unique name** to identify your public IP address in the resource group.
- **IP Assignment**:
    - **Dynamic**: Assigned at resource start, can change if stopped and deallocated.
    - **Static**: Fixed from creation, does not change unless the IP resource is deleted.