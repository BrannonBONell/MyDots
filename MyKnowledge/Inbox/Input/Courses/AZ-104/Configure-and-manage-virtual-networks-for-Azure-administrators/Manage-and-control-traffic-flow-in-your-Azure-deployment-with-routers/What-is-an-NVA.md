---
tags: azure cloud devops microsoft deployment NVA
date: 17th-October-2024
---

# What is an NVA?

A **Network Virtual Appliance (NVA)** is a virtual machine that controls the flow of network traffic by managing routing and filtering. Common uses of NVAs include firewalling, load balancing, and traffic inspection. NVAs help secure both virtual machine networking and Azure service networking.

![Diagram of a network architecture with a network virtual appliance.](https://learn.microsoft.com/en-us/training/modules/control-network-traffic-flow-with-routes/media/4-nva.svg)

---

### **1. Purpose and Layers of NVAs**

NVAs typically consist of several layers, such as:

- **Firewall**: Blocks unauthorized access.
- **WAN Optimizer**: Improves traffic performance across wide-area networks.
- **Application-Delivery Controllers**: Manages the flow of application traffic.
- **Routers**: Directs network traffic between different subnets or virtual networks.
- **Load Balancers**: Distributes network traffic across multiple servers.
- **IDS/IPS**: Intrusion detection and prevention systems to monitor and prevent attacks.
- **Proxies**: Intercepts and controls network requests.

NVAs can be selected from **Azure Marketplace** providers such as Cisco, Barracuda, Sophos, Check Point, and more.

---

### **2. Use Case for NVAs**

In a **retail organization scenario**, the NVA is used to:

- Scrutinize all incoming traffic.
- Block unauthorized or malicious traffic.
- Protect key systems by preventing unwanted traffic from reaching critical internal networks.

NVAs help **secure both virtual-machine and Azure-services networking**.

---

### **3. Microsegmentation for Traffic Control**

**Microsegmentation** is a network-security strategy where the virtual network is divided into smaller subnets, each with dedicated roles. This approach:

- Deploys the **firewall** in a dedicated subnet.
- Inspects all traffic routed between subnets using the firewall and NVAs.
- Operates at **OSI Layer 4 (transport layer)** and, for advanced appliances, at **Layer 7 (application layer)**.

Microsegmentation ensures that **all packets are inspected** before being forwarded to their respective subnets.

---

### **4. NVA Configuration in Azure**

- **Routing**: NVAs act as routers, forwarding traffic between subnets. They inspect and filter traffic according to their configuration.
- **Multiple Network Interfaces**: Some NVAs require multiple network interfaces, with one dedicated to management and others for traffic processing.
- **Traffic Routing**: After deployment, the NVA can be configured to **route traffic** through the correct interfaces.

---

### **5. User-Defined Routes (UDRs)**

- **Custom Routes**: In scenarios requiring specific traffic control, **user-defined routes (UDRs)** can override Azure’s default system routes.
- **Next Hop Types**: UDRs can be configured to route traffic to virtual appliances like firewalls or routers.

---

### **6. High Availability of NVAs**

Since NVAs control critical network traffic, ensuring **high availability** is essential to prevent service interruptions. Methods for achieving high availability include:

- **Redundant NVAs**: Deploy multiple NVAs in different availability zones or regions.
- **Load Balancers**: Use load balancers to distribute traffic across multiple NVAs.
- **Failover Mechanisms**: Implement failover strategies to switch traffic to a backup NVA in case of failure.

---

### **7. Key Benefits of Using NVAs in Azure**

- **Enhanced Security**: Filters traffic to block malicious or unwanted requests.
- **Traffic Control**: Routes and inspects traffic between subnets, ensuring only secure traffic reaches internal resources.
- **Custom Routing**: Allows for more granular traffic control by using **user-defined routes**.
- **High Availability**: Critical for ensuring that network traffic continues flowing even if an NVA fails.

---

### **Summary of Key Points**

- **NVAs** are virtual machines that manage network traffic through firewalls, load balancers, and more.
- They enable **fine-grained control** over inbound and outbound traffic, enhancing network security.
- **Microsegmentation** ensures that all traffic is inspected and routed through firewalls.
- **User-defined routes** allow custom traffic control for specific network paths.
- NVAs require **high availability** setups to prevent downtime due to failures.

By deploying NVAs in Azure, organizations can strengthen their network security and improve traffic management.