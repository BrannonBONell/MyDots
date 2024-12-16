---
tags: microsoft azure devops cloud public load balancer
date: 15th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Implement a public load balancer

**Overview:** A **Public Load Balancer** in Azure maps public IP addresses and port numbers of incoming traffic to private IP addresses and port numbers of virtual machines (VMs) in your network. It ensures that traffic is distributed evenly across multiple VMs to improve the performance and reliability of applications.

---

### **Key Concepts of Public Load Balancers**:

1. **Traffic Distribution**:
    
    - Public load balancers distribute **incoming traffic** (e.g., web requests) across multiple VMs based on pre-defined **load-balancing rules**.
2. **Public IP Address**:
    
    - A **public IP address** is assigned to the load balancer, allowing external clients to reach the application hosted on VMs.
    - Incoming traffic is routed through this public IP to the back-end resources (VMs).
3. **Private IP Address**:
    
    - The load balancer routes traffic to the VMs that have **private IP addresses**. This allows internal communication while masking the backend infrastructure from direct public exposure.
4. **Port Mapping**:
    
    - Public load balancers map **public ports** (such as port 80 for HTTP) to the corresponding **private ports** on the VMs (also port 80 for HTTP in this case).

---

### **Load-Balancing Rules**:

- **Purpose**: Load-balancing rules specify **how traffic is distributed** across the VMs in the back-end pool.
- **Definition**: Each rule includes the **protocol** (TCP/UDP), **frontend port** (e.g., port 80 for HTTP), **backend port**, and **VMs** to distribute traffic to.
- **Application**: You can use load-balancing rules to manage traffic such as **HTTP requests** across multiple **web servers** to ensure the load is shared evenly.

---

### **Business Scenario: Web Application with Public Load Balancer**:

**Scenario**: A web application is hosted across multiple VMs in a web tier subnet. The VMs are part of a **load-balanced set** using an Azure **Public Load Balancer**.

1. **Incoming Web Traffic**:
    
    - **Internet clients** send web page requests to the **public IP address** of the web app using **TCP port 80** (HTTP).
    - Example: Clients access the website at `http://example.com`.
2. **Traffic Interception by Load Balancer**:
    
    - The **Azure Load Balancer** intercepts the traffic and uses the public IP address and load-balancing rules to distribute the incoming requests across multiple **virtual machines** in the back-end pool.
3. **Traffic Distribution**:
    
    - Based on the defined **load-balancing rules**, the requests are sent to different VMs to **balance the load** and improve performance.
    - Each VM receives a portion of the incoming traffic, reducing the risk of any one server becoming overwhelmed.
4. **Response Handling**:
    
    - The load balancer also ensures that **response traffic** from the VMs to the clients is routed correctly, mapping private IP addresses back to the public IP address.

---

### **Summary of the Web App Load Balancer Scenario**:

|**Component**|**Description**|
|---|---|
|**Public IP Address**|The load balancer’s public-facing IP address that receives incoming traffic from internet clients.|
|**Load-Balancing Rules**|Rules that define how to distribute incoming web traffic across the VMs in the back-end pool (e.g., map public port 80 to private port 80).|
|**Back-End Pool (VMs)**|The group of virtual machines that host the web application and receive traffic from the load balancer.|
|**Traffic Distribution**|Incoming web requests are distributed across multiple VMs, preventing any one server from being overwhelmed and improving performance and reliability.|
|**Health Probes**|Monitors the health of VMs in the back-end pool to ensure that traffic is only sent to healthy instances.|

![Diagram showing how a public load balancer works as described in the text.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-load-balancer/media/public-load-balancer-46d5d9fe.png)