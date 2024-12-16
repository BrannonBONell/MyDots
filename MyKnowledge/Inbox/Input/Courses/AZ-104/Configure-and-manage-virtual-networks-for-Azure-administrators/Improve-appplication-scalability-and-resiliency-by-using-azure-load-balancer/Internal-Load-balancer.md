---
tags: azure cloud devops microsoft internal load balancer
date: 18th-October-2024
---

# Internal Load Balancer

In your healthcare organization, you want to ensure that the **middle-tier** servers are as scalable and resilient as the front-end servers. You can use an **internal Azure Load Balancer** to distribute traffic from the front-end servers evenly among the middle-tier servers. This way, you can scale out the middle tier for high capacity and ensure traffic is rerouted to healthy servers if a middle-tier server fails.

---

### **1. What is an Internal Load Balancer?**

An **internal load balancer** distributes traffic within a virtual network, without exposing the load balancer's IP address to the internet. It's useful for handling internal traffic between tiers (e.g., web tier to application or database tier).

**Key Features**:

- Only visible within your virtual network.
- Assigns a **private IP address** instead of a public IP.
- Ideal for distributing traffic between services that are protected from external access, such as databases or application servers.

---

### **2. How to Configure an Internal Load Balancer**

To set up an internal load balancer for the healthcare portal scenario:

1. **Create the Load Balancer**:
    
    - Choose **Internal** for the load balancer **Type**.
    - Assign a **private IP address** for the front-end configuration.
    - Place the load balancer inside the protected **virtual network** containing the target virtual machines (VMs).
2. **Configure the Back-End Pool**:
    
    - Include the VMs hosting your middle-tier services (e.g., databases or business logic servers) in the back-end pool.
3. **Set Load-Balancing Rules**:
    
    - Create rules to evenly distribute traffic from the front-end servers to the middle-tier servers.

![Diagram showing internal load balancer.](https://learn.microsoft.com/en-us/training/modules/improve-app-scalability-resiliency-with-load-balancer/media/5-internal-load-balancer.svg)
---

### **3. Distribution Mode**

Since the middle-tier application in the healthcare portal is **stateless**, you can use the default **five-tuple hash** distribution mode. This mode uses five components—source IP, source port, destination IP, destination port, and protocol—to balance traffic, ensuring optimal scalability and resilience.

---

### **4. Example Scenario: Web Tier to Database Tier**

- The **web tier** handles user requests and forwards them to the **database tier**, where data is retrieved.
- The **internal load balancer** is configured to distribute traffic between the two database VMs.
- If one of the database VMs fails, the load balancer automatically routes traffic to the other healthy VM.

---

### **5. Key Benefits of Using an Internal Load Balancer**

- **Scalability**: By distributing traffic evenly across multiple middle-tier servers, you ensure that no single server is overloaded.
- **Resilience**: In case of server failure, the load balancer reroutes traffic to available servers, ensuring high availability.
- **Security**: The internal load balancer keeps traffic internal to the virtual network, improving security by not exposing IPs to the internet.

---

### **Conclusion**

An internal load balancer provides a simple and effective way to ensure scalability and resilience in your healthcare portal by distributing traffic between middle-tier servers. The default **five-tuple hash** distribution mode ensures optimal performance for stateless applications, while a private IP configuration keeps the load balancer secure within the virtual network.