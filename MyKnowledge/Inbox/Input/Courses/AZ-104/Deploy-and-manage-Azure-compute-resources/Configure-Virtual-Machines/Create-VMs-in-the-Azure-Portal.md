---
tags: microsoft azure cloud devops configure VM create azure portal
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Create VMs in the Azure portal

When creating a **Virtual Machine (VM)** in the Azure portal, the process begins with selecting an **image** and configuring the VM's basic settings, including disks, networking, and management options. Here's a quick guide to understanding each step.

---

### **1. Choosing the Virtual Machine Image**

- **Image Selection**: Azure supports both **Windows** and **Linux** operating systems, with a variety of server and client platforms.
- **Azure Marketplace**: You can search the **Azure Marketplace** for additional images, including pre-configured ones with applications like **WordPress**, **LAMP stacks**, or **custom software setups**.

![[Pasted image 20241014090234.png]]

---

### **2. Configuration Process in the Azure Portal**

The Azure portal guides you through the following configuration steps to create a VM:

![[Pasted image 20241014090242.png]]

#### **Basics Tab**

- **Project Details**: Choose the subscription, resource group, and VM name.
- **Administrator Account**: Set the username and password/SSH key for accessing the VM.
- **Inbound Port Rules**: Configure inbound ports (like RDP for Windows, SSH for Linux) to control access to the VM.

#### **Disks Tab**

- **OS Disk Type**: Select the type of disk for the operating system (Standard HDD, Standard SSD, Premium SSD).
- **Data Disks**: Add and configure additional data disks for storing application data.

#### **Networking Tab**

- **Virtual Network (VNet)**: Choose or create a virtual network for the VM.
- **Load Balancing**: Configure load balancing options if needed for multiple VMs.

#### **Management Tab**

- **Automatic Shutdown**: Enable automatic shutdown for cost-saving.
- **Backup**: Specify backup policies to protect VM data.

#### **Advanced Tab**

- **Extensions**: Add VM extensions, like **custom scripts** or **configuration agents**, to automate tasks or customize the VM.

#### **Monitoring Tab**

- **Monitoring Tools**: Enable or configure **Azure Monitor** and diagnostic settings to monitor VM performance and health.

#### **Tags Tab**

- **Tagging**: Add **tags** to organize and categorize the VM (e.g., by department or project).

---

### **3. Summary of Key Steps for Creating an Azure VM**

1. **Choose an Image**: Select from Windows, Linux, or Marketplace images.
2. **Configure Basic Settings**: Set project details, administrator credentials, and ports.
3. **Select Disk Types**: Choose an OS disk and add optional data disks.
4. **Set Up Networking**: Configure virtual networks and load balancers if needed.
5. **Enable Management Options**: Set automatic shutdown and backup policies.
6. **Add Extensions**: Customize with scripts or agents for automation.
7. **Monitor and Tag**: Enable monitoring tools and categorize your VM with tags.

By following these steps, you can easily create and configure virtual machines in Azure for various workloads, ensuring optimal performance and management.