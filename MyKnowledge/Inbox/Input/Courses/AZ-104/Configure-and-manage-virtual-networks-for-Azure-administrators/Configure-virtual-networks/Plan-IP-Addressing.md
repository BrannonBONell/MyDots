---
tags: azure microsoft devops cloud ip-addressing plan virtual networks
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Plan IP Addressing

In Azure, **IP addresses** are essential for communication between resources within the cloud, with on-premises networks, and the internet. There are two main types of IP addresses in Azure: **private** and **public**. Here’s what you need to know:

---

### **1. Types of Azure IP Addresses**

#### **1.1 Private IP Addresses**

- **Purpose**: Used for communication **within** an Azure Virtual Network (VNet) or between Azure resources and your on-premises network.
- **Use Case**: Private IP addresses are commonly used when extending your on-premises network to Azure through a **VPN Gateway** or **Azure ExpressRoute**.
- **Example**: A virtual machine that needs to communicate with other VMs within the same VNet or with a database server hosted on-premises.

#### **1.2 Public IP Addresses**

- **Purpose**: Used for communication **with the internet** or Azure’s public-facing services.
- **Use Case**: Public IP addresses are necessary for resources that need to be accessible from outside the Azure network, such as web servers or public APIs.
- **Example**: A virtual machine hosting a web application that users access over the internet.

---

### **2. Static vs. Dynamic IP Addresses**

Azure IP addresses can be assigned in two ways: **statically** or **dynamically**.

#### **2.1 Static IP Addresses**

- **Definition**: A **static IP address** remains fixed and does not change, even if the resource is restarted.
- **Best For**:
    - **DNS Name Resolution**: A static IP is useful when DNS records need to map to a consistent IP address.
    - **IP-Based Security**: Security models that rely on specific IP addresses (e.g., firewalls or security groups).
    - **TLS/SSL Certificates**: Certificates that are tied to a specific IP address.
    - **Role-Based VMs**: Ideal for critical virtual machines such as **Domain Controllers**, **DNS servers**, or **firewalls** that require consistent network addressing.

#### **2.2 Dynamic IP Addresses**

- **Definition**: A **dynamic IP address** is assigned automatically and can change when a resource is restarted.
- **Best For**: Non-critical resources or instances where consistent addressing is not required.
- **Example**: Virtual machines or containers where services don't depend on fixed IP addresses.

![Illustration of a resource with a private IP address and a public IP address.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-virtual-networks/media/ip-addressing-54476e47.png)
---

### **3. Key Considerations for IP Address Assignment**

#### **3.1 Subnet Allocation**

- You can allocate different subnets for resources that use **dynamic IP addresses** and **static IP addresses**. This allows for better organization and management of your network.

#### **3.2 Use Cases for Static IPs**

- **DNS Name Resolution**: Ensures that DNS records point to a stable, unchanging IP address.
- **IP-Based Security**: Works well with firewalls and security rules that need specific IP addresses for access controls.
- **Certificates**: IP address-bound **TLS/SSL certificates** rely on a static IP to ensure continuous validity.
- **Critical Services**: Important VMs like **Domain Controllers** or **DNS servers** benefit from static IPs to avoid disruptions caused by IP changes.

---

### **4. Summary of Key Points**

- **Private IPs**: Used for internal communication within a VNet or between Azure and on-premises networks.
- **Public IPs**: Used for communication with the internet and for public-facing Azure services.
- **Static IPs**: Do not change and are useful for services that require a fixed address (e.g., DNS, security rules, certificates).
- **Dynamic IPs**: Can change upon restart and are best for resources that do not require a consistent IP address.
- **Subnet Organization**: Separate resources with dynamic and static IP addresses into different subnets for easier management.