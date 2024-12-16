---
tags: microsoft azure devops cloud create winidows VM
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Create a Windows VM in Azure

**Overview:** Azure Virtual Machines (VMs) are on-demand, scalable cloud computing resources that allow you to run virtualized operating systems and applications. They provide flexibility similar to Hyper-V virtual machines but are hosted in the cloud. You can create, manage, and interact with VMs through the **Azure portal**, **Azure CLI**, **PowerShell**, or **Azure Resource Manager templates**.

![Screenshot showing the Azure Marketplace list of Virtual Machines.](https://learn.microsoft.com/en-us/training/modules/create-windows-virtual-machine-in-azure/media/2-marketplace-vm-choices.png)

---

### **Key Components of Azure VMs**:

1. **Virtual Machine (VM)**:
    
    - The core resource that provides CPU, memory, storage, and networking resources.
2. **Azure Storage Account**:
    
    - Holds the **virtual hard disks (VHDs)** that represent the VM's physical disks (OS and data).
3. **Virtual Disks**:
    
    - **OS disk**: Holds the operating system (C: drive, max 2048 GB).
    - **Temporary disk**: Provides temporary storage for apps/OS (D: drive); **not persistent**.
4. **Virtual Network (VNet)**:
    
    - Connects the VM to Azure services or on-premises networks. VNets act like a private network and can have **subnets** to organize and isolate resources.
5. **Network Interface**:
    
    - Allows communication between the VM and the VNet.
6. **Public IP Address (Optional)**:
    
    - Allows external access to the VM for services like **Remote Desktop Protocol (RDP)**.
7. **Resource Group**:
    
    - A logical container to manage and organize related Azure resources (VM, disks, network, etc.).

---

### **Steps to Create an Azure VM**:

1. **Choose the Creation Method**:
    
    - **Azure Portal**: Simple UI-based approach.
    - **Azure CLI / PowerShell**: Script-based creation for automation.
    - **Azure Resource Manager Template**: Define VM resources in JSON to automate deployment.
2. **Select a VM Image**:
    
    - The **image** is a template that includes the OS and optionally other software.
    - Examples include Windows Server, Linux distributions, and preconfigured software stacks (e.g., ASP.NET Core).
    - You can also upload custom images to match specific requirements.
3. **Size the VM**:
    
    - VM sizes determine processing power, memory, and max storage capacity.
    - **VM Size Categories**:
        - **General use** (B, Dsv3, DSv2): Web servers, small databases, testing, and development.
        - **Compute-heavy** (Fsv2, Fs): Medium-traffic servers, network appliances, batch processing.
        - **Memory-heavy** (Esv3, M): Large databases, caching, in-memory analytics.
        - **Storage-intensive** (Ls): Big Data, SQL/NoSQL databases needing high I/O.
        - **Graphics-intensive** (NV, NC): Video rendering, deep learning, AI model training.
        - **High-performance computing (HPC)** (H): Advanced computational tasks.
    - **VM Quota Limits**: Each subscription has a **20-core limit** per region, which can be increased via a request.
4. **Choose Storage Options**:
    
    - **Disk Technology**: Select between **HDD** (cost-efficient) and **SSD** (better performance).
        - **Standard SSD**: For typical workloads that need better performance than HDD.
        - **Premium SSD**: For I/O-intensive or mission-critical workloads.
    - **Virtual Hard Disks (VHDs)**:
        - **OS disk**: Your primary disk (C: drive).
        - **Temporary disk**: Provides temporary storage but **data is not persistent**.
        - **Data Disks**: Dedicated disks for app data (up to 32,767 GiB per disk).
5. **Unmanaged vs. Managed Disks**:
    
    - **Unmanaged Disks**:
        - You manage the **storage account**.
        - Limited to **20,000 I/O operations/sec** per storage account.
        - Multiple storage accounts needed for large-scale deployments.
    - **Managed Disks** (Recommended):
        - Azure manages the storage and handles scaling.
        - Simplifies storage management with no need to worry about storage limits.
        - Offers **snapshots** and **backup** support for disaster recovery.
        - Provides **role-based access control (RBAC)** for better security.

---

### **Network Configuration**:

1. **Virtual Networks (VNet)**:
    
    - VMs communicate with external services via VNets.
    - A **VNet** is like a private network, which can be divided into **subnets** to isolate and organize resources.
    - **Traffic Rules**: You can apply rules to control inbound and outbound traffic.
2. **Plan the Network**:
    
    - When creating a VM, you can either create a new VNet or select an existing one.
    - It’s better to **plan your network** in advance, especially for complex architectures, to ensure secure and efficient communication.

---

### **Best Practices for VM Management**:

1. **Use Managed Disks**:
    
    - Managed disks are easier to scale and manage, providing increased **reliability** and **security**.
    - They support **snapshots** for backups and allow for automatic disaster recovery.
2. **Network Planning**:
    
    - Plan the VNet and **subnet structure** before creating VMs to ensure proper isolation and traffic control.
3. **Choose Appropriate VM Size**:
    
    - Pick the right size based on workload needs to avoid overspending or performance bottlenecks.
4. **Backup and Snapshot**:
    
    - Use **snapshots** to back up managed disks for disaster recovery or troubleshooting. You can quickly restore or replicate VMs using snapshots.

---

### **Advanced Storage and Networking**:

1. **Data Disks**:
    
    - Attach multiple data disks to scale storage for large datasets (up to 32,767 GiB per disk).
    - Data disks are ideal for storing app data and separating it from the OS disk for better performance and management.
2. **Network Isolation**:
    
    - Use **subnets** to isolate different parts of your application architecture, such as separating databases from web servers for better security.

---

### **Summary**:

- **VM Creation**: You can create VMs via the Azure Portal, Azure CLI, PowerShell, or ARM templates.
- **VM Image**: Select an image template (Windows, Linux, etc.) from the Azure Marketplace or upload custom images.
- **Sizing**: Choose an appropriate VM size based on the workload (e.g., general computing, graphics, high-performance computing).
- **Storage Options**: Choose between HDD or SSD, and decide whether to use managed or unmanaged disks (managed is recommended for simplicity).
- **Network Setup**: Plan your virtual network structure in advance and apply traffic rules to manage communication between Azure resources and external networks.

![[Pasted image 20241014181813.png]]