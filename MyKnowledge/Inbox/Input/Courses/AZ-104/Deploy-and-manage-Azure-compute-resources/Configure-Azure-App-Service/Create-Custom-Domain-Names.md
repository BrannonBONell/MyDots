---
tags: microsoft azure cloud devops app service configure create custom domain names
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Create custom domain names

**Overview:** When you create an Azure web app, it is assigned a default subdomain (e.g., `contoso.azurewebsites.net`). For production use, you may want to configure a custom domain (e.g., `contoso.com`) to improve the user experience. Below are the steps to configure a custom domain in Azure App Service.

---

### **Steps to Configure a Custom Domain**:

1. **Reserve a Custom Domain Name**:
    
    - The easiest way to set up a custom domain is to **purchase the domain directly** in the Azure portal.
    - Managing the domain directly in Azure simplifies the process of associating it with your web app.
    - A custom domain replaces the default `*.azurewebsites.net` domain assigned by Azure.
2. **Create DNS Records**:
    
    - After obtaining your custom domain, configure **DNS records** to map the domain name to your Azure web app.
    - **Two types of DNS records** are typically used:
        - **A Record** (Address Record):
            - Maps the domain name directly to an IP address.
        - **CNAME Record** (Canonical Name):
            - Maps the domain name to another domain (e.g., `contoso.com` to `contoso.azurewebsites.net`).
            - **CNAME is preferred** because if the IP address changes, the mapping remains valid, unlike an A record that would need to be updated manually.
    - **Note**: Some domain registrars do not allow CNAME records for root domains, so in those cases, use an **A record**.
3. **Enable the Custom Domain**:
    
    - Once the DNS record is set up, go to the Azure portal to **validate** the custom domain and add it to your web app.
    - Ensure that your domain is properly configured and test it before going live.

---

### **Important Considerations**:

- **Paid Tier Requirement**: To map a custom domain to your app, your app must be on a **paid App Service plan** (Standard, Premium, etc.).
- **A Record vs. CNAME Record**:
    - **A Record**: Maps directly to the IP address of your web app. If the IP changes, you need to update the record.
    - **CNAME Record**: Maps to another domain (e.g., `*.azurewebsites.net`). This remains valid even if the IP address changes.
- **Validation and Testing**: After configuring the domain, always **validate the custom domain** in the Azure portal and test it thoroughly before publishing.

---

### **Summary of Steps**:

1. **Reserve a domain name** (either in Azure or from a third-party provider).
2. **Create DNS records** (A record or CNAME) to map the domain to your Azure web app.
3. **Enable and validate the custom domain** in the Azure portal.