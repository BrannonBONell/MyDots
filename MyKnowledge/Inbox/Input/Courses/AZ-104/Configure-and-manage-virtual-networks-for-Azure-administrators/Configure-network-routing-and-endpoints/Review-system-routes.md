---
tags: microsoft azure cloud devops system routes
date: 15th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Review system routes

**Azure System Routes** are used to control network traffic for **virtual machines (VMs)**, **subnets**, and **external resources**. The system routes are recorded in **route tables**, which define how packets are routed in a virtual network.

---

### **1. Key Points About Azure System Routes**

- **System Routes Control Traffic**:
    
    - **Traffic within the same subnet**: Routes handle communication between VMs in the same subnet.
    - **Traffic between subnets**: Routes control communication between VMs in different subnets in the same virtual network.
    - **Traffic to the internet**: System routes direct packets from VMs to the internet.
- **Route Table**:
    
    - A **route table** is a set of rules that specify how packets are routed within a virtual network.
    - Each **subnet** is associated with a route table.
    - Each packet leaving a subnet is routed according to the **rules** in the associated route table.
- **Routing Destinations**:
    
    - A packet’s **destination** can be an IP address, a **virtual network gateway**, a **virtual appliance**, or the **internet**.
    - If no matching route is found, the packet is **dropped**.

---

### **2. Example Business Scenario**

Consider a virtual network with **two subnets**:

- **Front-End Subnet**:
    - Uses a system route to access the **internet**.
- **Back-End Subnet**:
    - Uses a system route to access the **front-end subnet**.

Both subnets use **system routes** recorded in a route table to handle the traffic. For example, packets from the front-end subnet destined for the internet or packets from the back-end subnet destined for the front-end subnet will be routed based on the **route table**.

---

### **3. Summary of Key Points**

- **System Routes**: Automatically control traffic between subnets, within the same subnet, and to the internet.
- **Route Tables**: Define routing rules for each subnet.
- **Routing**: Packets are routed based on their destination (IP address, virtual network gateway, etc.).
- **No Matching Route**: If no route matches, the packet is dropped.

![Diagram that shows two subnets that use system routes as described in the text.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-network-routing-endpoints/media/system-routes-08992506.png)