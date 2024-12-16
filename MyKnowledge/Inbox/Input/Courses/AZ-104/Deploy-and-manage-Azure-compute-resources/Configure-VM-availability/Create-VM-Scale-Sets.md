---
tags: azure microsoft devops cloud VM availability create scale-sets
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Create VM scale-sets

When creating **Azure Virtual Machine Scale Sets** in the Azure portal, you configure several important settings to manage the scale, performance, and cost of your virtual machines (VMs). Here’s a breakdown of the key configurations:

![Screenshot that shows how to create Virtual Machine Scale Sets in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-virtual-machine-availability/media/implement-scale-sets-61516afb.png)

---

### **1. Orchestration Mode**

- **Flexible Orchestration Mode**: Allows you to manually add VMs with different configurations to the scale set. Offers more flexibility in terms of VM variety.
- **Uniform Orchestration Mode**: Defines a single VM model, and Azure automatically generates identical instances based on that model. Best for maintaining consistency across all VMs.

---

### **2. Image**

- **Image Selection**: Choose the base operating system (e.g., Windows, Linux) or an application image for the virtual machines. This will serve as the foundation for all VMs in the scale set.

---

### **3. VM Architecture**

- **x64 or Arm64**: Choose the architecture based on your application’s needs. Azure supports both **x64** and **Arm64** architectures for running different types of workloads.

---

### **4. Azure Spot Instances**

- **Azure Spot Instances**: Opt for discounted Azure Spot pricing, which offers unused capacity at a lower cost. However, workloads running on Spot instances must tolerate potential infrastructure loss since Azure may reclaim the capacity at any time.

---

### **5. VM Size**

- **VM Size**: Select a size based on your workload’s requirements. The size determines **processing power**, **memory**, and **storage capacity**. Azure charges based on the hourly usage of the VM’s size and operating system.
    - Examples of sizes include **General-Purpose**, **Compute-Optimized**, **Memory-Optimized**, and **Storage-Optimized**.

---

### **6. Advanced Settings**

Under the **Advanced Tab**, you can configure additional options:

- **Scaling Beyond 100 Instances**:
    
    - **No**: Limits the scale set to a single placement group with up to **100 VM instances**.
    - **Yes**: Allows the scale set to span multiple placement groups, supporting up to **1,000 VM instances**. Selecting this option changes the **availability characteristics** of the implementation, spreading VMs across different fault domains for higher availability.
- **Spreading Algorithm**:
    
    - **Max Spreading**: Microsoft recommends using **Max spreading**, which optimally distributes VMs across fault domains and update domains for better fault tolerance.

---

### **7. Key Considerations**

- **Orchestration Mode**: Choose **Uniform Mode** for consistency or **Flexible Mode** for a mix of configurations.
- **Spot Instances**: Use **Azure Spot** to save on costs, but be aware of potential capacity recalls.
- **Scaling Beyond 100**: Choose **Yes** if your application needs to scale beyond 100 VMs, or **No** for smaller deployments.
- **Spreading Algorithm**: Use **Max spreading** to improve fault tolerance by distributing VMs across fault domains.

---

### **Summary of Key Points**

- **Orchestration Mode**: Choose between **Flexible** or **Uniform** scaling depending on your application needs.
- **Image and Architecture**: Select the appropriate **OS image** and **architecture** (x64 or Arm64) for your VMs.
- **Azure Spot Instances**: Consider **Spot pricing** for non-critical workloads to save costs.
- **VM Size**: Choose a VM size that fits your workload’s resource requirements.
- **Advanced Settings**: Use the **Max spreading** algorithm for optimal distribution and scale up to **1,000 VMs** if needed.

By configuring these options, you can efficiently deploy and manage a scalable, cost-effective Azure Virtual Machine Scale Set tailored to your application’s workload.