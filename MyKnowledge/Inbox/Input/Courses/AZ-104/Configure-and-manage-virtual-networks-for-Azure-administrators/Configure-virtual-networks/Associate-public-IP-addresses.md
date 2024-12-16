---
tags: microsoft azure devops cloud virtual networks public ip addresses
date: 15th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Associate public IP addresses

**Public IP addresses** in Azure can be associated with various resources like virtual machines, load balancers, VPN gateways, and application gateways. These IP addresses can be either **dynamic** or **static**, depending on your requirements. Here's what you need to know:

---

### **1. Associating Public IP Addresses with Resources**

|**Resource**|**Public IP Association**|**Dynamic IP Address**|**Static IP Address**|
|---|---|---|---|
|**Virtual Machine (VM)**|NIC (Network Interface Card)|Yes|Yes|
|**Load Balancer**|Front-end configuration|Yes|Yes|
|**VPN Gateway**|VPN Gateway IP configuration|Yes|Yes*|
|**Application Gateway**|Front-end configuration|Yes|Yes*|

- **Note**: Static IP addresses are available for certain **SKUs** only (e.g., Standard SKU).

---

### **2. Public IP Address SKUs: Basic vs. Standard**

When creating a public IP address, you select either the **Basic** or **Standard** SKU. The SKU determines features such as **IP assignment**, **security**, and **redundancy**.

|**Feature**|**Basic SKU**|**Standard SKU**|
|---|---|---|
|**IP Assignment**|Static or Dynamic|Static|
|**Security**|Open by default|Secure by default (closed to inbound traffic)|
|**Supported Resources**|Network interfaces, VPN gateways, application gateways, and internet-facing load balancers|Network interfaces or public standard load balancers|
|**Redundancy**|Not zone redundant|Zone redundant by default|

---

### **3. Key Differences Between Basic and Standard SKUs**

- **IP Assignment**:
    
    - **Basic**: Can be either **static or dynamic**.
    - **Standard**: Always **static**.
- **Security**:
    
    - **Basic**: Public IPs are **open by default**, meaning inbound traffic is allowed unless otherwise restricted.
    - **Standard**: Public IPs are **secure by default**, meaning inbound traffic is denied unless explicitly allowed.
- **Resources**:
    
    - **Basic**: Can be used with **network interfaces**, **VPN gateways**, **application gateways**, and **load balancers**.
    - **Standard**: Only works with **network interfaces** or **public standard load balancers**.
- **Redundancy**:
    
    - **Basic**: Not zone redundant.
    - **Standard**: **Zone redundant** by default, providing better availability and resilience across Azure Availability Zones.

---

### **4. Summary of Key Points**

- **Public IP Addresses**: Can be associated with **virtual machines**, **load balancers**, **VPN gateways**, and **application gateways**.
- **Dynamic vs. Static**: Both dynamic and static IPs can be used, but static IPs offer consistency and are required for certain resources like **VPN gateways** and **application gateways** with specific SKUs.
- **Basic SKU**: Allows for **dynamic or static** IPs, is open by default, and is not zone redundant.
- **Standard SKU**: Offers **static-only** IPs, is secure by default, and is **zone redundant** for high availability.