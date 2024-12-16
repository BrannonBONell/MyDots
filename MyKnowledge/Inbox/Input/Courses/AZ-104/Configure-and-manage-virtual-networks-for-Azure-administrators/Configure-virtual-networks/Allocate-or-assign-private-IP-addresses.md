---
tags: azure microsoft devops cloud virtual networks assign private ip addresses
date: 15th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Allocate or assign private IP Addresses

In Azure, **private IP addresses** enable communication within a **virtual network** (VNet). They can be dynamically or statically assigned and are associated with resources like virtual machines, internal load balancers, and application gateways.

---

### **1. Associating Private IP Addresses with Resources**

|**Resource**|**Private IP Association**|**Dynamic IP Address**|**Static IP Address**|
|---|---|---|---|
|**Virtual Machine (VM)**|NIC (Network Interface Card)|Yes|Yes|
|**Internal Load Balancer**|Front-end configuration|Yes|Yes|
|**Application Gateway**|Front-end configuration|Yes|Yes|

---

### **2. Private IP Address Assignment**

Private IP addresses are assigned from the address range of the **VNet subnet** where the resource is deployed. There are two types of assignment: **dynamic** and **static**.

#### **2.1 Dynamic Private IP Assignment**

- **How It Works**: Azure automatically assigns the **next available** unassigned IP address from the subnet's address range.
- **Default Option**: Dynamic is the default method for assigning private IP addresses.
- **Example**: In a subnet range of **10.0.0.0/16**, if addresses **10.0.0.4** through **10.0.0.9** are already assigned, Azure will assign the next available address (e.g., **10.0.0.10**) to a new resource.

#### **2.2 Static Private IP Assignment**

- **How It Works**: You manually select and assign an **unassigned or unreserved** IP address from the subnet’s address range.
- **Example**: In a subnet range of **10.0.0.0/16**, with addresses **10.0.0.4** through **10.0.0.9** already in use, you can assign any available address (e.g., **10.0.0.10** to **10.0.255.254**) to a resource.

---

### **3. Key Considerations**

- **Dynamic IP Assignment**:
    - Azure automatically selects and assigns the next available IP address.
    - This is the default and requires no manual configuration.
- **Static IP Assignment**:
    - You select the IP address manually, ensuring consistency, which is important for services that require a **fixed IP**.
    - Useful for resources like **application gateways** and **internal load balancers** that may require a specific IP address for proper routing or security configurations.

---

### **4. Summary of Key Points**

- **Private IPs**: Used for internal communication within a virtual network, associated with resources like virtual machines, internal load balancers, and application gateways.
- **Dynamic IP Assignment**: Azure assigns the next available IP automatically.
- **Static IP Assignment**: You manually assign an IP from the available pool in the subnet.
- **Best Practices**: Use static IPs for resources that require consistent network identification, such as internal load balancers and application gateways.