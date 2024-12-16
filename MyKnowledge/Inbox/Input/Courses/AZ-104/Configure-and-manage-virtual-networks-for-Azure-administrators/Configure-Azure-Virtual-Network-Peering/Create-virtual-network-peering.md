---
tags: microsoft azure devops cloud virtual network peering
date: 15th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Create virtual network peering

**Azure Virtual Network Peering** allows virtual networks (VNets) to communicate with each other. Here’s how to configure and check peering status in the **Azure portal** for virtual networks deployed using Azure Resource Manager.

---

### **1. Key Points to Know Before Creating Virtual Network Peering**

- **Permissions**: Your Azure account must have the **Network Contributor**, **Classic Network Contributor**, or a custom role that grants peering actions permission.
- **Two Virtual Networks Required**: You need at least **two virtual networks** to establish peering.
    - The second virtual network is referred to as the **remote network**.
- **Initial State**: Before peering, the **virtual machines** in the two virtual networks **cannot communicate**.
    - Once peering is established, communication is possible based on your configuration settings.

---

### **2. Checking Peering Status in the Azure Portal**

You can monitor the **peering status** of virtual networks in the Azure portal. There are two primary statuses depending on how virtual networks are deployed:

#### **For Azure Resource Manager Deployments**:

- **Initiated**: After you create the initial peering from the first virtual network to the second (remote) virtual network, the status for the first network is **Initiated**.
- **Connected**: When the peering is completed from the second virtual network to the first, the status for **both networks** changes to **Connected**.

#### **For Classic Deployment Model**:

- **Updating**: In the classic model, you may see an **Updating** status in addition to **Initiated** and **Connected**.

---

### **3. Steps for Peering Virtual Networks Across Azure Regions**

1. **Create the initial peering** from the first virtual network to the second (remote) virtual network.
    - The status of the first virtual network will show as **Initiated**.
2. **Create the subsequent peering** from the second virtual network back to the first virtual network.
    - Once this is completed, the status for both networks will show as **Connected**.

---

### **4. Summary of Key Points**

- **Permissions**: You need the **Network Contributor** or equivalent role to establish peering.
- **Initiated to Connected**: Peering is not complete until both virtual networks show a status of **Connected**.
- **VNet Communication**: Once peering is complete, virtual machines in the peered networks can communicate with each other based on your configuration settings.