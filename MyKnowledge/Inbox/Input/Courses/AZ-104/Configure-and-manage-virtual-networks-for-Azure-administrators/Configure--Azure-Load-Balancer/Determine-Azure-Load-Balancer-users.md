---
tags: azure devops cloud microsoft load balancer users 
date: 15th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Determine Azure Load Balancer users

### **Key Features of Azure Load Balancer**:

1. **High Availability**:
    
    - Ensures applications are always available by distributing traffic across healthy back-end resources.
2. **Scalability**:
    
    - Can scale to handle millions of TCP and UDP application flows.
3. **Inbound and Outbound Load Balancing**:
    
    - Supports balancing both incoming and outgoing traffic.
4. **Public and Internal Load Balancers**:
    
    - **Public Load Balancer**: Routes external internet traffic to your VMs.
    - **Internal Load Balancer**: Balances traffic inside your Azure Virtual Network (VNet).

![Diagram that shows how a load balancer works as described in the text.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-load-balancer/media/load-balancer-4caf947b.png)
---

### **Components of an Azure Load Balancer**:

To implement an Azure Load Balancer, you configure four main components:

1. **Front-End IP Configuration**:
    
    - Defines the **IP address** (either public or private) that the load balancer uses to receive incoming traffic.
    - **Public IP**: Used for traffic from the internet.
    - **Internal IP**: Used for internal services within a virtual network.
2. **Back-End Pools**:
    
    - These are the resources (e.g., VMs, VM Scale Sets) that the load balancer will distribute traffic to.
    - You can have multiple back-end resources in a pool to balance the load efficiently.
3. **Health Probes**:
    
    - Health probes check the **health** of the back-end resources by regularly sending requests to them.
    - If a back-end resource fails a health probe, the load balancer stops sending traffic to that resource until it recovers.
4. **Load-Balancing Rules**:
    
    - Load-balancing rules define **how traffic is distributed** to the back-end resources.
    - You specify conditions such as port numbers, protocol (TCP/UDP), and IP address ranges.

---

### **Types of Load Balancers**:

1. **Public Load Balancer**:
    - Distributes traffic from the **internet** to Azure resources (e.g., VMs).
    - Uses a **public IP address** for handling external traffic.
2. **Internal Load Balancer**:
    - Used for **internal applications** that don’t need public internet access.
    - Routes traffic within an **Azure VNet** using a **private IP address**.

---

### **How Azure Load Balancer Works**:

1. **Front-End IP**:
    
    - External clients send requests to the **front-end IP address** (public or internal), which represents the load balancer.
2. **Health Probes**:
    
    - The load balancer checks the health of back-end resources using **health probes**.
    - If a resource fails, the load balancer will stop directing traffic to it until it passes the health probe again.
3. **Load-Balancing Rules**:
    
    - Based on **load-balancing rules**, the load balancer routes traffic to available, healthy back-end resources in the pool.

---

### **Key Considerations**:

- **Performance**: Azure Load Balancer is designed to handle **millions of connections** with high efficiency.
- **Customization**: Load balancers are customizable, allowing you to define rules and routing behaviors based on your specific requirements.
- **Security**: You can restrict traffic using **Network Security Groups (NSGs)** for further control over inbound and outbound traffic.

---

### **Summary of Components**:

| **Component**                  | **Description**                                                                                     |
| ------------------------------ | --------------------------------------------------------------------------------------------------- |
| **Front-End IP Configuration** | Defines the IP address (public or internal) that the load balancer responds to.                     |
| **Back-End Pools**             | The set of VMs or VM scale sets that receive the traffic distributed by the load balancer.          |
| **Health Probes**              | Check the health of back-end resources. Failed resources stop receiving traffic until they recover. |
| **Load-Balancing Rules**       | Rules that define how traffic should be distributed to the back-end pool.                           |