---
tags: azure microsoft devops cloud network security group effective rules
date: 15th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Determine network security group effective rules

**Network Security Groups (NSGs)** in Azure control inbound and outbound traffic to and from resources in your virtual network. Each NSG defines security rules that allow or deny traffic. These rules are processed independently for each virtual machine (VM) in your configuration.

![Diagram that shows how network security group security rules control traffic to virtual machines.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-network-security-groups/media/security-groups-7a9d5c84.png)


![[Pasted image 20241015001933.png]]

### **1. Inbound Traffic Evaluation**

For **inbound traffic**, Azure processes NSG rules in the following order:

1. **Subnet NSG Rules**: Rules associated with the subnet are evaluated first.
2. **NIC NSG Rules**: Rules associated with the Network Interface Card (NIC) are evaluated after subnet rules.

- **Important**: Subnet NSG rules take precedence over NIC NSG rules.

---

### **2. Outbound Traffic Evaluation**

For **outbound traffic**, Azure processes NSG rules in the following order:

1. **NIC NSG Rules**: Rules associated with the NIC are evaluated first.
2. **Subnet NSG Rules**: Rules associated with the subnet are evaluated after NIC rules.

- **Important**: NIC NSG rules take precedence over subnet NSG rules for outbound traffic.

---

### **3. Key Points on Effective Security Rules**

- **NSG Default Rules**:
    
    - **DenyAllInbound**: By default, all inbound traffic is denied unless explicitly allowed.
    - **AllowInternetOutbound**: By default, all outbound traffic to the internet is allowed unless explicitly denied.
- **Overriding Default Rules**: You can override default rules by creating custom rules with a higher priority.
    

---

### **4. Creating Effective Security Rules**

When creating NSG rules, consider the following:

#### **1. Allowing All Traffic**

- If you don’t associate an NSG with a subnet or NIC, Azure’s default rules allow all traffic to flow through.
- **Use Case**: When you don’t need to control traffic at a detailed level, you can rely on default rules by not associating an NSG.

#### **2. Importance of Allow Rules**

- If you associate an NSG with a subnet or NIC, you must define an **allow rule**; otherwise, traffic will be denied.
- **Use Case**: Always define allow rules for both the subnet and NIC if you need traffic to reach your resources.

#### **3. Intra-Subnet Traffic**

- By default, **intra-subnet traffic** (traffic between VMs in the same subnet) is allowed.
- To block this traffic, you can create rules that deny all inbound and outbound traffic between VMs in the same subnet.

#### **4. Rule Priority**

- Rules are processed in **priority order** (lower priority numbers are processed first).
- Leave gaps in your priority numbers (e.g., 100, 200, 300) so you can easily add new rules later without reordering existing ones.

---

### **5. Viewing Effective Security Rules**

You can view the **Effective Security Rules** in the Azure portal to see which rules are currently applied to your virtual machines, subnets, and NICs.

---

### **6. Summary of Key Points**

- **Inbound Traffic**: Subnet NSG rules are evaluated first, followed by NIC rules.
- **Outbound Traffic**: NIC NSG rules are evaluated first, followed by subnet rules.
- **Default Rules**: Deny all inbound traffic by default; allow all outbound traffic to the internet by default.
- **Rule Priority**: Lower priority numbers are processed first; leave gaps in numbering to add future rules easily.
- **Intra-Subnet Traffic**: Allowed by default; can be denied with custom rules.

![[Pasted image 20241015001944.png]]