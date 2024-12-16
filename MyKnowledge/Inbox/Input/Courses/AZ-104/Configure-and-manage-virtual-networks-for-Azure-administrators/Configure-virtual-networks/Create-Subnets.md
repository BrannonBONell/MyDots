---
tags: microsoft azure devops cloud subnets virtual network
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Create subnets

**Subnets** are a fundamental feature of Azure Virtual Networks (VNets) that allow you to segment and organize your network, improving security, performance, and manageability. By dividing a virtual network into subnets, you can create distinct environments for different types of resources, applying network controls and configurations tailored to each subnet's needs.

![Screenshot that shows multiple subnets for a virtual network in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-virtual-networks/media/azure-subnets-a5c893d5.png)
---

### **1. What Are Subnets?**

A **subnet** is a range of IP addresses within a virtual network that allows you to logically divide the network into smaller, more manageable segments. Subnetting helps improve network performance, manageability, and security by isolating different workloads and controlling traffic flow between segments.

#### **Key Characteristics of Subnets**:

- **IP Address Range**: Each subnet contains a range of IP addresses that falls within the virtual network’s overall address space.
- **Unique IP Range**: The IP address range for each subnet must be **unique** within the virtual network and cannot overlap with other subnets in the same VNet.
- **CIDR Notation**: The IP address range for each subnet is specified using **Classless Inter-Domain Routing (CIDR)** notation (e.g., 192.168.1.0/24).
- **Segmentation**: You can segment a virtual network into one or more subnets using the **Azure portal** or other Azure management tools.

---

### **2. Reserved IP Addresses in Subnets**

Azure reserves **five IP addresses** in each subnet for specific purposes. These addresses cannot be used by resources in the subnet.

#### **Reserved Addresses Example** (for IP range 192.168.1.0/24):

|**Reserved Address**|**Purpose**|
|---|---|
|**192.168.1.0**|Identifies the virtual network address.|
|**192.168.1.1**|Used by Azure as the **default gateway** for the subnet.|
|**192.168.1.2 & 192.168.1.3**|Mapped to **Azure DNS** for the virtual network.|
|**192.168.1.255**|Acts as the **broadcast address** for the network.|

---

### **3. Considerations When Using Subnets**

When planning and configuring subnets in Azure, it’s important to account for specific service requirements, routing, and network security features. Here are some key factors to consider:

#### **1. Service Requirements**

- **Routing and Traffic Needs**: Each service deployed into a VNet may have specific requirements regarding routing, traffic control, or subnet segmentation.
- **Dedicated Subnets**: Some Azure services, like **Azure VPN Gateway**, require their own dedicated subnet. Ensure that you have **enough unallocated IP address space** to meet these requirements.
- **Example**: When connecting your VNet to an on-premises network via a **VPN Gateway**, you must allocate a dedicated subnet specifically for the gateway.

#### **2. Network Virtual Appliances (NVA)**

- **Default Routing**: By default, Azure routes network traffic between subnets in the same virtual network.
- **Custom Routing**: If you need to route traffic through a **network virtual appliance** (such as a firewall or load balancer), you can override Azure’s default routing. For this, deploy resources into **different subnets** to ensure traffic passes through the appliance.
- **Use Case**: This is useful for scenarios where security policies require that traffic between different application tiers or resources must be inspected by a virtual appliance.

#### **3. Service Endpoints**

- **Securing Azure Resources**: **Service endpoints** allow you to limit access to specific Azure resources (e.g., **Azure Storage**, **Azure SQL Database**) from selected subnets. This restricts access to Azure services to traffic originating from a specific subnet and denies public internet access to these resources.
- **Use Case**: You might have multiple subnets in your network but want to enable a service endpoint for certain subnets while blocking others to protect critical resources.

#### **4. Network Security Groups (NSGs)**

- **Traffic Control**: An **NSG** is used to control the flow of network traffic to and from a subnet or individual virtual machines. Each subnet can be associated with **zero or one NSG**.
- **Custom Rules**: An NSG contains custom security rules that define which traffic is allowed or denied based on IP address ranges, ports, and protocols.
- **Flexibility**: You can assign the same NSG to multiple subnets or create a different NSG for each subnet, depending on your security requirements.
- **Use Case**: For example, you could block all inbound internet traffic to a database subnet while allowing traffic from the application subnet.

#### **5. Private Links**

- **Private Connectivity**: **Azure Private Link** provides secure private connectivity from a virtual network to Azure services, such as **Azure SQL**, **Azure Storage**, or services from Microsoft partners. This connection is private, avoiding data exposure to the public internet.
- **Simplified Architecture**: Using **Private Link** simplifies the network architecture by allowing resources to communicate privately within Azure, enhancing security.

---

### **4. Use Cases for Subnets in Virtual Networks**

#### **1. Creating a Private Cloud-Only Network**

- **Description**: Create a private network where VMs and services communicate securely without requiring an internet connection.
- **Use Case**: Suitable for workloads that don’t need on-premises or cross-premises communication but need secure internal networking.

#### **2. Extending On-Premises Networks**

- **Description**: By creating a **site-to-site VPN** or **ExpressRoute connection**, you can securely extend your on-premises network to Azure, integrating Azure resources into your existing infrastructure.
- **Use Case**: For businesses that want to scale their on-premises infrastructure into Azure while maintaining secure communication between the two environments.

#### **3. Hybrid Cloud Solutions**

- **Description**: Use subnets to support **hybrid cloud** scenarios, where cloud applications securely communicate with on-premises systems (e.g., mainframes, Unix systems).
- **Use Case**: Ideal for companies needing to connect legacy systems or specialized on-premises resources with modern cloud applications.

---

### **5. Summary of Key Points**

- **Subnets** allow you to logically segment a virtual network to manage traffic, improve security, and optimize performance.
- **IP Address Allocation**: Each subnet has a unique range of IP addresses defined using **CIDR notation**, and **Azure reserves five IP addresses** within each subnet for system use.
- **Service Requirements**: Ensure you leave enough address space for services that require dedicated subnets, like **Azure VPN Gateway**.
- **Custom Routing**: Use **Network Virtual Appliances (NVA)** and custom routing if you need to control traffic between subnets.
- **Service Endpoints**: Restrict access to specific Azure services from selected subnets while blocking public internet access.
- **Network Security Groups (NSGs)**: Use NSGs to define custom security rules that control traffic to and from subnets, ensuring your network remains secure.
- **Private Link**: Leverage **Private Link** for secure, private connectivity to Azure services without exposing your data to the internet.

---

By implementing **Azure subnets**, you gain better control over your virtual network, ensuring that resources are properly segmented, secured, and optimized for performance. Whether you need private communication within the cloud, secure integration with on-premises networks, or enhanced access control to Azure services, subnets are a key feature to manage these tasks effectively.