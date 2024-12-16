---
tags: microsoft azure devop cloud VM cli 
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# What is the Azure CLI?

**Overview:** The **Azure CLI** is a powerful, cross-platform command-line tool that helps manage Azure resources like virtual machines, storage, networks, and more. It’s available for **macOS, Linux, Windows**, or directly in the browser via **Azure Cloud Shell**. This tool is commonly used by developers and Linux admins, but it's also an excellent choice for managing Azure resources efficiently, especially when handling multiple tasks.

---

### **Key Features of Azure CLI**:

1. **Cross-Platform**: Available on **Windows, macOS, Linux**, and **Azure Cloud Shell**.
2. **Scriptable**: Easily automate tasks through scripting, perfect for repetitive processes.
3. **Efficient Management**: You can manage resources quickly through commands, without the need for the Azure portal.

---

### **Learning Objectives**:

1. **Create a Virtual Machine**:
    
    - Use Azure CLI to **create a virtual machine** in Azure, specifying details like OS type, size, and network settings.
2. **Resize Virtual Machines**:
    
    - Change the size or resource allocation of existing virtual machines.
3. **Perform Basic Management Tasks**:
    
    - Execute common management tasks like starting, stopping, or deleting virtual machines.
4. **Connect to a VM with SSH**:
    
    - Connect to Linux VMs using **SSH** directly from the CLI.

---

### **Basic Azure CLI Commands for Virtual Machines**:

1. **Create a Virtual Machine**:
    
    bash
    
    Copy code
    
    `az vm create \   --resource-group <resource-group-name> \   --name <vm-name> \   --image UbuntuLTS \   --admin-username <username> \   --generate-ssh-keys`
    
    - Creates a new VM with an Ubuntu OS image and SSH keys for authentication.
2. **Resize a Virtual Machine**:
    
    bash
    
    Copy code
    
    `az vm resize \   --resource-group <resource-group-name> \   --name <vm-name> \   --size Standard_DS2_v2`
    
    - Resizes the VM to a new size (in this case, `Standard_DS2_v2`).
3. **Start a Virtual Machine**:
    
    bash
    
    Copy code
    
    `az vm start --name <vm-name> --resource-group <resource-group-name>`
    
    - Starts a stopped VM.
4. **Stop a Virtual Machine**:
    
    bash
    
    Copy code
    
    `az vm stop --name <vm-name> --resource-group <resource-group-name>`
    
    - Stops a running VM.
5. **Connect to a Virtual Machine with SSH**:
    
    bash
    
    Copy code
    
    `ssh <username>@<public-ip-address>`
    
    - SSH into the VM using the public IP address.

---

### **Benefits of Using Azure CLI**:

- **Efficiency**: Execute tasks quickly, especially when managing multiple Azure resources.
- **Automation**: Use scripts to automate repetitive tasks, reducing human error.
- **Cross-Platform**: Works across operating systems, giving flexibility to users.
- **Direct VM Access**: Use **SSH** to directly connect to virtual machines for configuration changes.