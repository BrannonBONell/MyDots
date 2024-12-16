---
tags: microsoft azure devops cloud network security group rules
date: 15th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Determine Network Security group rules

**Security rules** in Azure **Network Security Groups (NSGs)** control the flow of **inbound** and **outbound** traffic to and from resources in your virtual network. These rules allow you to filter traffic based on specific conditions.

---

### **1. Default Security Rules**

- **Pre-Configured by Azure**: Each NSG comes with several **default security rules** to handle basic traffic scenarios.
    - **Inbound Rules**: Default rules **deny all inbound traffic** except traffic from the virtual network and Azure load balancers.
    - **Outbound Rules**: Default rules **allow outbound traffic** to the internet and within the virtual network.
- **Examples of Default Rules**:
    - **DenyAllInbound**: Blocks all inbound traffic by default.
    - **AllowInternetOutbound**: Allows outbound traffic to the internet.
- **Note**: You **cannot remove default rules**, but you can override them by creating custom rules with a higher priority.

---

### **2. Custom Security Rules**

You can add custom security rules to an NSG by defining the following settings:

- **Name**: A unique name to identify the rule.
- **Priority**: Each rule has a priority value (lower values mean higher priority). Rules are processed in order of priority.
- **Port**: Specify the port or range of ports the rule applies to (e.g., port 80 for HTTP traffic).
- **Protocol**: Choose between **TCP**, **UDP**, or **Any**.
- **Source**: Define the source of the traffic (e.g., Any, specific IP addresses, or service tags).
- **Destination**: Define the destination for the traffic (e.g., Any, specific IP addresses, or a virtual network).
- **Action**: Specify whether to **Allow** or **Deny** the traffic that matches the rule.

---

### **3. Inbound Traffic Rules**

![Screenshot that shows default inbound security rules for a network security group in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-network-security-groups/media/inbound-rules-a554314b.png)

- **Default Inbound Rules**:
    - Azure creates **three default inbound rules** that deny all inbound traffic, except for traffic coming from:
        - **Virtual network** (traffic within the same VNet).
        - **Azure load balancers**.
    - These rules ensure that only authorized inbound traffic can reach your resources.

---

### **4. Outbound Traffic Rules**

![Screenshot that shows default outbound security rules for a network security group in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-network-security-groups/media/outbound-rules-ff90d802.png)

- **Default Outbound Rules**:
    - Azure creates **three default outbound rules** that allow outbound traffic to:
        - The **internet**.
        - Resources within the **virtual network**.
    - These rules allow your resources to communicate with other external services and internal resources.

---

### **5. Key Points for Customizing Security Rules**

- **Priority**: The lower the priority number, the higher the precedence of the rule.
- **Override Default Rules**: You can override default rules by creating custom rules with a **higher priority**.
- **Custom Rules**: Use custom rules to allow or deny specific traffic (e.g., only allowing traffic on port 443 for HTTPS or blocking traffic from certain IP ranges).

---

### **6. Summary of Key Points**

- **Default Rules**: Automatically manage basic inbound and outbound traffic control but can’t be deleted.
- **Custom Rules**: Allow you to fine-tune traffic control by defining specific conditions (priority, ports, protocols, etc.).
- **Priority-Based Processing**: Rules with lower priority values are processed first, so carefully set priorities when adding custom rules.
- **Override Defaults**: You can override default security rules by creating new ones with higher priority.