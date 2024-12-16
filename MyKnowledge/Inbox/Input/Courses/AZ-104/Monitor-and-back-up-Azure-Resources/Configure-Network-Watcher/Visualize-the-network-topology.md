---
tags: azure cloud devops microsoft network topology
date: 19th-October-2024
---

# Visualize the network topology

**Overview:** The Network Watcher Topology tool helps administrators visualize the structure of a virtual network, making it easier to troubleshoot and understand the infrastructure, especially when they didn't originally configure the network.

![Screenshot of the Network Watcher Topology page in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-network-watcher/media/monitor-visualization-1fb7bd5c.png)

---

### Key Features of the Topology Tool:

1. **Visual Diagram**:
    
    - Generates a graphical representation of the virtual network.
    - Displays the resources, their interconnections, and relationships.
2. **Displayed Resources**:
    
    - Subnets
    - Virtual Machines (VMs)
    - Network Interfaces (NICs)
    - Public IP Addresses
    - Network Security Groups (NSGs)
    - Route Tables
    - More components of the network infrastructure.
3. **Interactive View**:
    
    - Allows administrators to explore different elements and their configurations visually.
    - Simplifies understanding the network's layout and dependencies.

---

### Requirements for Using the Topology Tool:

- **Azure Network Watcher Instance**: Must be deployed in the same region as the virtual network to generate a topology.

---

### Benefits:

- **Troubleshooting**: Helps admins diagnose network issues by visually identifying resource connections and configurations.
- **Infrastructure Understanding**: Provides a clear overview of the network infrastructure, even for administrators unfamiliar with the network.
- **Quick Analysis**: Enables quick identification of potential misconfigurations, such as missing connections or incorrect route tables.

---

### When to Use:

- When you need to quickly understand a virtual network's architecture.
- For diagnosing and troubleshooting issues in complex network environments.
- When managing or auditing virtual networks created by others.

---

This tool makes it easy for administrators to gain insight into the virtual network's layout and relationships, aiding in efficient network troubleshooting and management.