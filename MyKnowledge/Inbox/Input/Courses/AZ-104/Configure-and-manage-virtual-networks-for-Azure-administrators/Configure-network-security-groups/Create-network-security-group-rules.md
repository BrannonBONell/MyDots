---
tags: microsoft azure devops cloud create network security group rules
date: 15th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Create network security group rules

Configuring **security rules** in an **Azure Network Security Group (NSG)** allows you to control **inbound** and **outbound traffic**. You can specify a wide variety of services (e.g., HTTPS, RDP, FTP) to manage traffic for your resources.

---

### **1. Key Properties for Configuring Security Rules**

When creating security rules in the Azure portal, you need to define several key properties:

![Screenshot that shows how to configure source and destination settings to create a security rule in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-network-security-groups/media/add-network-security-rule-2f306d23.png)
#### **1.1 Source**

- **Definition**: The **source** identifies where the traffic originates.
- **Settings**:
    - **Specific IP Address Range**: Allows or denies traffic from a specific IP or IP range.
    - **Resource**: Can specify a resource like a virtual machine.
    - **Application Security Group**: Allows you to control traffic for a specific group of resources.
    - **Default Tags**: Azure provides predefined tags (e.g., `Internet`, `VirtualNetwork`) to simplify rule creation.

#### **1.2 Destination**

- **Definition**: The **destination** specifies where the traffic is going.
- **Settings**: Similar to the source settings, you can use:
    - **IP Address Range**.
    - **Resource**.
    - **Application Security Group**.
    - **Default Tags**.

---

### **2. Service**

- **Definition**: Specifies the **protocol** and **port range** for the traffic.
- **Options**:
    - **Predefined Services**: Choose from services like **RDP**, **SSH**, **HTTPS**, or **FTP**.
    - **Custom Ports**: You can specify custom protocols and port ranges to meet your specific needs.

![Screenshot that shows service rule options for a security rule in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-network-security-groups/media/security-services.png)
---

### **3. Priority**

- **Definition**: Determines the **order** in which security rules are processed.
- **How It Works**:
    - Rules are processed in **priority order**, where **lower values** mean **higher priority**.
    - Always leave gaps between priority values (e.g., use 100, 200, 300) to allow flexibility for future rules without needing to reorder existing rules.

![Screenshot that shows how to set the priority value for a security rule in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-network-security-groups/media/security-priority.png)
---

### **4. Summary of Key Points**

- **Source**: Defines where the traffic originates (IP range, resource, security group, or default tag).
- **Destination**: Specifies the destination of the traffic using similar filters as the source.
- **Service**: Choose from predefined services like **RDP**, **HTTPS**, or provide custom port ranges.
- **Priority**: Lower values mean higher priority; ensure you leave gaps between rule priorities to allow flexibility for future changes.