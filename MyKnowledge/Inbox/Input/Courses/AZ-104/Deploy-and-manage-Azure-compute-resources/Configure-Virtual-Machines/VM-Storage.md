---
tags: azure microsoft devops cloud VM configure storage
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# VM Storage

Azure Virtual Machines use **disks** to store the **operating system**, **applications**, and **data**. Understanding the types of disks available and how to use them can help you optimize your VM setup.

---

![[Pasted image 20241014085950.png]]
### **1. Types of Disks in Azure Virtual Machines**

#### **Operating System Disk (OS Disk)**

- **Purpose**: Stores the operating system of the virtual machine.
- **Details**:
    - Labeled as **C:** drive in Windows or **/dev/sda1** in Linux.
    - Registered as a **SATA** drive.
    - Preinstalled with the OS selected when the VM is created.

#### **Temporary Disk**

- **Purpose**: Provides temporary storage, mainly for system operations like paging.
- **Important**: Data on this disk **can be lost** during maintenance or redeployment.
    - **Windows**: Labeled as **D:** drive by default.
    - **Linux**: Typically **/dev/sdb**, mounted to **/mnt**.
- **Usage**: Don't store critical data here—used for temporary files like **pagefile.sys** or **swap files**.

#### **Data Disk**

- **Purpose**: Stores application data or other persistent data.
- **Details**:
    - Attached as **SCSI drives** and labeled with a letter (e.g., E:, F:) in Windows or a mount point in Linux.
    - The number of data disks depends on the VM size.
- **Use Case**: Ideal for storing persistent data like databases or application files.

---

### **2. Storage Options and Considerations**

#### **Azure Premium Storage**

- **Purpose**: Provides high-performance, low-latency disk storage using **Solid-State Drives (SSD)**.
- **Usage**:
    - Best for **I/O-intensive workloads** like databases or large applications.
    - Each VM can achieve up to **80,000 IOPS** and **2,000 MB/s throughput**.

#### **Multiple Disks for Large Storage**

- **Benefit**: Attach multiple storage disks to a VM to get up to **256 TB** of storage per VM.
- **Usage**: Ideal for applications needing high storage capacity and performance.

#### **Azure Managed Disks**

- **Description**: Azure-managed VHDs that simplify disk management.
    - Managed by Azure, so you don’t need to worry about underlying storage accounts or blob containers.
    - **Types of Managed Disks**:
        - **Ultra SSD**: Best for extremely high performance.
        - **Premium SSD**: For high-performance workloads.
        - **Standard SSD**: For lower-cost but still performant storage.
        - **Standard HDD**: For basic, cost-effective storage with lower performance.
- **Recommendation**: Use **managed disks** for easier management, especially when using single-instance VMs (required for SLA).

#### **Migrating to Premium Storage**

- **Why Migrate?**: If your VM disks require high IOPS, moving to **Premium Storage** can improve performance. For workloads with lower IOPS needs, you can use **Standard Storage** to save costs.

---

### **3. Summary of Key Points**

- **OS Disk**: Stores the operating system; don't store application data here.
- **Temporary Disk**: Used for temporary files; data is not persistent across redeployments.
- **Data Disk**: Used for application data; can attach multiple disks based on VM size.
- **Premium Storage**: For high-performance workloads needing fast read/write operations.
- **Managed Disks**: Simplifies disk management; Azure handles the storage for you.
- **Multiple Disks**: Attach several disks for large storage capacity and better performance.

By selecting the right disk types and understanding the storage options, you can ensure that your virtual machines are optimized for both performance and cost.