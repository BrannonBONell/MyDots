---
tags: azure cloud devops microsoft routing capabilities virtual network
date: 17th-October-2024
---
# Identify routing capabilities of an Azure virtual network

Azure provides system routes by default to route network traffic across subnets, virtual networks, and on-premises networks. However, custom routes allow you to control traffic flow, such as routing traffic through a **Network Virtual Appliance (NVA)** or firewall.

---

### **1. Overview of Azure Routing**

- **System Routes**: Automatically assigned to each subnet and control traffic between Azure resources. You cannot create or delete system routes, but you can override them with custom routes.
- **Default System Routes**:
    - **Virtual Network**: Routes traffic between subnets within the virtual network.
    - **Internet**: Routes traffic to the internet (default route for 0.0.0.0/0).
    - **None**: Traffic routed to private IP address ranges (e.g., 10.0.0.0/8) is dropped.

**Example of System Routes**:

|Address Prefix|Next Hop Type|
|---|---|
|Virtual network|Virtual network|
|0.0.0.0/0|Internet|
|10.0.0.0/8|None|
|192.168.0.0/16|None|

![Diagram of traffic flowing among subnets and the internet.](https://learn.microsoft.com/en-us/training/modules/control-network-traffic-flow-with-routes/media/2-system-routes-subnets-internet.svg)
---

### **2. Custom Routes for Traffic Control**

**Custom routes** override system routes, allowing you to control traffic flow. Use cases include routing traffic through an NVA or firewall.

- **User-Defined Routes (UDRs)**: These routes allow you to define the traffic path within your network, such as sending traffic to a firewall or NVA.
- **Next Hop Types**:
    - **Virtual Appliance**: Routes traffic through a virtual appliance (e.g., a firewall).
    - **Virtual Network Gateway**: Routes traffic to an Azure VPN gateway.
    - **Internet**: Routes traffic to the internet.
    - **None**: Drops traffic for a specific address range.

---

### **3. Key Azure Features Related to Routing**

- **Virtual Network Peering**: Allows two virtual networks to communicate. You can configure user-defined routes between peered networks to control traffic flow through an NVA.
- **Service Chaining**: Allows traffic to be routed between peered networks using custom routes.
![Diagram of virtual network peering with user-defined routes.](https://learn.microsoft.com/en-us/training/modules/control-network-traffic-flow-with-routes/media/2-virtual-network-peering-udrs.svg)
- **Virtual Network Gateway**: Enables encrypted traffic between on-premises and Azure or between Azure networks.
![Diagram of the structure of a virtual network gateway.](https://learn.microsoft.com/en-us/training/modules/control-network-traffic-flow-with-routes/media/2-virtual-network-gateway.svg)
- **Virtual Network Service Endpoints**: Extends private IP addresses to Azure services, restricting traffic from public sources.


---

### **4. Route Selection and Priority**

Azure uses the **longest prefix match** to determine the best route for traffic. For example, traffic sent to 10.0.0.2 would follow the route with a 10.0.0.0/24 prefix over a 10.0.0.0/16 prefix, as it is more specific.

- **Priority of Routes**:
    1. **User-Defined Routes (UDRs)**: Highest priority.
    2. **Border Gateway Protocol (BGP) Routes**: Second priority.
    3. **System Routes**: Lowest priority.

---

### **5. Custom Routing with User-Defined Routes (UDRs)**

- **Purpose**: UDRs allow you to override system routes to direct traffic through devices such as firewalls or NVAs.
    
- **Use Case**: In a network with two subnets, you can route traffic through a firewall before it reaches the second subnet.
    
    **Next Hop Types for UDRs**:
    
    - **Virtual Appliance**: Typically used for firewalls.
    - **Virtual Network Gateway**: Routes to a VPN gateway.
    - **Internet**: Routes traffic to the internet.

---

### **6. Service Tags for UDRs**

- **Service Tags**: Simplify routing by representing a group of Azure service IP ranges. Microsoft manages these IP ranges, so they are automatically updated as needed.

---

### **7. Border Gateway Protocol (BGP)**

- **BGP**: Used for routing between Azure and on-premises networks, commonly with **Azure ExpressRoute** or **VPN** connections. It automatically adapts routing paths in case of network issues.

![Diagram showing an example of using the Border Gateway Protocol.](https://learn.microsoft.com/en-us/training/modules/control-network-traffic-flow-with-routes/media/2-bgp.svg)
---

### **8. Considerations for Custom Routing**

- **Route Selection**: Azure uses the most specific route available (longest prefix match).
- **Traffic Control**: Custom routes allow you to control which path traffic takes within or outside of your Azure network.
- **Route Table Association**: Each route table can be associated with one or more subnets, and each subnet can only be associated with one route table.

---

### **Summary of Key Points**

- **System Routes**: Default routes in Azure virtual networks.
- **Custom Routes (UDRs)**: Allow control of traffic flow, such as routing through an NVA.
- **Next Hop Types**: Virtual appliances, internet, virtual network gateways, or none.
- **Route Priority**: UDRs have the highest priority, followed by BGP routes, and then system routes.
- **Service Tags**: Simplify the creation of UDRs by representing Azure services.
- **BGP**: A routing protocol that helps manage connectivity between Azure and on-premises networks.

By using **custom routes**, you can control traffic flow and secure your network by routing traffic through firewalls or NVAs, providing more granular control over network traffic within Azure.