---
tags: azure cloud devops microsoft next hop diagnostics
date: 19th-October-2024
---

**Overview:** The Next Hop feature in Azure Network Watcher checks if traffic from a source is correctly routed to its intended destination. It allows you to identify the next connection point (next hop) in your network route, helping verify proper network configurations.

![Screenshot of the next hop feature in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-network-watcher/media/next-hop-d7dde5f6.png)

---

### Key Configuration Properties for Next Hop:

- **Subscription & Resource Group**: Define the Azure subscription and resource group.
- **Virtual Machine & Network Interface**: Select the VM and its network interface for the test.
- **Source IP Address**: The IP address from where traffic originates.
- **Destination IP Address**: (Optional) The IP address of the intended destination for testing reachability.

---

### How Next Hop Works:

- **Traffic Route Test**: The feature tests the next hop along the network path from the source to the destination IP.
    
- **Returns Three Key Items**:
    
    1. **Next Hop Type**: Example types include Internet, Virtual Network, or Virtual Network Service Endpoint.
    2. **Next Hop IP Address**: (If available) Displays the IP address of the next hop.
    3. **Route Table**: (If available) Shows the associated route table for the next hop.
- **User-Defined Route (UDR)**: If a UDR is present, it returns the UDR route; otherwise, the system route is shown.
    
- **Next Hop Type: None**: Indicates that a valid route might exist, but there's no next hop to route the traffic.
    

---

### Benefits of Using Next Hop:

- **Identify Unresponsive VMs**: Helps locate communication issues with virtual machines.
- **Troubleshoot Broken Routes**: Identifies where a traffic route might be broken.
- **Route Verification**: Confirms that traffic is being directed through the correct network path.

---

### When to Use Next Hop:

- When a virtual machine can no longer communicate with other resources.
- To verify the traffic path between a source and destination IP address.
- To resolve routing issues by removing, modifying, or adding routes.

---

### Considerations:

- **Default Routes**: Azure creates default outbound routes for network traffic. These can be overridden by custom routes or UDRs.
- **Use Cases**: The feature is useful for diagnosing issues in routing configuration, such as unreachable VMs or incorrect routes in a virtual network.