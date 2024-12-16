---
tags: microsoft azure cloud devops application security groups
date: 15th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Implement application security groups

**Application Security Groups (ASGs)** allow you to logically group your virtual machines by workload in your Azure virtual network. You can then use these groups in **Network Security Group (NSG)** rules to control traffic, making it easier to manage complex infrastructure.

---

### **1. Key Features of Application Security Groups**

- **Application-Centric**: ASGs provide an **application-centric** way of organizing your infrastructure, focusing on **workload** rather than IP addresses.
- **Simplifies NSG Rules**: You can use ASGs as the **source** or **destination** in your NSG rules, eliminating the need to manage IP addresses.
- **Dynamic**: As virtual machines are added or removed from ASGs, the security rules automatically apply to all machines in that group.

![Diagram that shows how application security groups combine with network security groups to protect applications.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-network-security-groups/media/application-security-groups.png)
---

### **2. Example Scenario: Online Retailer Configuration**

For this scenario, an online retailer has:

- **6 Virtual Machines**: 2 web servers, 2 database servers.
- **Customer Access**: The web servers host an online catalog accessible via the internet.
- **Database Access**: Only web servers should access the database servers for inventory data.

#### **Steps to Implement ASGs**:

1. **Create Application Security Groups**:
    
    - **WebASG**: Group for web servers.
    - **DBASG**: Group for database servers.
2. **Assign Network Interfaces**:
    
    - Assign the **NIC** of each virtual machine to the appropriate ASG (WebASG or DBASG).
3. **Create Network Security Group and Rules**:
    
    - **Rule 1**:
        - **Priority 100**: Allow **HTTP (port 80)** and **HTTPS (port 443)** traffic from the internet to **WebASG**.
    - **Rule 2**:
        - **Priority 110**: Allow **HTTPS (port 1433)** traffic from **WebASG** to **DBASG**.
    - **Rule 3**:
        - **Priority 120**: Deny all other access to **DBASG** over **HTTPS (port 1433)** from anywhere.

#### **Result**:

- Customers can access the web servers over the internet.
- Only the web servers can access the database servers, protecting the databases from external threats.

---

### **3. Advantages of Application Security Groups**

#### **1. Simplified IP Address Management**:

- No need to track or update individual **IP addresses** in security rules.
- As virtual machines are added or removed, the ASG handles the assignment automatically.

#### **2. No Need for Subnet-Based Rules**:

- You can group virtual machines by **workload** rather than by subnets.
- This allows more flexibility in network design, focusing on **application** and **service** rather than IP-based subnetting.

#### **3. Simplified Rule Management**:

- With ASGs, you create fewer security rules that automatically apply to all members of the group.
- You don't need to create separate rules for each virtual machine.

#### **4. Better Workload Organization**:

- ASGs make it easier to manage complex infrastructures because they allow you to group resources logically by **application**, **service**, or **workload**.
- This results in a cleaner, more maintainable security structure.

---

### **4. Summary of Key Points**

- **Application Security Groups (ASGs)**: Organize virtual machines by **workload** and use them as sources or destinations in **Network Security Group (NSG)** rules.
- **Simplifies Security Management**: Reduces the need to manage **IP addresses** and allows for easy rule application to groups of virtual machines.
- **Rule Management**: New security rules applied to an ASG automatically affect all virtual machines in that group.
- **Example Use Case**: Separate web servers and database servers into **WebASG** and **DBASG** and control traffic with NSG rules for security.