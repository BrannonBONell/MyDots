---
tags: microsoft azure devops cloud app service plan pricing
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Azure App Service Plan Pricing

**Overview:** The pricing tier of an Azure App Service plan determines available features, scaling options, and the cost of running applications. There are six pricing tiers with different features designed to meet various application needs from development to mission-critical production workloads.

#### **App Service Plan Pricing Tiers**:

|**Feature**|**Free**|**Shared**|**Basic**|**Standard**|**Premium**|**Isolated**|
|---|---|---|---|---|---|---|
|**Usage**|Dev, Testing|Dev, Testing|Dev, Testing|Production|Enhanced Performance|High Performance, Security|
|**Web, mobile, or API apps**|10|100|Unlimited|Unlimited|Unlimited|Unlimited|
|**Disk Space**|1 GB|1 GB|10 GB|50 GB|250 GB|1 TB|
|**Auto Scale**|No|No|No|Yes|Yes|Yes|
|**Deployment Slots**|n/a|n/a|n/a|5|20|20|
|**Max Instances**|n/a|n/a|Up to 3|Up to 10|Up to 30|Up to 100|

---

#### **Tiers Breakdown:**

1. **Free & Shared** (Development & Testing):
    
    - **Usage**: Limited, non-production workloads.
    - **Web Apps**: Free tier supports 10, Shared supports 100.
    - **Disk Space**: 1 GB.
    - **Scaling**: No autoscaling, limited to shared infrastructure.
    - **Purpose**: Ideal for testing, proof-of-concept applications.
    - **SLA**: No Service Level Agreement (SLA).
2. **Basic** (Dedicated Development & Testing):
    
    - **Usage**: Dedicated environments for development or low-traffic production applications.
    - **Disk Space**: 10 GB.
    - **Scaling**: No autoscale, up to 3 instances.
    - **Features**: Supports built-in load balancing and Web App for Containers.
    - **Purpose**: Suitable for small workloads or simple web apps with moderate traffic.
3. **Standard** (Production Workloads):
    
    - **Usage**: Production applications with moderate traffic.
    - **Disk Space**: 50 GB.
    - **Scaling**: Supports autoscaling up to 10 instances.
    - **Deployment Slots**: Up to 5 deployment slots for staging and testing.
    - **Features**: Load balancing and support for Web App for Containers.
    - **Purpose**: Designed for running production workloads with scaling needs.
4. **Premium** (Enhanced Scale & Performance):
    
    - **Usage**: High-performance production applications.
    - **Disk Space**: 250 GB.
    - **Scaling**: Autoscaling up to 30 instances, faster processors (Dv2-series), SSD storage.
    - **Deployment Slots**: Up to 20 slots.
    - **Purpose**: Ideal for large-scale apps that need faster VMs and more capacity than the Standard tier.
5. **Isolated** (Mission Critical, High Security):
    
    - **Usage**: Mission-critical applications requiring isolation and enhanced security.
    - **Disk Space**: 1 TB.
    - **Scaling**: Autoscaling up to 100 instances, can request more if needed.
    - **Environment**: Runs in a private, dedicated Azure datacenter environment (App Service Environment).
    - **Purpose**: Suitable for high-security, high-performance, mission-critical workloads.

---

#### **Choosing the Right Tier**:

- **Development & Testing**: Use **Free** or **Shared** tiers for light, non-production workloads.
- **Small Production Workloads**: **Basic** is ideal for applications with low traffic.
- **Production Workloads**: **Standard** offers autoscaling and load balancing for moderate traffic.
- **High-Performance Needs**: **Premium** offers faster VMs and larger scaling for high-demand apps.
- **Mission Critical**: **Isolated** provides dedicated resources, high security, and scaling for sensitive, large-scale apps.