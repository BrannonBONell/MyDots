---
tags: microsoft azure devops cloud container instances configure
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Azure Container Instances

**Overview:** Azure Container Instances (ACI) is the fastest and simplest way to run containers in Azure without needing to manage virtual machines or adopt higher-level orchestration services. ACI is ideal for scenarios where containers can operate in isolation, such as simple applications, task automation, and build jobs.

![Diagram that shows a web server container running on a virtual machine in a virtual network.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-container-instances/media/container-overview-0e72c2ba.png)
---

### **Benefits of Azure Container Instances**:

1. **Fast Startup Times**:
    
    - Containers can start within seconds, without the need to provision or manage virtual machines.
2. **Public IP Connectivity & DNS Names**:
    
    - Containers can be directly exposed to the internet with a **public IP address** and **FQDN** (fully qualified domain name), making them easily accessible.
3. **Custom Sizes**:
    
    - **Container nodes** can be dynamically scaled to match your application’s resource demands, allowing flexibility based on workload needs.
4. **Persistent Storage**:
    
    - Containers can directly **mount Azure Files** file shares to support persistent storage needs.
5. **Linux and Windows Support**:
    
    - ACI supports both **Windows** and **Linux** containers. You specify the operating system type when creating your container group.
6. **Coscheduled Groups**:
    
    - ACI allows you to schedule **multi-container groups** that share the same host machine resources, enabling containers to work together as a unit.
7. **Virtual Network Deployment**:
    
    - ACI can be deployed into an **Azure virtual network**, allowing containers to connect securely to other Azure services or on-premises networks.

---

### **Key Use Cases for ACI**:

- **Simple applications**: Run lightweight applications quickly and efficiently.
- **Task automation**: Automate background tasks, jobs, or batch processing.
- **Build jobs**: Use containers for isolated build processes without the overhead of managing infrastructure.

---

### **Summary of Features**:

- **Fast start**: Containers start in seconds.
- **Public connectivity**: Access containers via public IP or FQDN.
- **Custom scaling**: Dynamically adjust container size and resources.
- **Persistent storage**: Mount Azure Files for long-term data storage.
- **Windows and Linux**: Support for both OS types.
- **Container groups**: Schedule multiple containers to run together.
- **Virtual network**: Integrate with Azure VNet for secure networking.

These notes summarize the key features of Azure Container Instances, offering a quick and easy way to run containers in the cloud without managing complex infrastructure.
