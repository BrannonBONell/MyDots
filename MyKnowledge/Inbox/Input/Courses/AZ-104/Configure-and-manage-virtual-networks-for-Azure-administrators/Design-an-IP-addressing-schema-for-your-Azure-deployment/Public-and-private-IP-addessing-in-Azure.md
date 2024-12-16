---
tags: azure cloud devops microsoft public private ip addressing
date: 15th-October-2024
---

# Public and private IP addressing in Azure

In Azure, you can use **public** and **private IP addresses** to manage communication with your resources. Public IP addresses enable communication with the internet, while private IP addresses allow communication within Azure and on-premises networks.

---

### **IP Address Types in Azure**:

1. **Public IP Addresses**:
    - **Purpose**: Used for **public-facing services** like web servers, load balancers, VPN gateways, or application gateways.
    - **Allocation Methods**:
        - **Dynamic**: IP address can change throughout the resource's lifecycle (assigned when a VM is started, released when stopped).
        - **Static**: IP address remains constant throughout the resource's lifecycle (assigned upon creation).
2. **Private IP Addresses**:
    - **Purpose**: Used for **internal communication** between resources in a Virtual Network (VNet) and between Azure and on-premises resources.
    - **Allocation Methods**:
        - **Dynamic (DHCP Lease)**: IP addresses may change over time.
        - **Static (DHCP Reservation)**: IP addresses remain the same throughout the resource's lifecycle.

---

### **Public IP Address SKUs**:

1. **Basic SKU**:
    - Supports **dynamic or static** IP allocation.
    - IPs are **open** by default (network security groups (NSGs) recommended but not required).
    - **Inbound-only** traffic.
    - No support for **Availability Zones** or **routing preferences**.
2. **Standard SKU**:
    - **Static IP** only.
    - IPs are **secure and closed** to inbound traffic by default (NSGs required for inbound traffic).
    - Supports **Availability Zones** (zone-redundant or zonal) and **routing preferences**.
    - Can be used with **cross-region load balancers**.

---

### **Public IP Address Prefix**:

- A **range of static public IP addresses** reserved for your Azure resources.
- **Benefits**: Enables easier firewall rule configuration for known IP ranges.
- Each region has a **unique pool** of IP addresses, and public IP address prefixes can be **zone-redundant**.
- You can’t choose specific IPs within the prefix; Azure assigns them from the pool.

---

### **Private IP Addressing for Azure Virtual Networks**:

- **Private IP Ranges**: Use **non-routable** IP ranges reserved by IANA:
    
    - `10.0.0.0/8`
    - `172.16.0.0/12`
    - `192.168.0.0/16`
- **Virtual Networks (VNet)**:
    
    - A **VNet** is the foundation for private networking in Azure.
    - VNets can be divided into **subnets** with unique IP address ranges (in **CIDR** notation) to organize resources.
- **Subnets**:
    
    - Each **subnet** within a VNet must have a unique **IP address range** in CIDR format.
    - **Example**: `192.168.10.0/24` represents 256 IP addresses, with `.1`, `.2`, `.3`, and the **last IP** reserved by Azure.

---

### **IP Address Allocation to Resources**:

- **Public IP Addresses**: Assigned to resources like VMs, VPN gateways, load balancers, or application gateways to enable internet-facing communication.
- **Private IP Addresses**: Assigned to resources like VM network interfaces, internal load balancers, or application gateways for internal communication.

---

### **Key Considerations**:

1. **Public vs. Private IP**:
    
    - Public IP addresses are needed for **internet-facing services**.
    - Private IP addresses are used for **internal communication** within a VNet or between Azure and on-premises resources.
2. **Dynamic vs. Static IP**:
    
    - Use **dynamic IPs** when the address does not need to remain constant (cost-effective).
    - Use **static IPs** when the address needs to remain **unchanged**, such as for DNS or firewall rules.
3. **Avoiding IP Overlaps**:
    
    - Ensure **non-overlapping IP address ranges** when connecting Azure VNets with on-premises networks.
    - Example: Use `10.10.0.0/16` for on-premises and `10.20.0.0/16` for Azure.

---

### **Summary of IP Address Types and Features**:

|**Type**|**Public IP Addresses**|**Private IP Addresses**|
|---|---|---|
|**Purpose**|Internet-facing services (VMs, VPN, gateways)|Internal communication between VNets and on-premises|
|**Dynamic**|Changes over time (default for Basic SKU)|Dynamic via DHCP lease|
|**Static**|Fixed, does not change (default for Standard SKU)|Fixed via DHCP reservation|
|**Allocation**|Assigned dynamically or statically|Assigned statically or dynamically|
|**SKU Options**|Basic (open by default), Standard (secure by default)|Not applicable|
|**Reserved IPs**|Region-specific|`.1`, `.2`, `.3`, and last IP reserved in each subnet|

---

### **Conclusion**:

Azure provides a flexible IP addressing system for managing public and private communication. Whether you are deploying a public-facing web server or configuring internal communication between VMs, you must carefully plan IP address allocation to avoid overlaps and ensure secure, efficient networking.