---
tags: microsoft azure devops cloud VM availability availability-zones
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Availability-zones

**Availability Zones** are a high-availability feature in Azure that protect your applications and data from datacenter failures by distributing resources across **physically separate locations** within a region.

---

### **1. What Are Availability Zones?**

- **Definition**: Availability zones are **unique physical locations** within an Azure region, each made up of one or more datacenters with **independent power, cooling, and networking**.
- **Purpose**: They help ensure high availability by protecting against **datacenter failures**. In case one zone fails, the others continue running, minimizing downtime.
- **Physical Separation**: There are at least **three zones** in all enabled regions to ensure resiliency.

---

### **2. Key Characteristics of Availability Zones**

- **High Availability**: Each zone is designed to be isolated from failures in other zones within the region.
- **Fault and Update Domains**: By spreading resources across availability zones, your VMs are effectively distributed across multiple **fault domains** and **update domains**, ensuring they aren’t impacted by the same maintenance or failure events.
- **Replication for Resiliency**: Zone-redundant services automatically replicate data and applications across all availability zones to guard against single points of failure.

---

### **3. How Availability Zones Work**

- **VM Distribution**: When you create multiple virtual machines across three availability zones in a region, they are automatically distributed across **three fault domains** and **three update domains**. This ensures that VMs in different zones aren't updated or affected at the same time.
- **Colocation of Resources**: You can colocate your compute, storage, and networking resources within a zone, while also replicating them across other zones to increase availability.

---

### **4. Types of Azure Services and Availability Zones**

Azure services that support availability zones fall into two categories:

|**Category**|**Description**|**Examples**|
|---|---|---|
|**Zonal Services**|Resources are pinned to a specific zone for redundancy.|- Azure Virtual Machines  <br>- Azure managed disks  <br>- Standard IP addresses|
|**Zone-Redundant Services**|Resources are automatically replicated across multiple zones for high availability.|- Azure Storage (zone-redundant)  <br>- Azure SQL Database|

---

### **5. Benefits of Using Availability Zones**

- **Protection Against Datacenter Failures**: The physical separation between zones ensures that a failure in one datacenter won’t impact resources in other zones.
- **Improved Fault Tolerance**: Distributing VMs and other resources across zones ensures **fault tolerance** and **high availability**.
- **Zone-Redundant Replication**: Services like **Azure Storage** automatically replicate data across zones to prevent data loss in case of zone-level failures.

---

### **6. Planning with Availability Zones**

- **Combine Zones with Region Pairs**: For comprehensive **business continuity**, use **availability zones** in combination with **Azure region pairs**. This ensures additional resilience in case of regional-level disasters.
- **Design for High Availability**: Colocate resources (compute, storage, networking) within zones, and replicate them across zones for redundancy and minimal downtime.

---

### **7. Summary of Key Points**

- **Availability Zones** are separate physical locations within an Azure region, each with independent power, cooling, and networking.
- Distributing your resources across **multiple zones** protects against datacenter failures.
- **Zonal services** are pinned to specific zones, while **zone-redundant services** automatically replicate across zones.
- **Minimum of three zones** in each enabled region ensures high availability and resiliency.
- Combine **availability zones** with **region pairs** for comprehensive disaster recovery and business continuity.

By leveraging availability zones, you can build highly resilient and fault-tolerant applications in Azure that withstand failures while maintaining service continuity.

![[Pasted image 20241014092947.png]]