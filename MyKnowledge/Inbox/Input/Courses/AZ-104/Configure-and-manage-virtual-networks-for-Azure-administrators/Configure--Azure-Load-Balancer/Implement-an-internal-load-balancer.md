---
tags: azure cloud devops microsoft internal load balancer
date: 15th-October-2024
---



# Implement an internal load balancer

**Overview:** An **Internal Load Balancer (ILB)** in Azure is used to distribute network traffic within a virtual network (VNet) or between on-premises networks and Azure via a VPN connection. Unlike a public load balancer, an internal load balancer does not expose any front-end IP addresses to the internet, making it ideal for internal applications and databases that should only be accessed privately.

---

### **Key Features of an Internal Load Balancer**:

1. **Private IP Addresses**:
    
    - The load balancer assigns **private IP addresses** to distribute traffic within a VNet or between on-premises and Azure resources via VPN.
    - These IP addresses are **not exposed to the internet**, making the solution secure for internal applications.
2. **Traffic Distribution**:
    
    - The internal load balancer efficiently distributes **internal network traffic** across resources like virtual machines (VMs) or databases.
3. **Load-Balancing Rules**:
    
    - Rules specify **how traffic is routed** between back-end resources.
    - You define parameters such as protocols, port numbers, and back-end resource sets for distribution.
4. **Health Probes**:
    
    - The internal load balancer uses **health probes** to check the status of back-end resources.
    - Unhealthy resources are automatically excluded from the load-balancing pool until they recover.

---

### **Business Scenario: Internal Load Balancer for SQL Database**:

**Scenario**: You have several SQL databases hosted on VMs in an **Azure SQL Database tier subnet**. These VMs are part of a **back-end pool** connected to an **Internal Load Balancer (ILB)**. Database requests from an internal network or on-premises network need to be efficiently routed to these VMs.

1. **Request Handling**:
    
    - **Database requests** are sent to the internal load balancer.
    - The internal load balancer distributes these requests based on **load-balancing rules** to the appropriate **SQL servers** (VMs in the back-end pool).
2. **Port Mapping**:
    
    - The SQL servers handle requests on **port 1433** (the default port for SQL databases).
    - The internal load balancer routes traffic to back-end SQL servers using the correct ports.
3. **Response Handling**:
    
    - SQL servers process the database requests and send responses back to the load balancer, which forwards them to the requestor within the VNet or via VPN to the on-premises network.

![Diagram showing how an internal load balancer works as described in the text.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-load-balancer/media/internal-load-balancer-5ae85589.png)
---

### **Use Cases for Internal Load Balancer**:

1. **Within a Virtual Network**:
    
    - Load balancing between VMs that **reside in the same virtual network (VNet)**.
2. **Cross-Premises Load Balancing**:
    
    - **Load balancing across a hybrid network**, where traffic from on-premises machines is balanced across Azure resources in the same VNet using a VPN.
3. **Multi-Tier Applications**:
    
    - **Back-end load balancing** for multi-tier applications where the back-end components are not exposed to the internet.
    - A typical use case is balancing traffic between the web front-end and back-end databases.
4. **Line-of-Business (LoB) Applications**:
    
    - Used to load balance internal **line-of-business applications** hosted in Azure without the need for additional hardware or software.
    - This scenario often includes on-premises servers as part of the load-balanced traffic.
5. **Combining Public and Internal Load Balancers**:
    
    - You can deploy a **public load balancer** to handle external traffic and route it to an internal load balancer for back-end processing, creating a **multi-tier architecture**.

---

### **Things to Consider When Using an Internal Load Balancer**:

1. **No Internet Exposure**:
    
    - The internal load balancer operates entirely within a VNet or VPN, making it ideal for applications that don’t need internet exposure.
2. **Security and Isolation**:
    
    - By using **private IP addresses**, the internal load balancer ensures secure and isolated communication between resources within the virtual network or between on-premises and Azure.
3. **Health Probes**:
    
    - Like public load balancers, internal load balancers rely on **health probes** to monitor the availability of back-end resources.
    - Unhealthy resources are temporarily excluded from the traffic distribution until they pass the health checks.

---

### **Summary of Internal Load Balancer Use Cases**:

|**Use Case**|**Description**|
|---|---|
|**Within Virtual Network**|Load balance traffic between VMs within the same VNet.|
|**Cross-Premises Load Balancing**|Distribute traffic from on-premises resources to Azure VMs using VPN.|
|**Multi-Tier Applications**|Implement back-end load balancing for multi-tier applications.|
|**Line-of-Business Applications**|Load balance internal business applications without requiring public exposure.|
|**Public + Internal Load Balancers**|Use a public load balancer for internet-facing tiers and an internal load balancer for back-end tiers, creating a secure multi-tier architecture.|

---

### **Conclusion**:

An **Internal Load Balancer** provides a secure way to distribute traffic across resources that are hosted privately in Azure, either within a VNet or accessed via a VPN. It is ideal for **line-of-business applications**, **databases**, and **multi-tier application architectures** that require private network communication without public internet exposure.