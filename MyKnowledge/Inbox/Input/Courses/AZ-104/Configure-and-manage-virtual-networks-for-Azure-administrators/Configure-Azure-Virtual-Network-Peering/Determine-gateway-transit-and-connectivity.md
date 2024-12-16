---
tags: microsoft azure devops cloud gateway transit connectivity
date: 15th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Determine gateway transit and connectivity

When virtual networks are **peered**, they can share an **Azure VPN Gateway** in the hub virtual network to access external resources, acting as a **transit point** for connected networks.


![Diagram of a regional virtual network peering. One network allows VPN gateway transit and uses a remote VPN gateway to access resources in a hub virtual network.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-vnet-peering/media/gateway-transit-173a51a0.png)
---

### **1. Azure VPN Gateway Overview with Virtual Network Peering**

- **VPN Gateway Sharing**: A **peered virtual network** can use the **VPN gateway** in another virtual network (the hub) to access external resources. This is known as **VPN gateway transit**.
- **Scenario**: Consider three virtual networks—**Virtual Network A**, **Virtual Network B**, and a **hub network**:
    - Both **Virtual Network A** and **Virtual Network B** are peered with the **hub**.
    - The hub contains an **Azure VPN Gateway** configured to allow **gateway transit**.
    - **Virtual Network B** accesses resources through the hub’s VPN gateway without needing its own VPN gateway.

---

### **2. Key Things to Know About Azure VPN Gateway**

- **One VPN Gateway per Virtual Network**: A virtual network can have only **one VPN gateway**.
- **Gateway Transit**: Supported for both **regional** and **global** virtual network peering. This enables peered networks to communicate with external resources beyond the peered network.
- **Resource Access**: Using **gateway transit**, a peered network can:
    - Access on-premises resources via a **site-to-site VPN**.
    - Connect to another virtual network via a **vnet-to-vnet connection**.
    - Allow remote clients to connect via a **point-to-site VPN**.

---

### **3. Benefits of VPN Gateway Transit**

- **Share the Gateway**: Peered virtual networks can share the VPN gateway in the **hub network**, eliminating the need to deploy a gateway in each peered network.
- **Access Resources**: Peered networks can access external resources through the shared gateway, simplifying network architecture and reducing costs.

---

### **4. Using Network Security Groups (NSGs) with VPN Gateway Transit**

- **NSG Configuration**: You can apply **Network Security Groups (NSGs)** to control traffic between virtual networks or subnets.
- **NSG Rules**: When configuring peering, you can decide whether to **open** or **restrict** NSG rules between the peered virtual networks, allowing for flexible traffic management.

---

### **5. Summary of Key Points**

- **VPN Gateway Transit**: Allows peered virtual networks to share a single **VPN gateway** to access external resources.
- **Gateway Transit Supports**: Both **regional** and **global peering**.
- **NSG Management**: You can configure **NSGs** to control access between peered networks, either opening or restricting traffic as needed.
- **Simplified Setup**: Peered networks don’t need their own VPN gateway, which simplifies network design and saves costs.