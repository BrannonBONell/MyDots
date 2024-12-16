---
tags: azure cloud devops microsoft application gateway components
date: 15th-October-2024
---

# Configure Azure Application Gateway components

**Overview**: Azure Application Gateway is a Layer 7 load balancer that routes traffic to your web servers based on application-level criteria. It consists of several key components, including a front-end IP address, listeners, routing rules, back-end pools, health probes, and an optional Web Application Firewall (WAF). These components work together to manage, secure, and distribute incoming traffic efficiently.

---

### **Key Components of Azure Application Gateway**:

1. **Front-End IP Address**:
    
    - The front-end IP address receives **client requests**.
    - Application Gateway can have a **public IP address** (for internet-facing applications) or a **private IP address** (for internal applications).
    - You can configure **one public** and **one private IP address** for an application gateway.
2. **Web Application Firewall (Optional)**:
    
    - **Azure Web Application Firewall (WAF)** protects your web application from common security threats, such as **SQL injection**, **cross-site scripting**, and **HTTP protocol violations**.
    - WAF follows rules from the **OWASP Core Rule Set (CRS)**, which is continuously updated to handle new threats.
    - You can customize the rule sets and control which parts of the request are examined.
3. **Listeners**:
    
    - **Listeners** receive traffic on a specified combination of **protocol (HTTP/HTTPS)**, **port**, **host**, and **IP address**.
    - A listener can be **Basic** (routing based on URL path) or **Multi-site** (routing based on both **hostname** and **path**).
    - Listeners also manage **TLS/SSL certificates** to secure communication between the user and the gateway.
4. **Routing Rules**:
    
    - **Routing rules** bind listeners to back-end pools and define how to interpret the **URL path** and **hostname** to direct requests to the appropriate back-end servers.
    - They include configuration for:
        - **Protocol** (HTTP/HTTPS)
        - **Session stickiness** (affinity)
        - **Connection draining**
        - **Request timeouts**
        - **Health probes**
    - The rules also determine whether traffic between the gateway and the back-end servers should be **encrypted**.
5. **Back-End Pools**:
    
    - A **back-end pool** contains the web servers that process client requests.
    - Back-end servers can include:
        - **Virtual machines (VMs)**
        - **Virtual Machine Scale Sets (VMSS)**
        - **Azure App Services**
        - **On-premises servers**
    - Each back-end pool is associated with a **load balancer** to evenly distribute the incoming requests across the pool.
6. **Health Probes**:
    
    - **Health probes** continuously monitor the back-end servers to check their availability.
    - The probe sends an HTTP request, and if the server responds with a status code between **200 and 399**, it is marked as healthy.
    - If a server doesn’t respond or responds with an error, it is marked as **unhealthy**, and traffic is not routed to it.
    - If not configured manually, the Application Gateway creates a **default probe** with a 30-second timeout.

---

### **Flow of Traffic in Azure Application Gateway**:

![Flowchart that demonstrates how Application Gateway components direct traffic requests between the frontend and back-end pools.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-application-gateway/media/configure-app-gateway-0193dbd6.png)

1. **Client Requests**:
    
    - Clients send requests to the **front-end IP address** of the application gateway.
2. **Firewall Protection (Optional)**:
    
    - If **WAF** is enabled, it checks incoming requests for security threats before they are passed to the listeners.
3. **Listeners**:
    
    - The listener receives the incoming traffic and directs it based on the **routing rules**.
4. **Routing Rules**:
    
    - The routing rules determine the **back-end pool** where the request should be routed, based on the **URL path** or **hostname** in the request.
5. **Back-End Pools**:
    
    - The request is sent to the appropriate **back-end pool**, which consists of servers like **VMs**, **VMSS**, or **Azure App Services**.
6. **Health Probes**:
    
    - Before routing requests, the **health probes** ensure the servers in the back-end pool are healthy and available for traffic.

---

### **Summary of Azure Application Gateway Components**:

|**Component**|**Description**|
|---|---|
|**Front-End IP Address**|Receives client requests; can be public or private IP address.|
|**Web Application Firewall (WAF)**|Optional firewall that checks for common threats such as SQL injection and cross-site scripting.|
|**Listeners**|Accepts traffic on specified protocol, port, and IP; routes traffic to back-end pools based on URL path or hostname.|
|**Routing Rules**|Directs traffic to the appropriate back-end pool based on the URL path or hostname; manages session stickiness, encryption, and other settings.|
|**Back-End Pools**|Contains web servers (e.g., VMs, App Services) that process client requests; a load balancer distributes traffic across the servers in the pool.|
|**Health Probes**|Checks the availability of back-end servers; routes traffic only to healthy servers.|

---

### **Conclusion**:

Azure Application Gateway integrates multiple components to efficiently route traffic, secure applications, and distribute loads across back-end resources. From front-end IP addresses to routing rules and health probes, these components work together to manage incoming requests and ensure application reliability, scalability, and security.