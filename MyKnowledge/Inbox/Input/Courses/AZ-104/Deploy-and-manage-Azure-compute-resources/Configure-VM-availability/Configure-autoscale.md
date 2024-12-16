---
tags: microsoft azure devops cloud VM availability autoscale configure
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Configure autoscale

When setting up **Azure Virtual Machine Scale Sets**, you can enable **autoscaling** to ensure your application dynamically adjusts to workload changes. Here’s a step-by-step guide to the key settings for configuring autoscaling in the **Azure portal**.

![Screenshot of the settings for configuring virtual machine instances and autoscale in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-virtual-machine-availability/media/implement-autoscale-74d25345.png)

### **1. Define Scaling Policy**

- **Scaling Policy**: Choose between:
    - **Manual Scale**: Keeps a fixed number of VM instances running.
    - **Custom Autoscale**: Automatically scales the number of VM instances based on metrics like CPU usage or a scheduled time.

---

### **2. Specify VM Instance Counts**

- **Minimum Number of VMs**: Define the **minimum number** of virtual machines that should always be running. This ensures there’s always a base capacity.
- **Maximum Number of VMs**: Define the **maximum number** of virtual machines allowed when autoscaling occurs. This prevents over-scaling and keeps costs in check.

---

### **3. Configuring Scale Out (Increase Capacity)**

- **CPU Threshold**: Set the CPU usage percentage that will trigger the **scale-out** action. For example, if CPU usage exceeds 70%, autoscaling adds more VM instances.
- **Duration in Minutes**: Specify the duration the autoscale engine will look back at metrics (e.g., 10 minutes). This prevents autoscaling based on short, temporary CPU spikes.
- **Number of VMs to Increase By**: Define how many VM instances to **add** when the scale-out rule is triggered.

---

### **4. Configuring Scale In (Decrease Capacity)**

- **CPU Threshold**: Set the CPU usage percentage that will trigger the **scale-in** action. For instance, if CPU usage drops below 40%, the system will remove VM instances.
- **Number of VMs to Decrease By**: Define how many VM instances to **remove** when the scale-in rule is triggered.
- **Scale In Policy**: Configure the **order in which VMs are removed**. You can choose whether to remove older or newer instances first.

---

### **5. Summary of Key Points**

- **Minimum and Maximum VMs**: Set a minimum to guarantee base performance, and a maximum to control costs.
- **Scale Out**: Triggered when CPU usage exceeds a defined threshold. Adds a specific number of VMs.
- **Scale In**: Triggered when CPU usage drops below a threshold. Removes VMs based on your scale-in policy.
- **Metrics Duration**: Specify a timeframe (e.g., 10 minutes) for autoscaling to evaluate metrics, ensuring stable scaling actions.
- **Scale In Policy**: Decide the order of VM removal to optimize performance and costs.

By configuring these autoscaling settings, you can ensure that your Azure Virtual Machine Scale Sets respond effectively to changing workloads, maintaining performance while controlling costs.