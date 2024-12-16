---
tags: microsoft azure devops cloud load balancer SKUs
date: 15th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Determine load balancer SKUs

**Overview**: When creating an Azure Load Balancer, you must choose between three SKU options: **Basic**, **Standard**, and **Gateway**. Each SKU offers different levels of features, scalability, and pricing. The **Standard SKU** is the most feature-rich and recommended for new designs, while the **Gateway SKU** is designed for high-performance scenarios involving third-party network virtual appliances (NVAs).

![Screenshot that shows how to create an Azure load balancer in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-load-balancer/media/load-balancer-types-a4c0eceb.png)
---

### **Key Points to Consider When Choosing a Load Balancer SKU**:

1. **Standard Load Balancer**:
    
    - The **Standard SKU** is the newest and most advanced option.
    - It offers **expanded and more granular features** compared to the **Basic SKU**.
    - It is recommended for new designs due to better features and flexibility.
2. **Basic Load Balancer**:
    
    - Suitable for **simple use cases** but has limited features compared to the Standard SKU.
    - Can be **upgraded to the Standard SKU**, but new deployments should consider starting with the Standard SKU.
3. **Gateway Load Balancer**:
    
    - Designed for scenarios involving **third-party network virtual appliances (NVAs)**.
    - Supports **high-performance and high-availability** use cases.

---

### **Feature Comparison Between Basic and Standard SKUs**:

|**Feature**|**Basic SKU**|**Standard SKU**|
|---|---|---|
|**Health Probes**|Supports **HTTP** and **TCP** probes.|Supports **HTTPS**, **HTTP**, and **TCP** probes.|
|**Availability Zones**|**Not available**.|Supports **zone-redundant** and **zonal frontends** for inbound/outbound traffic.|
|**Multiple Frontends**|**Inbound only** traffic is supported.|Supports both **inbound and outbound** traffic.|
|**Security**|**Open by default**, but optional NSG can be applied.|**Closed by default**, requires NSG to allow inbound traffic; internal traffic from VNet to load balancer allowed.|

---

### **Key Features of the SKUs**:

1. **Health Probes**:
    
    - **Basic SKU**: Supports only **HTTP** and **TCP** health probes.
    - **Standard SKU**: Adds support for **HTTPS** health probes, offering more secure monitoring.
2. **Availability Zones**:
    
    - **Basic SKU**: Does **not support availability zones**.
    - **Standard SKU**: Provides support for **zone-redundant** and **zonal deployments**, ensuring better resiliency for both inbound and outbound traffic.
3. **Multiple Frontends**:
    
    - **Basic SKU**: Supports **only inbound traffic**.
    - **Standard SKU**: Supports both **inbound and outbound traffic**, providing more flexibility for managing traffic.
4. **Security**:
    
    - **Basic SKU**: **Open by default** for inbound flows, though you can optionally use **Network Security Groups (NSGs)** to control traffic.
    - **Standard SKU**: **Closed by default** to inbound flows, meaning **NSGs** are required to allow inbound traffic. Internal traffic from virtual networks to internal load balancers is automatically allowed.

---

### **Recommendations**:

- For **new designs** and **advanced features**, use the **Standard SKU** for better flexibility, security, and scalability.
- Use the **Basic SKU** only for **simple use cases** where high performance or advanced features are not required.
- If you need to integrate **third-party network appliances** or require **high availability** for network virtual appliances, choose the **Gateway SKU**.

---

### **Summary**:

|**SKU**|**Use Case**|
|---|---|
|**Basic SKU**|For simple, basic load balancing with limited features and no need for advanced scalability.|
|**Standard SKU**|Recommended for most scenarios due to advanced features, better security, and availability zone support.|
|**Gateway SKU**|For high-performance and high-availability scenarios involving third-party network virtual appliances.|