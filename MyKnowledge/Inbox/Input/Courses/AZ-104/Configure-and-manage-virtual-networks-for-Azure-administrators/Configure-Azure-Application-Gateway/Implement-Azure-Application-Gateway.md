---
tags: azure cloud devops microsoft application gateway
date: 15th-October-2024
---

# Implement Azure Application Gateway

**Overview:** Azure Application Gateway is a web traffic load balancer that enables you to manage and route incoming traffic to web applications based on various application-level parameters. It operates at the **application layer** (Layer 7) and supports routing, load balancing, and security for HTTP(S) traffic.


![Diagram that illustrates how Azure Application Gateway manages requests from client applications to resources in a back-end pool, as described in the text.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-application-gateway/media/application-gateway-cb3392f4.png)
---

### **Key Benefits of Azure Application Gateway**:

1. **Application Layer Routing**:
    
    - Application Gateway performs **application layer routing**, which directs traffic to a back-end pool based on the URL path of the incoming request.
    - It supports back-end pools that include **Azure VMs**, **Virtual Machine Scale Sets**, **Azure App Service**, and **on-premises servers**.
2. **Round-Robin Load Balancing**:
    
    - **Round-robin load balancing** distributes client requests evenly across multiple servers in the back-end pool.
    - This ensures an **effective balance of server load**, preventing any one server from being overwhelmed.
3. **Session Stickiness** (Affinity):
    
    - **Session stickiness** ensures that requests from the same client in a session are routed to the same back-end server.
    - This is important for maintaining session continuity for applications like shopping carts or user sessions.
4. **Supported Protocols**:
    
    - Azure Application Gateway supports **HTTP**, **HTTPS**, **HTTP/2**, and **WebSocket** protocols, allowing for a wide range of web applications to benefit from its routing and load balancing capabilities.
5. **Web Application Firewall (WAF)**:
    
    - Application Gateway includes an optional **Web Application Firewall (WAF)** to provide protection against web-based vulnerabilities, such as **SQL injection**, **cross-site scripting (XSS)**, and other common threats.
6. **End-to-End Encryption**:
    
    - It supports **end-to-end encryption**, ensuring secure communication between clients and back-end servers.
7. **Autoscaling**:
    
    - Application Gateway can **dynamically scale** based on web traffic, adjusting capacity automatically to handle changing workloads.

---

### **Key Features of Azure Application Gateway**:

1. **Back-End Pool**:
    
    - The **back-end pool** consists of the resources (e.g., VMs, App Services) that will process incoming traffic.
    - Requests are routed to this pool based on the rules defined in the gateway.
2. **Routing Rules**:
    
    - **Routing rules** define how incoming traffic is distributed to the resources in the back-end pool.
    - The rules can be based on URLs, headers, or other parameters at the application layer.
3. **Session Affinity**:
    
    - **Session affinity (stickiness)** ensures that requests from the same client are consistently routed to the same back-end server, maintaining session consistency.
4. **Round-Robin Distribution**:
    
    - Application Gateway uses a **round-robin algorithm** to distribute traffic evenly across the servers in the back-end pool, creating an optimal balance.

---

### **Business Scenario: Web Application with Application Gateway**:

**Scenario**: You have a web application with multiple back-end servers, and you want to efficiently manage incoming traffic. By using **Azure Application Gateway**, you can route HTTP(S) traffic based on the URL of the request and ensure that the traffic is balanced across the servers in the back-end pool.

1. **Handling Incoming Requests**:
    
    - **Client applications** send HTTP(S) requests to the public IP of the application gateway.
    - The gateway processes these requests and routes them to the appropriate back-end server based on the routing rules.
2. **Round-Robin Load Balancing**:
    
    - The gateway distributes requests evenly across the servers in the back-end pool using the **round-robin** method, preventing any server from being overwhelmed.
3. **Session Stickiness**:
    
    - If session stickiness is enabled, subsequent requests from the same client are routed to the same server, ensuring a consistent session experience.
4. **Web Application Firewall (WAF)**:
    
    - To protect the application from common web threats, you can enable **WAF** on the Application Gateway. This adds a layer of security, ensuring protection from vulnerabilities such as **SQL injections** or **cross-site scripting**.

---

### **Key Features Summary**:

|**Feature**|**Description**|
|---|---|
|**Application Layer Routing**|Routes traffic based on **URL paths** and other application-level parameters to resources in the back-end pool.|
|**Round-Robin Load Balancing**|Distributes incoming traffic across multiple servers using the **round-robin** method.|
|**Session Stickiness**|Ensures that requests from the same client are routed to the same server during a session to maintain session state.|
|**Supported Protocols**|Supports **HTTP**, **HTTPS**, **HTTP/2**, and **WebSocket** protocols for web applications.|
|**Web Application Firewall (WAF)**|Provides protection against web-based vulnerabilities like **SQL injection** and **cross-site scripting**.|
|**End-to-End Encryption**|Supports **encryption** for secure communication between clients and back-end resources.|
|**Load Autoscaling**|Automatically scales up or down based on traffic, ensuring optimal performance during traffic spikes or drops.|

---

### **Conclusion**:

Azure Application Gateway provides a robust solution for managing HTTP(S) traffic to web applications, offering features like **application layer routing**, **load balancing**, and **security** with **WAF**. It is an ideal choice for managing traffic to back-end web servers, ensuring session persistence, security, and scalability for modern web applications.