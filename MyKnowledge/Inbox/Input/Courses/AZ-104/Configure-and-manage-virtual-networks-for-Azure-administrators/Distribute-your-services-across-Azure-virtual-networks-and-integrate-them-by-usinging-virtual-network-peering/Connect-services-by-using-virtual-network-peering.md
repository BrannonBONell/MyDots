---
tags: azure cloud devops microsoft connect services virtual network peering
date: 15th-October-2024
---

# Connect services by using virtual network peering

**Azure Virtual Network Peering** allows virtual networks (VNets) to communicate with each other as if they are in the same network, using only **private IP addresses**. It is a secure, low-latency way to connect VNets without relying on the internet or gateways.

![A basic diagram of two virtual networks that are connected by virtual network peering.](https://learn.microsoft.com/en-us/training/modules/integrate-vnets-with-vnet-peering/media/2-vnet-peering.svg)
---

### **1. Key Features of Virtual Network Peering**

- **Private Communication**: Traffic between peered virtual networks uses private IP addresses and stays on the **Azure backbone network**. No public internet, gateways, or encryption is required.
- **Two Types of Peering**:
    - **Regional Peering**: Connects VNets within the same region (e.g., two VNets in North Europe).
    - **Global Peering**: Connects VNets in different regions (e.g., one VNet in North Europe, another in West Europe).
- **Reciprocal Connections**: When creating a peering connection, both networks must be configured to allow communication (reciprocal peering).
- **Cross-Subscription Peering**: VNets in different subscriptions (even across different Microsoft Entra tenants) can be peered if the **Network Contributor role** is granted to the peer's administrator.

---

### **2. Important Considerations**

#### **Transitivity**

- **Non-Transitive Peering**: Peered networks cannot automatically communicate with each other's peers. Direct peering is required between all networks.
    - Example: If networks **A** and **B** are peered, and **B** and **C** are peered, **A** and **C** cannot communicate unless they are directly peered.

#### **Gateway Transit**

- **On-Premises Connectivity**: With **gateway transit**, peered networks can share a single VPN gateway to connect to on-premises datacenters.
    - **Hub-and-Spoke**: A hub VNet can provide a gateway connection for all peered spoke VNets, reducing cost and complexity.
    - **Use Remote Gateways**: Spoke VNets can use the hub VNet's gateway by enabling this option.

#### **Overlapping Address Spaces**

- **Non-Overlapping IP Address Spaces**: VNets being peered must have **non-overlapping IP address spaces**. This is true for both peered Azure networks and on-premises connections.

![Diagram of a comparison of overlapping and non-overlapping network addressing.](https://learn.microsoft.com/en-us/training/modules/integrate-vnets-with-vnet-peering/media/2-non-overlapping-networks.svg)
---

### **3. Alternative Connectivity Methods**

- **ExpressRoute**: A **dedicated private connection** between an on-premises datacenter and the Azure backbone network, offering secure and high-performance connectivity.
- **VPN Gateway**: A **site-to-site VPN** uses the internet for connectivity but introduces higher latency compared to virtual network peering.
- **Peering vs. Gateways**: If both peering and a gateway are used to connect VNets, traffic will flow through the peering configuration.

---

### **4. When to Choose Virtual Network Peering**

- **Best Use Cases**:
    - Easy integration between services in different VNets.
    - Connectivity across regions and subscriptions.
- **When Not to Use Peering**:
    - If you have existing **VPN** or **ExpressRoute** connections.
    - If you need to access services behind **Azure Basic Load Balancers** from a peered VNet.

---

### **5. Summary of Key Points**

- **Virtual Network Peering** is a simple and secure way to connect Azure VNets using private IP addresses.
- **Non-Transitive**: VNets can only communicate with directly peered networks.
- **Gateway Transit**: Enables on-premises connectivity via a shared VPN gateway.
- **Address Space**: Peered networks must have non-overlapping IP ranges.
- **Best Choice**: Peering is often the best option for connecting VNets unless you have complex configurations with VPNs or ExpressRoute.

Virtual network peering provides a highly efficient and low-latency way to connect VNets for most scenarios, making it an excellent first choice for integrating networks in Azure.