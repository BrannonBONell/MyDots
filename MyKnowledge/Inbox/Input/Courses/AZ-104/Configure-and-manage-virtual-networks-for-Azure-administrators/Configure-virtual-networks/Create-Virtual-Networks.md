---
tags: azure microsoft devops cloud create virtual networks
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Create Virtual Networks

An **Azure Virtual Network (VNet)** is a fundamental building block for your cloud infrastructure, allowing you to securely connect Azure resources to each other, the internet, and on-premises networks. Here’s a detailed guide on what you need to know about creating virtual networks in Azure.

---

### **1. Requirements for Creating a Virtual Network (VNet)**

When you create a VNet in Azure, you need to consider several important factors, including **IP address planning**, **subnet configuration**, and **network design**. Here’s what you need to know:

#### **1.1 Define the IP Address Space**

- **IP Address Space**: The first step in creating a VNet is to define the **IP address space** that will be used by the network. This address space should be unique and must not conflict with any existing address spaces in your organization.
    
    - **Example**: If your organization already uses the IP range **192.168.1.0/24**, do not use this range for your virtual network to avoid IP conflicts.
- **CIDR Notation**: The IP address space is specified using **Classless Inter-Domain Routing (CIDR)** notation (e.g., **10.0.0.0/16**).
    
- **Important**: Once you create the IP address space for a VNet, it **cannot be changed**. If you plan to connect this VNet to an on-premises network later (i.e., hybrid cloud), ensure the IP ranges do not overlap.
    

#### **1.2 Avoid Overlapping IP Ranges**

- **Address Uniqueness**: The IP address space for your virtual network must be distinct from any other networks you plan to connect, whether they are in the cloud or on-premises. Overlapping address spaces will cause routing issues and conflicts.
    - **Cloud-Only**: If your VNet is cloud-only (not connected to on-premises infrastructure), the address space can be unique to the cloud.
    - **Hybrid Networks**: For hybrid networks, plan carefully to ensure your cloud and on-premises IP ranges do not overlap.

#### **1.3 Subnets**

- **Subnets**: After defining the VNet's IP address space, you need to create **at least one subnet**. Each subnet is a smaller segment of the VNet, with its own range of IP addresses.
    - **Unique IP Ranges**: Each subnet must have a **unique IP address range** that does not overlap with other subnets in the same VNet.
    - **CIDR Notation for Subnets**: Subnet ranges are also defined using CIDR notation (e.g., **10.0.1.0/24** for one subnet, **10.0.2.0/24** for another).

#### **1.4 Defining Subnets**

- **Multiple Subnets**: You can define multiple subnets within a single VNet to segment different types of workloads or services. For example:
    - A **web tier** in one subnet (e.g., **10.0.1.0/24**).
    - A **database tier** in another subnet (e.g., **10.0.2.0/24**).

---

### **2. Steps to Create a Virtual Network in the Azure Portal**

To create a VNet, follow these steps in the **Azure Portal**:

#### **2.1 Basic Information**

- **Subscription**: Select the Azure subscription where the VNet will be created.
- **Resource Group**: Choose an existing resource group or create a new one to organize your resources.
- **Name**: Provide a unique name for your VNet.
- **Region**: Select the **Azure region** where the VNet will be deployed (e.g., East US, West Europe).

#### **2.2 IP Address Configuration**

- **IP Address Space**: Define the address space for your VNet using **CIDR notation** (e.g., **10.0.0.0/16**). Ensure that this range doesn’t overlap with other networks, especially if you plan to implement a hybrid cloud solution later.

#### **2.3 Subnet Configuration**

- **Create Subnets**: Define at least one subnet within the virtual network. Each subnet should have a **unique IP range** within the overall VNet address space.
    - Example:
        - VNet address space: **10.0.0.0/16**.
        - Subnet 1 (Web): **10.0.1.0/24**.
        - Subnet 2 (Database): **10.0.2.0/24**.

![Screenshot that shows how to create a virtual network in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-virtual-networks/media/create-virtual-networks-b4f1fd40.png)
---

### **3. Things to Consider When Creating a Virtual Network**

#### **3.1 Default IP Reservations**

- **Reserved IP Addresses**: Azure reserves five IP addresses in each subnet for specific purposes:
    - **First address** (e.g., **10.0.1.0**): Identifies the network itself.
    - **Second address** (e.g., **10.0.1.1**): Used as the **default gateway** for the subnet.
    - **Third and fourth addresses**: Reserved for **Azure DNS** services.
    - **Last address** (e.g., **10.0.1.255**): Used as the **broadcast address** for the subnet.

#### **3.2 Network Design Considerations**

- **Future Proofing**: Plan your IP address space with future growth in mind. If you may want to connect the VNet to on-premises systems, ensure the address space is flexible and does not overlap with your corporate network.
    
- **Subnet Segmentation**: Use subnets to logically segment workloads. For example, you can place different layers of your application (e.g., web servers, application servers, databases) into separate subnets for better security and management.
    

#### **3.3 Resource Limits**

- **Azure Resource Limits**: Be aware that there are default limits for networking resources in Azure, such as the number of VNets, subnets, or network interfaces you can create. These limits can change, so always consult **Azure documentation** for the latest information on networking limits.

---

### **4. Advanced Features in Virtual Networks**

As you design and configure your virtual networks, Azure offers several advanced features that enhance the functionality and security of your VNets:

#### **4.1 Network Security Groups (NSGs)**

- **Traffic Control**: NSGs allow you to control traffic flow in and out of a subnet or virtual machine by defining security rules that allow or deny specific types of traffic based on source/destination IP, ports, and protocols.

#### **4.2 Virtual Network Peering**

- **VNet Peering**: Connect multiple VNets together within the same region or across different regions to allow them to communicate as if they were part of the same network. VNet peering helps avoid the need for a VPN gateway.

#### **4.3 VPN Gateway**

- **Hybrid Connectivity**: Create a secure **site-to-site VPN** connection between your on-premises network and an Azure VNet using the **Azure VPN Gateway**. This enables secure communication between cloud resources and on-premises systems.

#### **4.4 ExpressRoute**

- **Private Connectivity**: For enterprises needing higher bandwidth, lower latency, and more reliability, **Azure ExpressRoute** provides private connections between Azure data centers and on-premises networks, bypassing the public internet.

---

### **5. Summary of Key Points**

- **IP Address Space**: When creating a VNet, define a unique IP address space using CIDR notation. Ensure there’s no overlap with existing networks.
- **Subnets**: Divide the VNet into **subnets**, each with its own unique IP range. Subnets help organize and segment resources for better security and manageability.
- **Reserved IPs**: Azure reserves five IP addresses in each subnet for system use, such as the gateway, DNS services, and broadcast address.
- **Advanced Features**: Leverage tools like **Network Security Groups**, **VNet Peering**, and **VPN Gateway** for enhanced security, flexibility, and connectivity.
- **Resource Limits**: Stay aware of Azure’s networking resource limits and always refer to the latest Azure documentation for updated limits.

By following these best practices and considerations, you can design and implement robust and scalable virtual networks in Azure that meet your organization’s current and future needs.