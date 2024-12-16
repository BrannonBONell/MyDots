---
tags: azure microsoft devops cloud VM availability update domains fault
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Update domains and fault domains

When using **Azure Availability Sets**, two key concepts—**Update Domains** and **Fault Domains**—help ensure **high availability** and **fault tolerance** for your applications. Each virtual machine (VM) in an availability set is assigned to one update domain and one fault domain, which work together to reduce downtime during maintenance and protect against hardware failures.

---

### **1. Update Domains**

- **Definition**: An **Update Domain** is a logical group of VMs that are **updated and rebooted together** during planned maintenance or software updates. Azure uses update domains to roll out upgrades incrementally.
- **Characteristics**:
    - VMs in the same update domain can be updated and rebooted at the same time.
    - **Only one update domain** is rebooted at a time during maintenance to ensure minimal downtime.
    - **Default Setting**: There are five update domains by default, but this can be configured to up to 20 update domains if needed.
- **Purpose**: Helps minimize the impact of planned maintenance by staggering reboots across update domains.

---

### **2. Fault Domains**

- **Definition**: A **Fault Domain** is a logical group of VMs that share the same physical hardware, such as **power** and **network switches** (e.g., a server rack). A fault domain represents a single point of potential hardware failure.
- **Characteristics**:
    - VMs in the same fault domain share common physical resources, meaning they could be affected by the same power outage or hardware failure.
    - **Two fault domains** are typically used to ensure redundancy.
    - VMs are distributed across multiple fault domains to ensure that if a failure occurs in one domain, the other domain continues operating.
- **Purpose**: Mitigates the risk of hardware failures, ensuring that your application remains available even if a fault domain is impacted.

---

### **3. How Update and Fault Domains Work Together**

In an availability set, Azure distributes VMs across **update domains** and **fault domains** to ensure both **hardware redundancy** and **minimal maintenance downtime**. Here's how:

- **Update Domains**: Minimize disruption during **planned maintenance** by rebooting only one update domain at a time.
- **Fault Domains**: Protect against **hardware failures** by spreading VMs across different physical racks (fault domains).

---

### **4. Example Scenario: Two Availability Sets**

Imagine you have two availability sets—one for your **web servers** and one for your **SQL servers**. Each set contains two VMs, one in each fault domain. Here's how it works:

- **Web Availability Set**:
    - Two VMs (VM1 and VM2) are distributed across two fault domains.
    - VM1 is in **Fault Domain 1**, and VM2 is in **Fault Domain 2**.
- **SQL Availability Set**:
    - Two SQL VMs are also distributed across two fault domains.
    - One SQL VM in **Fault Domain 1** and the other in **Fault Domain 2**.

If a hardware failure occurs in one fault domain, only one VM in each set is affected, keeping your web and SQL services running.

![Illustration that shows two fault domains with two virtual machines each. The virtual machines in each fault domain are contained in different availability sets.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-virtual-machine-availability/media/update-fault-domains-c1ceee00.png)

---

### **5. Summary of Key Points**

- **Update Domains**: Group VMs to allow for staggered updates during maintenance. Only one update domain is rebooted at a time. You can configure up to 20 update domains.
- **Fault Domains**: Group VMs that share common physical resources (like a server rack). VMs are distributed across fault domains to reduce the risk of downtime due to hardware failures.
- **High Availability**: By using both update and fault domains, Azure ensures **minimal downtime** during maintenance and **redundancy** in case of hardware failures.

By leveraging availability sets with update and fault domains, you can increase the **resilience** of your application infrastructure and provide a higher level of **service continuity** for your users.