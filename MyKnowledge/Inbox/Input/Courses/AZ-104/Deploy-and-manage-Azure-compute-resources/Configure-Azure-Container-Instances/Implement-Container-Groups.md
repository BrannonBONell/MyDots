---
tags: microsoft azure devops cloud container groups configure
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Implement Container Groups

**Overview:** In Azure Container Instances, the top-level resource is a **container group**, which is a collection of containers that are scheduled on the same host machine. The containers in a container group share resources, networking, storage, and a lifecycle. A container group is similar to a **pod in Kubernetes**.

---

### **Key Characteristics of Container Groups**:

1. **Shared Resources**:
    
    - Containers within a group share **CPU, memory, GPUs, network, and storage**.
    - Azure allocates resources based on the total resource requests from all containers in the group.
2. **Multi-Container Group Example**:
    
    - If two containers each request 1 CPU, Azure allocates **2 CPUs** for the group.
3. **Deployment Options**:
    
    - **ARM Template**: Ideal for deploying containers along with other Azure services like Azure Files.
    - **YAML File**: Recommended for deploying **only container instances** due to its concise format.
4. **External Connectivity**:
    
    - Containers in a group can share a **public IP address, ports, and DNS label** with an FQDN (fully qualified domain name).
    - **Port Mapping**: Not supported, as all containers in the group share a common port namespace.
5. **Storage Volumes**:
    
    - You can mount **Azure Files** file shares as volumes in a container group, allowing containers to share storage.

---

### **Use Cases for Multi-Container Groups**:

1. **Web App Updates**:
    
    - One container serves the web app, while another pulls the latest content from source control. This setup supports **automated updates** for web applications.
2. **Log Data Collection**:
    
    - Use one container for the application and a separate container for **logging and metrics collection**. The logging container writes data to long-term storage.
3. **App Monitoring**:
    
    - A **monitoring container** periodically checks if the application container is responding correctly. It can raise an alert if any issues are detected.
4. **Front-End and Back-End Support**:
    
    - Use one container for the **front-end web app** and another for the **back-end service** to retrieve data, supporting a clear separation of responsibilities within the app.

---

### **Key Considerations**:

- **Flexibility**: Multi-container groups allow you to **divide tasks** across containers. Each container can have different resource requirements.
- **Shared Networking**: Containers in a group share the same IP and port namespace, so external access requires exposing the same port for multiple containers.
- **Resource Allocation**: Azure Container Instances sums up the resource requests of all containers in the group to allocate the necessary compute power.

---

### **Example Configuration**:

![Diagram that depicts an Azure Container Instances multi-container group that has two containers.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-container-instances/media/container-groups-ea19ee6b.png)

- A multi-container group with:
    - **1 public IP address** and a single exposed port.
    - **2 containers**: one listens on port 80 (web server), and the other listens on port 1433 (database server).
    - Both containers use **Azure Files** as volume mounts for persistent storage.