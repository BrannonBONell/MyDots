---
tags: microsoft azure devops cloud private link uses
date: 15th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Identify private link uses

**Azure Private Link** provides secure, private connectivity from a virtual network to Azure platform-as-a-service (PaaS) resources, customer-owned services, or Microsoft partner services, without using the public internet.

---

### **1. Key Characteristics of Azure Private Link**

- **Private Connectivity**: Keeps all traffic on the **Microsoft global network** with no exposure to the public internet.
- **Global Reach**: Private Link can connect to services in **any Azure region**, with no regional restrictions.
- **Private Endpoints**: Services can be accessed through a **private endpoint** that maps to your virtual network, bringing Azure services into your private network.
- **No Additional Infrastructure**: No need for **gateways**, **NAT devices**, **Azure ExpressRoute**, **VPN connections**, or **public IP addresses**.
- **Service Delivery**: You can privately deliver your own services or access Azure and partner services in customer virtual networks.


![Diagram that shows a network routing configuration with Azure Private Link as described in the text.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-network-routing-endpoints/media/private-links-602b4a62.png)
---

### **2. Key Benefits of Azure Private Link**

#### **1. Private Connectivity to Services**

- **Global Access**: You can connect privately to services across Azure regions while keeping all traffic on the Microsoft network, eliminating the need for public internet access.

#### **2. Integration with On-Premises and Peered Networks**

- **Private Peering**: Access private endpoints through **private peering** or **VPN tunnels** from on-premises networks or peered virtual networks.
- **Simplified Migration**: Microsoft hosts the traffic, so no public peering or public internet connections are required to move workloads to the cloud.

#### **3. Data Exfiltration Protection**

- **Security**: By mapping **private endpoints** to Azure PaaS resources, you can ensure that, during a security incident, only mapped resources are accessible, thus protecting against data exfiltration.

#### **4. Service Delivery to Customer Virtual Networks**

- **Seamless Experience**: Privately consume Azure PaaS, Microsoft partner, or your own services in virtual networks across Azure tenants.
- **Simplified Operations**: Requests can be sent, approved, or rejected directly without needing complex permissions or role-based access controls (RBAC).

---

### **3. Summary of Key Points**

- **Private Connectivity**: Connect to Azure services privately, ensuring all traffic remains on the **Microsoft global network**.
- **Global Service Access**: Connect to services across Azure regions, with no public internet exposure.
- **Data Security**: Protect against data exfiltration by restricting access to mapped resources via private endpoints.
- **Integration**: Easily integrate Private Link with **on-premises networks** or **peered networks** via VPN tunnels or private peering.