---
tags: microsoft azure az-900 study 
date: 9th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

## Cloud Concepts and Models

- **Cloud Principles**:
    - Cloud computing provides agility, scalability, and high availability with consumption-based pricing, allowing users to scale services based on demand and only pay for what they use.
    - **Public, Private, and Hybrid Clouds**:
        - **Public Cloud**: Shared infrastructure, such as Azure.
        - **Private Cloud**: Dedicated infrastructure for one organization.
        - **Hybrid Cloud**: Combines public and private clouds, offering flexibility.

### Types of Cloud Services

- **Infrastructure as a Service (IaaS)**:
    
    - Provides virtual machines (VMs) where users are responsible for OS and app management, while Azure manages the infrastructure.
- **Platform as a Service (PaaS)**:
    
    - Services like Azure App Service allow users to focus on applications while Azure handles underlying infrastructure and scalability.
- **Software as a Service (SaaS)**:
    
    - Fully managed solutions like Office 365, where users only interact with the software.

### Azure Regions and Availability Zones

- **Azure Regions**:
    - Physical locations around the world where Azure services are available.
- **Availability Zones**:
    - Data centers within regions designed for high availability. Spreading services across zones helps ensure resilience.

### Azure Core Services

- **Virtual Machines (VMs)**:
    
    - Customizable, scalable, and used for various workloads. They can be scaled using Virtual Machine Scale Sets (VMSS) to handle changing loads.
- **Azure App Service**:
    
    - A PaaS offering for building and hosting web apps, mobile backends, and RESTful APIs with support for multiple languages (.NET, Java, Node.js, etc.).
- **Azure Kubernetes Service (AKS)**:
    
    - A managed Kubernetes service for deploying, managing, and scaling containerized applications.

### Serverless Computing

- **Azure Functions**:
    
    - Event-driven, serverless compute where users only pay for actual usage. Common triggers include HTTP requests, timers, or messages.
- **Logic Apps**:
    
    - A no-code/low-code tool to automate workflows, using a visual designer and pre-built connectors to integrate services like APIs or databases.

### Cost Management and Billing

- **CapEx vs OpEx**:
    
    - Traditional on-premises infrastructure involves capital expenditure (CapEx), while cloud services use operational expenditure (OpEx), meaning you pay based on consumption.
- **Azure Pricing Models**:
    
    - Azure uses a consumption-based pricing model. Azure Cost Management tools help optimize and monitor costs.

### Security and Governance

- **Role-Based Access Control (RBAC)**:
    
    - Ensures users have the appropriate level of access to resources, based on roles and responsibilities.
- **Azure Policy**:
    
    - Used to enforce organizational standards and compliance by defining rules that resources must comply with (e.g., specific VM sizes or regions).

### Networking Basics

- **Virtual Networks (VNet)**:
    - Isolated networks that enable Azure resources to securely communicate with each other, the internet, or on-premises environments.
- **Subnets**:
    - Used to segment virtual networks and allocate IP address spaces to various Azure services.

This summary focuses on fundamental cloud concepts, service models, cost management, and security practices, crucial for understanding the AZ-900 Azure Fundamentals exam content.

## Serverless Computing

- **Serverless Overview**: In serverless, you don’t manage infrastructure (VMs), but instead pay only for the amount of work done.
    - **Azure Functions**: Supports multiple programming languages, allows running small pieces of code that are event-driven (e.g., HTTP requests, timers).
    - **Logic Apps**: A no-code/low-code automation platform for integrating systems using built-in connectors like Azure Storage, Salesforce, and Office 365.

### Azure Virtual Desktop (AVD)

- **Azure Virtual Desktop**: Provides secure, remote access to virtualized desktop environments and apps. It's especially useful for remote work scenarios, enabling users to work from anywhere with the same desktop experience.
    - Users can connect via VMs that are highly customizable, with multi-session options unique to Azure, allowing multiple users to access a single machine.

### Secure Access and Key Management

- **Azure Key Vault**:
    - Stores secrets (e.g., passwords, connection strings), keys (cryptographic keys), and certificates.
    - Provides role-based access control (RBAC) to manage access at individual secret or key levels.
    - Integrates with managed identities to securely access resources without exposing credentials in code.

### Azure Networking Basics

- **Virtual Networks (VNets)**: VNets connect Azure resources and allow secure communication between them and on-premises environments. They can be segmented using **subnets** to manage IP addresses.
    
    - Each VNet is confined to a single Azure region, but VNets can be peered for cross-region communication.
- **Network Security Groups (NSGs)**: Control the flow of traffic in and out of Azure subnets or VMs using rules based on IP addresses, ports, and protocols.
    

### Connectivity and Security

- **Site-to-Site VPN**:
    
    - Connects on-premises networks to Azure over the public internet via an encrypted tunnel.
    - Supports dynamic routing (route-based VPNs) for better flexibility and connectivity.
- **ExpressRoute**:
    
    - Provides a private, high-speed connection between on-premises infrastructure and Azure, bypassing the public internet for enhanced security and performance.
- **Azure Firewall**:
    
    - A managed network security service offering layer 4 (network layer) and layer 7 (application layer) protections.
    - Capable of inspecting, filtering, and routing traffic based on fully qualified domain names (FQDNs), URLs, and SSL.

### Distributed Denial of Service (DDoS) Protection

- **DDoS Protection**:
    - **Basic DDoS Protection**: Enabled by default for all Azure public IP addresses, automatically deflecting large-scale attacks.
    - **Standard DDoS Protection**: Provides enhanced, AI-driven mitigation strategies tailored to your specific Azure environment, particularly useful for protecting sensitive workloads.

This segment focused on serverless computing services, virtual desktop setups, secure management of keys and secrets, networking concepts like VNets and NSGs, and Azure’s options for secure connectivity and DDoS protection. These topics are essential for understanding how to securely manage and scale applications in Azure.

## Security and Network Protection

- **Network Security**:
    
    - Use **network security groups (NSG)** to control traffic flow.
    - Deny communication by default and only allow necessary traffic.
    - Prioritize **private connectivity** like VPN or **ExpressRoute** for added security.
- **Compute Security**:
    
    - Offload responsibilities when possible (e.g., use PaaS).
    - If managing VMs, ensure **OS patching**, **antivirus**, and **firewalls** are in place.
- **Application and Data Security**:
    
    - Protect applications from vulnerabilities like **SQL injection attacks**.
    - Encrypt data both **at rest** and **in transit** using methods like **bring-your-own-key (BYOK)**.

### Security Layers and CIA Triad

- **CIA Triad**:
    - **Confidentiality**: Ensure **least privilege access** and **just-in-time access**.
    - **Integrity**: Use **signatures** to validate data changes.
    - **Availability**: Protect against **denial of service (DoS)** attacks.

### Microsoft Defender for Cloud

- Formerly known as **Azure Security Center**.
- Provides a **security score** and helps maintain regulatory **compliance**.
- Enhanced features include **just-in-time access**, **adaptive controls**, and protection for non-Azure resources.

### Azure Sentinel

- A **Security Information and Event Management (SIEM)** tool.
- **Ingests logs** from various services and applies **machine learning** to detect security issues.
- Includes **Security Orchestration and Automated Response (SOAR)** for automated incident responses (e.g., disabling a compromised account).

### Key Study Advice

- Focus on understanding **Azure services and their use cases**.
- Eliminate obviously incorrect options in exams to make educated guesses.
- Review weak areas identified in practice exams and use comprehensive resources like the 8-12 hour courses provided.