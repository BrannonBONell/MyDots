---
tags: microsoft azure devops cloud service endpoint users
date: 15th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Determine service endpoint users

**Azure Virtual Network Service Endpoints** extend your virtual network's identity to Azure services, allowing secure access to resources without needing public IP addresses. They enable secure, private communication between your virtual network and Azure services.

---

### **1. Key Characteristics of Service Endpoints**

- **Private Communication**: Once service endpoints are enabled, service traffic uses **private IP addresses** from the virtual network, instead of public IPs, when accessing Azure services.
- **Security**: You can use **virtual network rules** to secure Azure services to your virtual network and **remove public internet access** to those resources.
- **Direct Connection**: Traffic to Azure services goes directly from the virtual network to the service via the **Microsoft Azure backbone network**, bypassing the public internet.
- **Easy Configuration**: Service endpoints are configured **at the subnet level** with no need for additional maintenance, NAT, or gateway devices.

---

### **2. Benefits of Using Service Endpoints**

#### **1. Improved Security for Resources**

- **Virtual Network Rules**: You can enhance security by restricting access to Azure services using **virtual network rules**, which allow access only from your virtual network and block public internet access.

#### **2. Optimal Routing for Service Traffic**

- **Forced-Tunneling Bypass**: When you force all internet traffic through on-premises networks or **Network Virtual Appliances (NVAs)** (known as forced-tunneling), service traffic is also routed this way. Service endpoints allow **direct routing** to Azure services, bypassing the forced-tunnel for service traffic.

#### **3. Direct Traffic to Microsoft Network**

- **Stay on Azure Backbone**: Service endpoints ensure that traffic to Azure services stays on the **Azure backbone network**, allowing you to audit and monitor internet traffic separately without affecting service traffic.

#### **4. Easy Configuration and Maintenance**

- **No Public IPs Required**: You no longer need to reserve public IP addresses or configure complex IP firewall rules to secure resources.
- **Low Maintenance**: No NAT or gateway devices are needed, making service endpoints **simple to configure and maintain**.

![Diagram of a virtual machine in a subnet connecting to an Azure service through a service endpoint.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-network-routing-endpoints/media/service-endpoint-addresses-a027197f.png)
---

### **3. Things to Consider**

- **Switch from Public to Private IPs**: When service endpoints are enabled, virtual machine traffic switches from public to private IP addresses. Existing firewall rules that rely on public IPs will stop working unless updated to allow the private IPs.
- **Temporary Service Interruption**: You may experience **temporary interruptions** when configuring service endpoints.

---

### **4. Summary of Key Points**

- **Service Endpoints**: Allow private communication with Azure services using **virtual network private IPs**.
- **Security**: Use **virtual network rules** to restrict service access to your virtual network and eliminate public internet access.
- **Direct Routing**: Service traffic bypasses the public internet and forced-tunneling, staying on the **Azure backbone network**.
- **Easy to Set Up**: Service endpoints are configured at the subnet level with minimal setup and maintenance required.