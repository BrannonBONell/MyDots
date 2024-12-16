---
tags: azure cloud devops microsoft DNS host domain
date: 16th-October-2024
---

# Configure azure DNS to host your domain

Azure DNS allows you to host and manage both **public** and **private** DNS zones, making it easier to configure DNS records for domain resolution. This note walks you through the steps involved in setting up Azure DNS for your domain, wideworldimports.com, using public and private DNS zones.

---

### **1. Steps to Create and Configure a Public DNS Zone in Azure**

#### **Step 1: Create a DNS Zone in Azure**

- Use **Azure DNS** to host the domain wideworldimports.com.
- Provide details like:
    - **Subscription**: The Azure subscription to use.
    - **Resource Group**: Where the DNS zone will be stored.
    - **Name**: The domain name, e.g., wideworldimports.com.

#### **Step 2: Get Azure DNS Name Servers**

- After creating the DNS zone, Azure will provide **name server (NS) details**.
- You will use these NS details to update your domain registrar’s information.

#### **Step 3: Update Domain Registrar Settings**

- Sign in to your **domain registrar's** management application.
- Change the NS record to match Azure’s **name server details**.
- Use all four NS servers provided by Azure for **domain delegation**.

#### **Step 4: Verify Domain Delegation**

- Use **nslookup** or similar tools to verify domain delegation by querying the **SOA (Start of Authority)** record:
    
    bash
    
    Copy code
    
    `nslookup -type=SOA wideworldimports.com`
    

#### **Step 5: Configure Custom DNS Settings**

- You can configure **A Records** or **CNAME Records** in the DNS zone:
    - **A Record**: Maps a name (e.g., webserver1) to an IP address.
    - **CNAME Record**: Creates an alias (e.g., [www.wideworldimports.com](http://www.wideworldimports.com)) to another domain name (wideworldimports.com).

---

### **2. Steps to Create and Configure a Private DNS Zone in Azure**

**Private DNS zones** are used for internal DNS name resolution within your **Azure virtual networks**. These zones are not visible on the public internet.

#### **Step 1: Create a Private DNS Zone**

- In the Azure portal, search for **Private DNS Zones** and create a new private zone (e.g., private.wideworldimports.com).

#### **Step 2: Identify Virtual Networks**

- Identify the **virtual networks (VNets)** and **virtual machines (VMs)** that need DNS name resolution within your private DNS zone.

#### **Step 3: Link Virtual Networks to a Private DNS Zone**

- Create a **virtual network link** to connect your private DNS zone to the identified virtual networks.
- For each VNet, add a virtual network link in the private DNS zone settings.

---

### **Summary of Key Points**

- **Public DNS Zones**: Used to manage DNS records for your domain (e.g., wideworldimports.com). Requires updating the NS records with your domain registrar.
- **Private DNS Zones**: Used for internal DNS name resolution in Azure virtual networks. No domain registrar is required.
- **A Records**: Map a name to an IP address.
- **CNAME Records**: Create an alias for another domain name.
- **Virtual Network Links**: Used to link private DNS zones to virtual networks for name resolution.

By following these steps, you can manage both public and private DNS zones effectively using **Azure DNS**.