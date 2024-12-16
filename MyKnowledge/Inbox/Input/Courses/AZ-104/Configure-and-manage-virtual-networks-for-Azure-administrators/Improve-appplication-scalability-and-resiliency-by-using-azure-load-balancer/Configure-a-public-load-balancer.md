---
tags: azure cloud devops microsoft configure public load balancer
date: 17th-October-2024
---

# Configure a public load balancer


As a solution architect, your task is to set up a **public load balancer** to distribute traffic from client browsers to the virtual machines (VMs) in your web farm. Here's how to configure the load balancer to ensure the proper distribution of user requests.

---

### **1. Load Balancer Overview**

A **public load balancer** maps incoming traffic from the public IP address and port to the private IP address and port of a VM in the back-end pool. The load balancer returns responses to the client. You can configure rules to distribute traffic across multiple VMs or services.

---

### **2. Traffic Distribution Modes**

Azure Load Balancer offers several modes for distributing traffic:

- **Five-Tuple Hash (Default)**: The load balancer uses five components to determine traffic routing: source IP, source port, destination IP, destination port, and protocol type. This method may route client sessions to different VMs for each new session.
![Diagram showing how hash-based distribution works.](https://learn.microsoft.com/en-us/training/modules/improve-app-scalability-resiliency-with-load-balancer/media/3-load-balancer-distribution.svg)
    - **Use case**: General web applications with no dependency on session persistence.
- **Source IP Affinity (Session Affinity)**: Also called **client IP affinity**, this mode uses a two-tuple hash (source IP + destination IP) or three-tuple hash (source IP + destination IP + protocol type) to ensure requests from the same client are routed to the same VM, maintaining session consistency.
- ![Diagram showing how session affinity works.](https://learn.microsoft.com/en-us/training/modules/improve-app-scalability-resiliency-with-load-balancer/media/3-load-balancer-session-affinity.svg)
    - **Use case**: Applications requiring session persistence, such as those using in-memory session storage (like the healthcare portal's profile data).

---

### **3. Choosing the Right Distribution Mode**

In the healthcare portal scenario, where users' session data (like profiles) are stored in-memory on the VM, **source IP affinity** is required to maintain session persistence. This ensures that users are consistently routed to the same VM throughout their session.

#### How to Set Source IP Affinity:

- **Using PowerShell**:
    
    powershell
    
    Copy code
    
    `$lb = Get-AzLoadBalancer -Name MyLb -ResourceGroupName MyResourceGroup $lb.LoadBalancingRules[0].LoadDistribution = 'sourceIp' Set-AzLoadBalancer -LoadBalancer $lb`

![Screenshot showing how to select a load balancing rule in the Azure portal.](https://learn.microsoft.com/en-us/training/modules/improve-app-scalability-resiliency-with-load-balancer/media/3-load-balancer-rules.png)
- **Through Azure Portal**:
    
    1. Navigate to the Load Balancer resource.
    2. Select **Load balancing rules** under **Settings**.
    3. Choose the relevant load balancing rule.
    4. Set **Session persistence** to **Client IP**.
![Screenshot showing how to set IP affinity in the Azure portal.](https://learn.microsoft.com/en-us/training/modules/improve-app-scalability-resiliency-with-load-balancer/media/3-screenshot-session-persistence.png)
---

### **4. Load Balancer Use Cases**

- **Remote Desktop Gateway**: The default **five-tuple hash** is incompatible with Remote Desktop Gateway services. Use **source IP affinity** to ensure the same IP is routed to the same VM for each client session.
    
- **Media Upload**: During media upload, a client establishes a session via **TCP** for progress monitoring, while the file is uploaded over **UDP**. Using **five-tuple hash** could route TCP and UDP connections to different VMs, causing the upload to fail. Resolve this by configuring **source IP affinity** to ensure both connections go to the same VM.
    

---

### **5. Key Takeaways**

- **Five-tuple hash** is best for general applications that don’t require session persistence.
- **Source IP affinity** ensures clients are consistently routed to the same VM, making it ideal for applications with in-memory sessions or persistent connections like Remote Desktop or media uploads.
- Configure session persistence in the **Azure portal** or **PowerShell** to suit your application's requirements.

Azure Load Balancer is essential for creating a scalable, high-availability web farm to handle large user demand, while maintaining session consistency where needed.