---
tags: microsoft azure devops cloud virtual network security groups
date: 15th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Network Security groups

**Network Security Groups (NSGs)** in Azure allow you to control and limit network traffic to and from your resources in a virtual network. You can assign NSGs to subnets or network interface cards (NICs) to implement security rules.

---

### **1. Key Characteristics of Network Security Groups**

- **Security Rules**: An NSG contains a list of **security rules** that **allow** or **deny** inbound and outbound traffic. These rules are based on source/destination IP addresses, ports, and protocols.
- **Associations**:
    - NSGs can be associated with **subnets** or **network interfaces**.
    - NSGs can be associated multiple times (i.e., one NSG can be linked to multiple subnets or NICs).
- **Creation**: NSGs are created and configured in the **Azure portal**, where you can define and manage security rules.

![Screenshot that shows details for a network security group for a virtual machine in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-network-security-groups/media/network-security-groups-1ebf7bed.png)
---

### **2. Assigning NSGs to Subnets**

- **Subnet-Level Control**: An NSG can be associated with a **subnet** to control the flow of traffic for all resources in that subnet.
    - **DMZ Subnet**: You can create a **protected screened subnet** (also called a **demilitarized zone or DMZ**) by assigning an NSG. A DMZ acts as a buffer between the internal network and the internet, restricting traffic flow into the subnet.
- **Important Considerations**:
    - Each subnet can have **only one NSG** associated with it.
    - All resources within the subnet inherit the security rules defined by the NSG.

---

### **3. Assigning NSGs to Network Interfaces (NICs)**

- **NIC-Level Control**: You can assign an NSG to a **network interface card (NIC)**, which controls traffic flow specifically for that individual network interface.
    
- **Granular Control**: By assigning an NSG to a NIC, you can apply specific security rules to control traffic for a particular virtual machine or resource, even if the subnet has a different NSG.
    
- **Important Considerations**:
    
    - Each network interface can have **zero or one NSG** associated with it.
    - If both the subnet and NIC have an NSG, the **combined rules** of both NSGs will apply to the traffic.

---

### **4. Summary of Key Points**

- **NSGs** contain security rules that allow or deny traffic based on source, destination, ports, and protocols.
- **Subnet-Level NSGs**: Control traffic flow for all resources within a subnet and can be used to create a **DMZ**.
- **NIC-Level NSGs**: Control traffic flow for specific virtual machines or resources by applying rules to individual NICs.
- **Combined Rules**: If an NSG is applied to both a subnet and a NIC, the rules from both are enforced.

By using NSGs effectively, you can manage and secure network traffic within your Azure virtual network, ensuring that only authorized traffic reaches your resources.