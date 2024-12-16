---
tags: azure cloud devops microsoft load balancer rules create
date: 15th-October-2024
---

# Create load balancer rules

**Overview:** Load-balancing rules define how Azure Load Balancer distributes network traffic across a set of back-end resources, such as virtual machines (VMs). The rule maps a front-end IP address and port combination to a corresponding set of back-end IP address and port combinations.

![Screenshot that shows how to create load-balancing rules in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-load-balancer/media/add-load-balancer-rules-f4d9b188.png)
---

### **Key Components for Load-Balancing Rules**:

To create a load-balancing rule, you need the following components:

1. **Front-End**: The public or internal IP address that receives the incoming traffic.
2. **Back-End Pool**: The group of virtual machines (VMs) or instances to which the traffic will be distributed.
3. **Health Probe**: Monitors the health of back-end resources and ensures that traffic is only sent to healthy instances.

---

### **Settings for Configuring Load-Balancing Rules**:

When creating a load-balancing rule in the Azure portal, you will configure the following:

1. **IP Version**:
    
    - Choose between **IPv4** or **IPv6** for the traffic routing.
2. **Front-End IP Address**:
    
    - The IP address of the load balancer that receives traffic from clients.
    - **Port**: Specify the front-end port that the load balancer listens to (e.g., port 80 for HTTP traffic).
    - **Protocol**: Select **TCP** or **UDP** depending on the type of traffic.
3. **Back-End Pool**:
    
    - Define the set of **back-end resources (VMs)** to which the load balancer will distribute traffic.
    - **Back-End Port**: Specify the port on the back-end resources that the load balancer will forward traffic to (e.g., port 80 for web servers).
4. **Health Probe**:
    
    - Assign a health probe to the rule to monitor the health of VMs in the back-end pool.
    - The load balancer only sends traffic to VMs that pass the health check.
5. **Session Persistence**:
    
    - Defines how to handle traffic from a client. This is important for applications requiring consistent session behavior (e.g., shopping carts).
    - **Options**:
        - **None** (default): Traffic is distributed to any VM in the pool.
        - **Client IP**: Traffic from the same client IP address is always routed to the same VM.
        - **Client IP and Protocol**: Traffic from the same client IP address and protocol combination is routed to the same VM.

---

### **Azure Load Balancer Hashing Algorithm (Five-Tuple Hash)**:

Azure Load Balancer uses a **five-tuple hash** to map incoming traffic to available back-end resources. The tuple consists of:

1. **Source IP address**
2. **Source port**
3. **Destination IP address**
4. **Destination port**
5. **Protocol type** (TCP/UDP)

The hash ensures that traffic from different clients or sessions is spread evenly across multiple VMs. However, stickiness is only maintained within a single transport session.

---

### **Session Persistence**:

- **None (Default)**: Traffic from the same client may be distributed to different VMs in the back-end pool.
- **Client IP**: Successive requests from the same client IP are directed to the **same VM**.
- **Client IP and Protocol**: Successive requests from the same **client IP and protocol** combination are directed to the same VM.

**Use Cases for Session Persistence**:

- **E-commerce applications** (e.g., shopping carts): Consistent routing to the same VM ensures that session-specific data (like cart contents) is preserved.
- **Streaming applications**: Ensures that streaming sessions continue without interruption.

---

### **Combining Load-Balancing Rules and NAT Rules**:

- **NAT (Network Address Translation)**: Allows external clients to connect to specific VMs in the back-end pool by mapping the load balancer's public IP address to a private IP address and port on the VM.
- **Example**: You can use NAT rules to enable **Remote Desktop (RDP)** access to a specific VM by mapping the load balancer’s public IP and port 3389 to the internal IP of the VM. By combining NAT and load-balancing rules, you enable seamless access to VMs for administration purposes.

---

### **Summary of Load-Balancing Rules**:

|**Component**|**Description**|
|---|---|
|**IP Version**|Choose between **IPv4** or **IPv6** for routing.|
|**Front-End IP and Port**|Defines the public or internal IP and port combination that receives incoming traffic.|
|**Back-End Pool**|The set of virtual machines or services that receive traffic from the load balancer.|
|**Back-End Port**|The port on the VMs or services that receives traffic from the load balancer.|
|**Health Probe**|Monitors the health of back-end resources and ensures that only healthy instances receive traffic.|
|**Session Persistence**|Controls how traffic from the same client is routed to the same VM. Options: **None**, **Client IP**, **Client IP and Protocol**.|
|**Five-Tuple Hash**|The load balancer uses the five-tuple hash (source/destination IP, source/destination port, protocol) to map traffic to available back-end VMs.|

---

### **Conclusion**:

Azure Load Balancer’s **load-balancing rules** are essential for distributing traffic efficiently across multiple back-end resources, such as virtual machines. By configuring the appropriate IP addresses, ports, health probes, and session persistence settings, you can ensure that traffic is routed reliably and securely.