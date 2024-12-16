---
tags: microsoft azure devops cloud VM configure connect
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Connect to VMs

There are several ways to connect to your Azure Virtual Machines (VMs), depending on the operating system and your security requirements. Azure supports connections via **RDP**, **SSH**, and **Azure Bastion**, allowing you to securely manage and access your VMs.

![[Pasted image 20241014090444.png]]

---

### **1. Accessing Virtual Machines Using Azure Bastion**

- **Azure Bastion**: A fully managed platform service (PaaS) that provides secure and seamless RDP and SSH connections to your VMs **directly through the Azure portal**.
- **Key Features**:
    - **No public IP required**: Bastion eliminates the need to expose RDP or SSH ports to the internet.
    - **SSL Connectivity**: Securely connects using the browser over SSL.
    - **No Client Required**: You don’t need any additional software, agents, or clients—everything is done via the Azure portal.
- **Best for**: Secure, direct access to VMs within your virtual network without exposing them to the public internet.

---

### **2. Connecting to Windows-Based Virtual Machines**

![[Pasted image 20241014090500.png]]

- **RDP (Remote Desktop Protocol)**: The standard method for connecting to a Windows VM via the **Microsoft Remote Desktop** app.
- **Steps**:
    - **IP Address**: Specify the VM’s public IP address or DNS name.
    - **Download RDP File**: After configuring the connection, download the RDP file.
    - **Use RDP Client**: Open the file in your Remote Desktop app to connect.
- **Best for**: Establishing a GUI-based session to manage Windows VMs remotely.

---

### **3. Connecting to Linux-Based Virtual Machines**

![[Pasted image 20241014090512.png]]

- **SSH (Secure Shell Protocol)**: The standard method for connecting to Linux VMs. SSH provides an encrypted connection, ensuring secure access over unsecured networks.
- **Steps**:
    - **Public Key**: Add your public SSH key to the VM when configuring it.
    - **Private Key**: Keep your private SSH key on your local system.
    - **SSH Client**: Use an SSH client (like OpenSSH) to connect to the VM from your terminal or command line.
- **Key Point**: **Protect your private key**—never share it. You can safely share the public key, but the private key should remain secure on your machine.
- **Best for**: Secure, terminal-based access to manage Linux VMs.

---

### **4. Summary of Access Options**

- **Azure Bastion**: Best for secure, direct browser-based access without exposing public IPs.
- **RDP** (Windows VMs): Use the Microsoft Remote Desktop app to access Windows VMs through a graphical user interface.
- **SSH** (Linux VMs): Use an SSH client and public/private key pairs to securely access Linux VMs via the terminal.

Each method provides a secure way to access your Azure Virtual Machines, allowing you to manage your infrastructure efficiently based on your needs and operating system.