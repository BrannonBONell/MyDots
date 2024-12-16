---
tags: microsoft azure cloud devops service endpoint services
date: 15th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Determine service endpoint services

Adding **service endpoints** to your virtual network enhances security and performance by enabling direct, private access to Azure services from your virtual network. Here's a summary of key points about adding service endpoints for different Azure services.

![[Pasted image 20241015005850.png]]
---

### **1. Overview of Adding Service Endpoints**

- **Azure Portal Configuration**: In the Azure portal, you can easily add a service endpoint by selecting the service for which you want to create the endpoint (e.g., Azure Cosmos DB, Event Hubs, SQL Database).
- **Service Integration Time**: Adding service endpoints may take up to **15 minutes** to complete.

---

### **2. Key Azure Services with Service Endpoints**

|**Service**|**Availability**|**Description**|
|---|---|---|
|**Azure Storage**|Generally available in all regions|Provides optimal traffic routing to the Azure Storage service. Each storage account supports up to **100 virtual network rules**.|
|**Azure SQL Database & Data Warehouse**|Generally available in all regions|Allows you to control access to **Azure SQL** databases via firewall rules that permit communication from specific subnets in your virtual network.|
|**Azure Database for PostgreSQL & MySQL**|Available in regions with database services|Extends your virtual network's private address space to Azure Database for PostgreSQL and MySQL servers, securing communication between your VNet and these databases.|
|**Azure Cosmos DB**|Generally available in all regions|Allows **Azure Cosmos DB** to restrict access to specific subnets. Once the endpoint is enabled, you can limit access to only the specified subnet.|
|**Azure Key Vault**|Generally available in all regions|Restricts access to **Key Vault** from a specific virtual network or list of **IPv4 address ranges**, denying all other sources.|
|**Azure Service Bus & Event Hubs**|Generally available in all regions|Provides secure access to **Service Bus** and **Event Hubs** messaging capabilities from workloads in virtual networks. Secures the network traffic path at both ends.|

---

### **3. Key Benefits of Service Endpoints**

- **Improved Security**: You can restrict access to Azure services to only the private IP addresses in your virtual network, eliminating the need for public IP addresses.
- **Optimal Routing**: Traffic to Azure services is routed through the **Microsoft Azure backbone network**, providing a faster and more secure connection.

---

### **4. Summary of Key Points**

- **Easy Setup**: Service endpoints can be added to your virtual network from the Azure portal.
- **Time to Integrate**: Adding an endpoint may take up to **15 minutes**.
- **Enhanced Security**: Restrict access to services such as **Azure SQL**, **Azure Storage**, **Cosmos DB**, and others by using **virtual network rules**.
- **Direct Routing**: Traffic from your virtual network to these services is securely routed through the Azure backbone.