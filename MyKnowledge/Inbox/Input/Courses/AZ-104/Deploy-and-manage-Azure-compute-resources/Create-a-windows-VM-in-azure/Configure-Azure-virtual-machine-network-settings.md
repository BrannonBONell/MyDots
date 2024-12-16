---
tags: microsoft azure cloud devops VM windowss network settings
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Configure azure VM network settings

**Overview:** Azure Virtual Machines (VMs) are locked down by default, meaning only outgoing traffic is allowed while most inbound traffic is blocked. To allow specific inbound traffic (such as FTP), you need to configure the network settings of the VM by adjusting **Network Security Groups (NSGs)**. NSGs act as software firewalls, controlling network traffic rules for Azure VMs.

---

### **Key Concepts:**

1. **Virtual Networks (VNets)**:
    
    - **VNets** are the foundational networking layer in Azure, providing network isolation and protection.
    - VNets connect resources within Azure and act similarly to on-premises networks.
2. **Network Security Groups (NSGs)**:
    
    - **NSGs** filter **inbound** and **outbound** traffic for Azure resources.
    - They control access to VMs by creating rules that allow or deny traffic based on:
        - **Source/destination** IP addresses.
        - **Protocol** (TCP/UDP).
        - **Port** numbers (e.g., port 80 for HTTP, port 21 for FTP).
        - **Direction** (inbound or outbound).
3. **NSG Scope**:
    
    - **Per-host (Network Interface)**: Apply NSG rules to a specific VM.
    - **Subnet level**: Apply NSG rules to an entire subnet in a VNet, affecting all VMs and resources in that subnet.

---

### **Steps to Open Ports in Azure VM for FTP**:

1. **Create a Network Security Group**:
    
    - In the Azure portal, go to **Networking** under the VM settings.
    - Click on **Add Inbound Rule** under the **Network Security Group (NSG)** section.
2. **Create Inbound Rules for FTP**:
    
    - For **active FTP**, you need to allow inbound traffic on **port 21 (command)** and **port 20 (data)**.
    - Configure the following rules:
        - **Port 21** (FTP Command):
            - Protocol: TCP.
            - Source: Any or specify an IP range.
            - Destination: Any.
            - Port: 21.
            - Action: Allow.
        - **Port 20** (FTP Data):
            - Protocol: TCP.
            - Source: Any or specify an IP range.
            - Destination: Any.
            - Port: 20.
            - Action: Allow.

---

### **Network Security Group (NSG) Rules**:

![Illustration showing the architecture of network security groups in two different subnets. In one subnet, there are two virtual machines, each with their own network interface rules. The subnet itself has a set of rules that applies to both the virtual machines.](https://learn.microsoft.com/en-us/training/modules/create-windows-virtual-machine-in-azure/media/7-nsg-rules.png)
1. **NSG Rule Components**:
    
    - **Source**: The IP or range where traffic is coming from (e.g., Internet or specific IP range).
    - **Destination**: The target resource (e.g., VM or subnet).
    - **Protocol**: TCP, UDP, or Any.
    - **Port**: The port or range of ports being allowed or blocked (e.g., 21 for FTP).
    - **Direction**: Inbound or outbound.
    - **Priority**: Determines the order in which rules are evaluated (lower numbers are evaluated first).
    - **Action**: Allow or Deny traffic.
2. **Default NSG Rules**:
    
    - Every NSG has a set of **default rules** that cannot be modified but can be overridden with custom rules.
    - Default rules include:
        - **Allow VNet traffic**: Allows traffic within the VNet.
        - **Allow Azure Load Balancer**: Allows traffic from Azure’s internal load balancer.
        - **Deny all inbound traffic**: Blocks all inbound traffic unless explicitly allowed.
        - **Deny all outbound traffic**: Blocks all outbound traffic unless explicitly allowed.
3. **Evaluation Process**:
    
    - NSG rules are evaluated in **priority order**, starting with the lowest number.
    - If traffic matches an **Allow** or **Deny** rule, further rules are not evaluated.
    - The **last rule** in every NSG is a **Deny All** rule (priority 65500), ensuring that any traffic not explicitly allowed is blocked.

---

### **Security Considerations**:

1. **Subnet vs. Network Interface Rules**:
    
    - NSGs can be applied at both the **subnet** level and the **network interface** level (specific to a VM).
    - Inbound traffic is first evaluated by the **subnet NSG**, then by the **VM’s NSG** (network interface level).
    - Outbound traffic is evaluated in the reverse order (network interface first, then subnet).
2. **Avoid Public IP Exposure**:
    
    - By default, **public IP addresses** make VMs accessible from the internet, which increases security risks.
    - Use **NSGs** to restrict access to trusted IP addresses or to block certain types of traffic.
    - Consider using **VPNs** or **Azure Bastion** for secure access to VMs without needing a public IP.
3. **Security Best Practices**:
    
    - **Limit exposure**: Use NSGs to tightly control inbound and outbound traffic.
    - **Minimize public access**: Restrict public IP access and use private networks when possible.
    - **Prioritize rules carefully**: Ensure that critical **Deny** rules are placed before lower-priority **Allow** rules to prevent accidental exposure.

---

### **SMTP Traffic (Port 25) Consideration**:

- **Special Case for Port 25** (SMTP):
    - Outbound SMTP traffic on **port 25** may be blocked by default for certain Azure subscriptions.
    - You can request to remove this restriction by submitting a support ticket with business justification.

---

### **NSG vs. VM Firewall**:

- **NSGs** act as the first layer of defense by managing network traffic at the Azure infrastructure level.
- However, your **VM** should also have its own **operating system firewall** (e.g., **Windows Firewall**) for additional protection.
- Both layers of defense work together to block unauthorized traffic and ensure security.

---

### **Summary**:

1. **NSGs** provide essential firewall capabilities to control **inbound** and **outbound** traffic for Azure VMs.
2. To allow FTP access, you must open **ports 20 and 21** by creating inbound rules in the NSG.
3. Apply NSG rules at both the **network interface** and **subnet** levels for maximum control.
4. Prioritize security by using **VPNs**, **private IP addresses**, and **firewall rules** to limit public exposure.
5. Ensure critical **Deny** rules are placed with higher priority to block unwanted traffic.
6. Default NSG rules deny all traffic, so explicit **Allow rules** are needed to permit specific services like FTP, RDP, or HTTP.

These notes provide a comprehensive understanding of how to manage and secure network traffic for Azure VMs using Network Security Groups (NSGs), focusing on enabling FTP and general traffic control.