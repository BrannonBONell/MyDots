---
tags: azure cloud devops microsoft dynamically resolve resource alias record
date: 16th-October-2024
---

# Dynamically resolve resource name by using alias record

In the previous steps, we delegated the domain **wideworldimports.com** to Azure DNS and set up an **A record** to connect the domain to a web server. Now, to improve resiliency, we will use a **load balancer** and link the **apex domain** to it using **alias records**.

---

### **1. Understanding the Apex Domain**

- The **apex domain** (also known as the **root domain** or **zone apex**) is the highest level of a domain, such as **wideworldimports.com**.
- In DNS records, the **@ symbol** often represents the apex domain.
- **NS (Name Server)** and **SOA (Start of Authority)** records are automatically created for the apex domain when you create a DNS zone.

---

### **2. CNAME Records and Apex Domains**

- **CNAME records** cannot be used at the **zone apex**. CNAME records can only alias subdomains (e.g., **[www.wideworldimports.com](http://www.wideworldimports.com)**), not the apex domain itself.

---

### **3. What Are Alias Records?**

- **Alias records** allow the **apex domain** to reference other **Azure resources** (like a load balancer) directly from the DNS zone.
- Alias records do not rely on IP addresses, so if an IP address changes, the DNS record is automatically updated.

#### **Supported Azure Resources for Alias Records**

- **Traffic Manager profiles**
- **Azure Content Delivery Network (CDN) endpoints**
- **Public IP resources**
- **Azure Front Door profiles**

#### **Alias Record Types Supported in DNS Zones**

- **A Record**: Maps the domain to an IPv4 address.
- **AAAA Record**: Maps the domain to an IPv6 address.
- **CNAME Record**: Links an alias domain to another domain name.

---

### **4. Advantages of Using Alias Records**

1. **Prevents Dangling DNS Records**:
    
    - Alias records prevent broken DNS records by keeping the DNS zone automatically up to date with any changes in resource IP addresses.
2. **Automatic Updates for IP Address Changes**:
    
    - When the IP address of the resource (such as a load balancer) changes, the alias record updates the associated DNS record automatically.
3. **Hosts Load-Balanced Applications at the Zone Apex**:
    
    - Allows you to route traffic to **load-balanced applications** at the apex domain by linking the apex domain to Azure resources like a **Traffic Manager** or **load balancer**.
4. **Directly Points to Azure CDN Endpoints**:
    
    - You can directly reference an **Azure CDN instance** using alias records, simplifying routing at the apex domain.

---

### **5. Summary of Key Points**

- **Apex Domain**: The highest level of the domain (e.g., wideworldimports.com) often represented by the **@ symbol** in DNS records.
- **Alias Records**: Allow the apex domain to reference Azure resources like **load balancers**, **Traffic Manager profiles**, and **CDN endpoints**.
- **Automatic Updates**: Alias records automatically refresh DNS records when the underlying IP of the resource changes, preventing broken records.
- **Resiliency**: By using alias records, you can ensure that your **apex domain** stays linked to resilient, load-balanced Azure resources.

In this way, alias records enable you to link your **apex domain** to a load balancer and other Azure services efficiently, ensuring resilience and automatic updates.