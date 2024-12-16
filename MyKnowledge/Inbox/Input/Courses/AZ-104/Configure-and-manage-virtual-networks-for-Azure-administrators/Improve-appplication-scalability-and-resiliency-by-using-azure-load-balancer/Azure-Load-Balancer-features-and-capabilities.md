---
tags: azure cloud devops microsoft load balancer capabilitites
date: 17th-October-2024
---

# Azure load balancer features and capabilities

**Azure Load Balancer** is a service that distributes traffic across multiple virtual machines or services, ensuring high availability and scalability for your applications. This feature is critical for handling large user demands and maintaining resilience during peak loads or virtual machine failures, making it especially useful for industries like healthcare.

---

### **1. Benefits of Azure Load Balancer**

- **Scalability**: Distributes traffic across multiple virtual machines (VMs) to handle high demand.
- **Resilience**: Reroutes traffic when a virtual machine fails, ensuring uptime.
- **Low Latency and High Throughput**: Supports millions of flows for TCP and UDP applications.
- **Automatic Failover**: Load balancers automatically detect failed VMs and redirect traffic to operational ones.

---

### **2. How Azure Load Balancer Works**

Azure Load Balancer uses a **hash-based distribution algorithm**, specifically a five-tuple hash, which includes:

- **Source IP**
- **Source port**
- **Destination IP**
- **Destination port**
- **Protocol type (TCP/UDP)**

This allows the load balancer to distribute traffic efficiently across available VMs.

![Diagram showing an overview of availability zones in Azure.](https://learn.microsoft.com/en-us/training/modules/improve-app-scalability-resiliency-with-load-balancer/media/2-az-graphic-two.svg)
---

### **3. Availability Features**

Azure Load Balancer enhances availability by working with the following features:

- **Availability Sets**:
![Diagram showing an overview of availability sets in Azure.](https://learn.microsoft.com/en-us/training/modules/improve-app-scalability-resiliency-with-load-balancer/media/2-availability-sets.svg)
    - Ensures VMs are distributed across multiple physical servers to avoid hardware or software failures.
    - **SLA**: 99.95% uptime.
- **Availability Zones**:
![Diagram showing an overview of availability zones in Azure.](https://learn.microsoft.com/en-us/training/modules/improve-app-scalability-resiliency-with-load-balancer/media/2-az-graphic-two.svg)
    - Distributes VMs across datacenters within a region, providing protection from entire datacenter failures.
    - **SLA**: 99.99% uptime.

---

### **4. Load Balancer Types**

- **Basic Load Balancer**:
    
    - Port forwarding
    - Health probes
    - SNAT (Source Network Address Translation) for outbound connections
    - Supports only **one availability set** or **one scale set**.
- **Standard Load Balancer** (supports all basic features, plus):
    
    - **HTTPS health probes**
    - **Availability zones**
    - **Diagnostics via Azure Monitor**
    - **High availability (HA) ports**
    - **Outbound rules**
    - **99.99% SLA** for two or more VMs
    - Works for both **internal** and **external load balancing**.

---

### **5. External vs. Internal Load Balancer**

- **External Load Balancer**:
    
    - Handles **internet-facing traffic** from browsers, mobile apps, etc.
    - Example: Distributes load of client healthcare applications among VMs.
- **Internal Load Balancer**:
    
    - Distributes traffic **within Azure** (e.g., between front-end and back-end servers).
    - Example: Distributes traffic across the internal application tier in a healthcare system.

---

### **6. Choosing the Right Load Balancer**

- **Basic Load Balancer**: Suitable for simpler, small-scale scenarios with fewer VMs and availability requirements.
- **Standard Load Balancer**: Ideal for high-demand, large-scale, and mission-critical applications, with advanced monitoring, zone redundancy, and a guaranteed SLA.

---

### **Summary of Key Points**

- **Azure Load Balancer** ensures high availability and scalability by distributing traffic across VMs.
- It works with **availability sets** and **availability zones** to provide fault tolerance.
- There are two types of load balancers—**basic** and **standard**—with the standard offering more features and a higher SLA.
- **External load balancers** manage internet-facing traffic, while **internal load balancers** handle internal Azure traffic.

Azure Load Balancer is a vital tool for any organization that needs to ensure continuous and scalable services, such as in healthcare systems.