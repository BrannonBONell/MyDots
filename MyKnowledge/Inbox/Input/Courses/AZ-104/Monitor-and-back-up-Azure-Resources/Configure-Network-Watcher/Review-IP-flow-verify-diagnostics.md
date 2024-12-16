---
tags: azure cloud devops microsoft IP flow verify diagnostics
date: 19th-October-2024
---

# IP flow verify diagnostics

**Overview:** The IP Flow Verify feature in Azure Network Watcher helps troubleshoot network connectivity issues by verifying if a security rule (NSG) is blocking traffic to or from a virtual machine (VM).

![Screenshot of the IP flow verify feature in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-network-watcher/media/flow-verify-d136d78d.png)

---

### Key Configuration Details for IP Flow Verify:

- **Virtual Machine & Network Interface**: Select the VM and the associated network interface for testing.
- **Local (Source) Port**: The port number of the VM.
- **Remote (Destination) IP & Port**: The destination IP address and port number.
- **Communication Protocol**: Choose between TCP or UDP.
- **Traffic Direction**: Test either Inbound or Outbound traffic.

---

### How IP Flow Verify Works:

1. **Traffic Testing**: IP flow verify tests the communication between a VM and other resources by simulating network packets for the given configuration.
2. **Success or Failure**: It indicates whether the communication succeeds (access allowed) or fails (access denied).
3. **NSG Rules**: If the packet is denied, it provides the name of the specific Network Security Group (NSG) rule responsible for blocking the traffic.

---

### Benefits of Using IP Flow Verify:

- **Identify Blocking Rules**: Helps determine if an NSG is blocking traffic to or from the VM.
- **Security Rule Troubleshooting**: Simplifies troubleshooting by identifying which security rule is causing an issue.
- **Application of Security Rules**: Ensures your security rules are correctly applied to your virtual machines.

---

### Considerations:

- **Default Security Rules**: Azure applies default NSG rules that may allow or block traffic. These can be overridden or customized.
- **Broader Troubleshooting**: If IP flow verify indicates no NSG-related issues but the test still fails, explore other areas like firewall configurations.

---

### When to Use IP Flow Verify:

- When your VM cannot communicate with other resources (internal or external).
- To check if specific inbound or outbound traffic is blocked by NSG rules.