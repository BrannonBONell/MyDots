---
tags: azure cloud devops microsoft IP addressing network
date: 15th-October-2024
---

# Plan IP Addressing for your networks

**Overview**: When planning an IP address scheme for your Azure virtual network (VNet), it's important to gather requirements about the current and future number of devices, subnets, and network isolation needs. This ensures scalability and avoids having to redesign the network as your company grows.

---

### **Key Considerations for IP Address Planning**:

1. **Current and Future Device Count**:
    
    - **How many devices** are currently on the network?
    - **How many devices** do you expect to add in the future?
    - Reserve **extra IP addresses** to accommodate future growth.
2. **Subnets and Isolation**:
    
    - **How many subnets** are needed to separate different services (e.g., front-end servers, back-end databases)?
    - **How many devices per subnet** are required, now and in the future?
    - Do **all subnets need to be the same size**, or should some be larger for services with more devices?
3. **Service Isolation**:
    
    - Certain services (like back-end databases or sensitive HR data) may need to be **isolated** for security reasons.
    - Azure **subnets** provide this isolation, and further isolation can be achieved using **network security groups (NSGs)**.

---

### **CIDR and IP Address Allocation**:

1. **CIDR (Classless Inter-Domain Routing)**:
    
    - CIDR provides **flexible IP address allocation**. Instead of using fixed-size IP address classes, CIDR allows you to define subnets of varying sizes to match your needs.
    - CIDR notation includes the network address and a **prefix length** that defines how many bits are used for the network (e.g., `192.168.0.0/24`).
2. **Determining Subnets and Hosts**:
    
    - Each subnet in Azure reserves the **first three IP addresses** and **first and last IP** addresses for internal use.
    - To calculate the number of usable addresses per subnet, use the formula:  
        **Usable IP Addresses = (2^n) - 5**  
        Where **n** is the number of **host bits** (bits not used for the network prefix).

---

### **Steps for Gathering Requirements**:

1. **Network Size**:
    
    - Determine the total number of **devices** and future growth.
    - Consider how to **divide the devices** into subnets based on the services they provide (e.g., front-end servers vs. back-end databases).
2. **Subnet Planning**:
    
    - Calculate the number of subnets needed and how many devices each subnet must support.
    - Plan for future subnets by reserving additional IP address blocks.
    - Determine if any subnets need to be **larger** or **smaller** based on expected growth or isolation needs.
3. **Service Isolation**:
    
    - Use **subnets** to isolate services.
    - Add **network security groups** to enforce security rules and further isolate services from each other, such as:
        - Isolating HR data from customer data.
        - Isolating public-facing servers from internal back-end systems.

---

### **Example Calculation**:

- **Example Requirement**:  
    You need to create a subnet that supports **30 devices**.
    
- **CIDR Block**:  
    You can use a CIDR block of **/27** for this subnet:
    
    - **/27** means 32 total addresses.
    - **Usable Addresses**: (2^5) - 5 = 27 usable addresses.
    - This CIDR block provides enough addresses for **30 devices** when planning for overhead (including Azure's reserved addresses).

---

### **Key Formula**:

- **Usable Addresses** = (2^n) - 5  
    Where:
    - **n** = number of host bits (bits left after the network prefix).
    - Azure reserves **5 addresses** per subnet (for internal use and protocol conformance).

---

### **Conclusion**:

By carefully gathering requirements for the number of devices, subnets, and isolating services, you can design a scalable, future-proof IP addressing scheme. CIDR provides flexibility in IP allocation, allowing you to adjust the network size according to your current and future needs.