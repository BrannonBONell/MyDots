---
tags: microsoft azure devops cloud VM avaialibility create availability-sets
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Create availability-sets

An **availability set** is a critical feature in Azure to ensure **high availability** for a group of related virtual machines (VMs). It helps prevent a single point of failure by distributing VMs across multiple physical servers and infrastructure components in a data center.

---

### **1. Key Characteristics of Availability Sets**

- **Group of VMs**: All VMs in an availability set perform the **same functionality** and have **identical software**.
- **Fault Tolerance**: Azure ensures that VMs in an availability set are spread across **multiple physical servers**, **compute racks**, **storage units**, and **network switches**. This distribution ensures that only a **subset** of VMs is impacted if there is a hardware or software failure.
- **High Availability**: If a hardware failure occurs, only a portion of the VMs are affected, keeping your application running and available.
- **Creation**: VMs can be added to an availability set **only when they are created**. If you need to change the availability set later, the VM must be **deleted and recreated**.
- **Deployment Options**: You can build availability sets via the **Azure portal**, **Azure Resource Manager (ARM) templates**, or **scripting tools**.

---

### **2. Important Considerations for Using Availability Sets**

- **Redundancy**: Place **multiple VMs** in an availability set to ensure redundancy and reduce the risk of all VMs being affected by a failure.
- **Application Tiers**: For multi-tier applications, place each application tier (e.g., web, database) in **separate availability sets**. This separation minimizes the impact of failures across all tiers.
- **Load Balancing**: Combine availability sets with the **Azure Load Balancer** to distribute incoming traffic across multiple VMs. This improves both **network performance** and **availability**.
- **Managed Disks**: Use **Azure managed disks** for reliable block-level storage with your VMs in availability sets.

---

### **3. Limitations and Additional Considerations**

- **Operating System and Application Failures**: Availability sets do **not protect** against OS or application-specific failures. For application-level protection, explore additional **disaster recovery** and **backup solutions**.
- **SLA**: Microsoft provides strong **Service Level Agreements (SLAs)** for VMs in availability sets. For details, refer to the **Azure VM SLA** documentation.

---

### **Summary of Key Points**

- **Fault Tolerance**: VMs in availability sets are spread across multiple servers and infrastructure to reduce the risk of failure.
- **Redundancy**: Place multiple VMs in an availability set to ensure reliability.
- **Separation of Application Tiers**: Separate application tiers into different availability sets to prevent complete application failure.
- **Load Balancing**: Use Azure Load Balancer with availability sets for higher availability and performance.
- **Managed Disks**: Azure managed disks offer reliable storage for VMs in availability sets.

By following these best practices, you can ensure **high availability** for your applications and **mitigate risks** associated with hardware and infrastructure failures.