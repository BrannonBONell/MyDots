---
tags: microsoft azure cloud devops user defined routes
date: 15th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Identify user defined route

**User-Defined Routes (UDRs)** allow you to customize the flow of network traffic in Azure by defining specific routes and next hop targets for traffic. This is useful when you need more control over network routing than what system routes provide.

---

### **1. Key Characteristics of User-Defined Routes (UDRs)**

- **Custom Traffic Control**: UDRs allow you to define how traffic flows by specifying a **next hop** for traffic.
    
- **Next Hop Targets**: The next hop for traffic can be one of the following:
    
    - **Virtual Network Gateway**: Direct traffic through a gateway for hybrid network scenarios.
    - **Virtual Network**: Route traffic between subnets or VMs within the same virtual network.
    - **Internet**: Direct traffic to the internet.
    - **Network Virtual Appliance (NVA)**: Direct traffic through an NVA, which could perform firewalling, routing, or optimization.
- **Route Tables**:
    
    - UDRs are recorded in **route tables**, just like system routes.
    - **Multiple subnets** can use the same route table.
    - However, each **subnet can only be associated with one route table** at a time.
- **Cost**: **No additional cost** for creating route tables in Azure.
    

---

### **2. Example Business Scenario for UDRs**

Imagine you have a virtual machine performing as a **Network Virtual Appliance (NVA)**, handling tasks like **firewalling** or **routing**. You want to direct traffic from your subnets through the NVA before it reaches the **internet** or another **subnet**.

#### Solution:

- **UDR 1**: Direct traffic from a **subnet** to the **NVA**, and then to the **internet**.
- **UDR 2**: Use another route to direct traffic from the same subnet to the **back-end subnet** through the **NVA**.

This setup gives you complete control over how traffic moves between subnets or from a subnet to the internet, ensuring that it passes through your custom NVA for processing.

---

### **3. Summary of Key Points**

- **UDRs**: Allow you to define custom routes for network traffic, specifying the **next hop**.
- **Next Hop Targets**: Include **Virtual Network Gateway**, **Virtual Network**, **Internet**, or **NVA**.
- **Route Tables**: UDRs are stored in route tables, and each subnet can be associated with one route table.
- **No Charges**: No cost for creating route tables in Azure.

![Diagram that shows two subnets that use a UDR to access an NVA as described in the text.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-network-routing-endpoints/media/user-defined-routes-2417e693.png)