---
tags: azure cloud devops microsoft ip adressing integration network
date: 15th-October-2024
---

# Network IP Addressing and integration

**Overview**: To integrate resources in an **Azure virtual network** with your **on-premises network**, it is important to understand the network structures, IP addressing, and how to avoid conflicts between the two environments. Azure networks and on-premises networks can communicate seamlessly if designed correctly, without any overlap in IP addressing.

---

### **On-Premises Network Design**:

![Diagram of a typical on-premises network design.](https://learn.microsoft.com/en-us/training/modules/design-ip-addressing-for-azure/media/2-on-premises-network.png)

- **Key Components**:
    
    - **Routers**: Facilitate communication between networks.
    - **Firewalls**: Control traffic entering or leaving the network, providing security.
    - **Switches**: Connect devices within the internal network.
    - **Network Segmentation**: Divides the network into smaller subnets for better traffic management.
- **IP Addressing**:
    
    - **Public IP addresses** are assigned to devices exposed to the internet (e.g., web servers).
    - **Private IP addresses** are assigned to internal devices not accessible from the internet.
    - **Private IP Address Ranges** (non-routable):
        - 10.0.0.0 – 10.255.255.255
        - 172.16.0.0 – 172.31.255.255
        - 192.168.0.0 – 192.168.255.255
    - **CIDR Notation**: Helps specify the size of a subnet. Example: `192.168.0.0/24` uses a subnet mask of 255.255.255.0, which gives 256 IP addresses.

---

### **Azure Virtual Network Design**:

- **Key Components**:
    
    - **Virtual Networks (VNet)**: The fundamental building block for private networking in Azure.
    - **Subnets**: Logical divisions within the VNet that contain specific resources (e.g., front-end and back-end services).
    - **Network Security Groups (NSGs)**: Control traffic at the network layer by defining inbound and outbound rules.
    - **Firewalls**: Add additional layers of security for network and application-layer traffic.
    - **Load Balancers**: Distribute traffic across multiple servers to ensure high availability.
- **Azure Network Properties**:
    
    - Uses **private IP addresses** similar to on-premises networks.
    - **Subnets** can be created, expanded, or removed based on the network's IP address space.
    - **Communication between subnets** is allowed by default but can be restricted using NSGs.

---

### **Key Concepts: IP Addressing in Azure**:

![Diagram of a typical Azure network design.](https://learn.microsoft.com/en-us/training/modules/design-ip-addressing-for-azure/media/2-azure-network.png)

- **CIDR Notation**: Same as on-premises, e.g., `10.0.0.0/24`.
- **Sizing of Subnets**:
    - The smallest supported subnet uses a **/29 subnet mask** (8 IP addresses).
    - The largest supported subnet uses a **/2 subnet mask** (1,073,741,824 IP addresses).

---

### **Integrating Azure and On-Premises Networks**:

1. **No IP Overlap**:
    
    - Ensure there is **no overlap in the IP address ranges** between your on-premises and Azure networks.
    - Example:
        - **Allowed**: On-premises uses `10.10.0.0/16`, Azure uses `10.20.0.0/16`.
        - **Not Allowed**: On-premises uses `192.168.0.0/16`, and Azure uses `192.168.10.0/24` (as they overlap).
2. **Private IP Address Scheme**:
    
    - Use separate **non-overlapping IP ranges** for Azure and on-premises.
    - Example: Use `10.10.0.0/16` for on-premises and `10.20.0.0/16` for Azure.
3. **Integration Options**:
    
    - **VPN Gateway**: Connects on-premises networks to Azure via a secure, encrypted connection over the internet.
    - **ExpressRoute**: A dedicated, private connection that doesn't travel over the public internet, offering higher security and reliability.

---

### **Example Scenario**: Migrating an On-Premises Database to Azure

- **Problem**: You need to migrate a business-critical database to Azure while maintaining seamless access for on-premises and remote users.
- **Solution**:
    - Create a **Virtual Network (VNet)** in Azure with an IP address range that does not overlap with your on-premises network.
    - Use a **VPN Gateway** or **ExpressRoute** to establish connectivity between your Azure VNet and on-premises network.
    - Ensure that client applications can continue accessing the database in Azure as if it were still on-premises.

---

### **Key Points to Remember**:

- **On-Premises IP Ranges**: Use private IP ranges such as `10.0.0.0/8`, `172.16.0.0/12`, or `192.168.0.0/16`.
- **CIDR Notation**: Specifies the size of the subnet, such as `/24` for 256 IP addresses.
- **No Overlapping IP Ranges**: Ensure there is no overlap between on-premises and Azure networks.
- **Subnets in Azure**: Can be modified dynamically as long as no VMs or services are deployed in the subnet.
- **NSGs and Firewalls**: Use these to control traffic and secure your Azure resources.

---

### **Conclusion**:

When integrating **Azure Virtual Networks** with your **on-premises networks**, careful planning of **IP addressing** and **network design** is essential. Avoid IP overlaps and ensure seamless communication between on-premises resources and Azure services by implementing secure connections, such as **VPN Gateway** or **ExpressRoute**, and managing traffic using NSGs and firewalls.