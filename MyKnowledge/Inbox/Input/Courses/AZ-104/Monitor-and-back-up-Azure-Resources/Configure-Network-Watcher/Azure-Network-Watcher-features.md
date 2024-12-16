---
tags: azure cloud devops microsoft network watcher
date: 19th-October-2024
---

# Azure Network Watcher features

**Overview:** Azure Network Watcher is a regional service that provides tools to monitor, diagnose, view metrics, and enable or disable logs for resources in an Azure virtual network. It helps with network monitoring, troubleshooting, and security auditing.

![Screenshot of the Network Watcher Get Started page in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-network-watcher/media/network-watcher-861659e0.png)

---

### Key Features of Network Watcher:

| Feature                     | Description                                                                 | Scenarios                                                                                                               |
| --------------------------- | --------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| **IP Flow Verify**          | Diagnose connectivity issues related to traffic flow.                       | Identify if a security rule is blocking traffic to or from a virtual machine, troubleshoot ingress/egress issues.       |
| **Next Hop**                | Analyze network routing configurations and view next connection points.     | Confirm if traffic reaches its intended target and review route tables.                                                 |
| **VPN Troubleshoot**        | Diagnose issues related to virtual network gateways or VPN connections.     | View VPN gateway diagnostics, including connection statistics, CPU/memory usage, IKE security errors, and packet drops. |
| **NSG Diagnostics**         | Use NSG flow logs to map IP traffic through network security groups (NSGs). | Meet compliance and auditing requirements, analyze security, and review effective NSG rules for virtual machines.       |
| **Connection Troubleshoot** | Check TCP or ICMP connection between network resources.                     | Troubleshoot performance issues and connectivity from VMs, application gateways, or Azure Bastion hosts.                |

---

### Important Considerations for Network Watcher:

- **Remote Monitoring:** Automate packet capture to diagnose issues without logging into VMs.
- **Alert Notifications:** Set alerts to trigger packet capture, providing real-time performance insights at the packet level.
- **NSG Flow Log Diagnosis:** Use NSG flow logs to understand traffic patterns and meet compliance and security auditing needs.
- **Log Analysis:** Analyze VPN Gateway and connection issues using generated logs for detailed troubleshooting.

---

### Roles Required for Network Watcher:

To use Network Watcher, you must have one of these roles:

- **Owner**
- **Contributor**
- **Network Contributor**

Custom roles must allow reading, writing, and deleting the Network Watcher service.