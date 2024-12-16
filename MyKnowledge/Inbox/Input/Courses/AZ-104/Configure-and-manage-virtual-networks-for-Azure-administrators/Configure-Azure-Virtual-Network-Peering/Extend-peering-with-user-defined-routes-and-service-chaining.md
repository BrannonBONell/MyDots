---
tags: microsoft azure cloud devops peering user defined routes service chaining
date: 15th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Extend Peering with User Defined Routes and Service Chaining

**Virtual Network Peering** in Azure is **nontransitive**, meaning that communication is only enabled between **directly peered networks**. If you have multiple networks, peering between them doesn’t automatically allow communication between unpeered networks. To enable communication beyond direct peerings, you need additional mechanisms like **hub and spoke networks**, **user-defined routes (UDRs)**, and **service chaining**.

---

### **1. Key Concept: Nontransitive Peering**

- **Direct Peering Only**: If networks **A** and **B** are peered, and networks **B** and **C** are peered, network **A** cannot automatically communicate with network **C** unless a direct peering is established between them.

---

### **2. Extending Peering with Additional Mechanisms**

To extend peering capabilities beyond direct connections, you can use the following mechanisms:

|**Mechanism**|**Description**|
|---|---|
|**Hub and Spoke Network**|A **hub virtual network** hosts infrastructure components like a **Network Virtual Appliance (NVA)** or **VPN Gateway**. All **spoke** networks peer with the **hub**, and traffic flows through the hub's NVAs or VPN gateways to communicate between spokes.|
|**User-Defined Routes (UDR)**|You can use **UDRs** to define custom routing rules. In virtual network peering, the **next hop** can be a virtual machine or **VPN gateway** in a peered network. This allows traffic to be routed to other virtual networks indirectly.|
|**Service Chaining**|**Service chaining** directs traffic through specific virtual appliances or gateways by defining routes with **UDRs**. This allows traffic from one virtual network to flow through a virtual appliance (e.g., firewall, NVA) in another network.|

---

### **3. Hub and Spoke Architecture**

- **Hub**: Centralized virtual network hosting key infrastructure components such as:
    
    - **Network Virtual Appliance (NVA)**: Used for security, traffic filtering, etc.
    - **VPN Gateway**: Enables external communication.
- **Spoke Networks**: Virtual networks that **peer** with the hub to access the shared resources (NVA, VPN gateway) in the hub.
    
- **Traffic Flow**: Communication between spoke networks happens via the **hub** using **NVAs** or **VPN gateways** in the hub.
    
![Diagram that shows a hub virtual network with an NVA and VPN gateway that are accessible to other virtual networks.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-vnet-peering/media/service-chains-5c9286d1.png)


### **4. Summary of Key Points**

- **Nontransitive Peering**: Peering between networks is not automatically extended to other networks unless directly peered.
- **Mechanisms for Extending Peering**:
    - **Hub and Spoke Network**: Centralized hub hosting key services allows spokes to communicate through the hub.
    - **User-Defined Routes (UDRs)**: Custom routes that can point traffic to resources in a peered network.
    - **Service Chaining**: Directs traffic through a specific virtual appliance or gateway using UDRs.