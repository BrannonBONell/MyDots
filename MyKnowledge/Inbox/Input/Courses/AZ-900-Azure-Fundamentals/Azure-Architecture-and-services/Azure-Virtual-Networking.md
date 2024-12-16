---
tags: azure microsoft virtual networking cloud devops
date: 01-10-2024
---

# Azure Virtual Networks

- virtual networks and virtual subnets enagble Azure resources
	- VMs web apps databases
		- To communicate with each other with users on the internet and with your on-site client computers
	- Think of an Azure network as an extension of your on-site network with resources that link other Azure resources

-  Azure virtual networks provide the following key capabilitites:
	- Isolation and segmentation
	- Internet communications
	- Communicate between Azure resources
	- Comminicated with on-site resource
	- Reoute network traffic
	- Filter network traffic
	- Connect virtual networks

- Azure virtual networking supports both public and private endpoints to enable communication between external or internal resources with other internal resources
	- Public endpoints have a public IP address and can be accessed from anywhere in the world
	- Private endpoints exist within a virtual network and have a private IP address from within the address space of that virtual network

# Isolation and segmenatation

- Azure virtual network allows to create multiple isolated networks
- Set up a virtual network
	- you define a private IP address space by using either public or private IP address ranges
	- The IP range only is within the virtual network and is not internet routable.
	- You can divide that IP address space into subnets and put part of the defined address space to each named subnet.
- For name resolution you can use the name resolution service built into Azure
	- You also can configure the virtual network to use internal or an external DNS server
# Internet Communications

- You can enable incoming connections from the internet by assigning a public IP address to an Azure resource, or putting the resource behind a public load balancer.

# Communicate Between Azure resources

- You want to enable Azure resources to communicate securely with each other
- There is one of two ways
	- Virtual networks can connect not only VMs but other Azure resources such as the App Service Environment for Power Apps, Azure Kubernetes Service, and Azure VM scale sets
	- Service endpoints can connect to other Azure resource  types, such as Azure SQL databases and storage accounts
		- This approach enables you to link multiple Azure resources to virtual networks to improve security and provide optimal routing between resources.

# Communicate with on-site Resources

- Azure virtual networks enable
	- To link resources together in your onsite environment and within your Azure subscription.
- Can create a network that spans both your local and cloud
	- There are three mechanisms for you toe achieve this
	- Point-to-site virtual private network connections are from a computer outside your originating back into your corporate network
		- In this case, the client computer initiates an encrypted VPN connection to connect to the Azure virtual network
	- Site-to-site virtual private networks link your onsite VPN device or gateway to the Azure VPN gateway in the virtual network
		- The devices in Azure can appear as being on the local network.  The connection is encrypted and works over the internet
	- Azure ExpressRoute provides a dedicated private connectivity to Azure that doesn't travel over the internet
		- ExpressRoute is useful for environments where you need greater bandwidth and even higher levels of security.

# Route network traffic

- Azure routes traffic between subnets on any connected virtual networks, onsite nitworks, and the internet.  You also can control routing and ovveride those settings as follows:
	- Rout tables allow you to define rules about how traffic should be directed
		- You can create custom route tables that control how packets are routed between subnets.
	- Border Gateway Protocol (BGP) works with Azure VPN gateways, Azure Route Server, or Azure ExpressRoute to propagate onsite BGP routes to Azure virtual networks.

# Filter network traffic

- virtual networks enable you to filter traffic between subnets by using:
	- Network security groups are Azure resources that can contain multiple inbound and outbound security rules
		- You can define these rules to allow or block traffic, based on factors such as source and destiniation IP address, port and protocol
		- Network virtual appliances are specialized VMs that can be compared to hardened network appliance
			- A network virtual appliance carries out a particular network function, such as running a firewall or performing wide area network (WAN) optimizatioin.

# Connect virtual networks

- You can link virtual networks together by using virtual network peering
	- Peering allows two virtual networks to connect directly to each other
- Network traffic between peered networks is private
	- travels on the Microsoft backbone network
	- never entering the public internet
- Peering enables resources in each virtual network to communicate with each other
	- These virtual networks can be in separate regions
	- This feature allows you to create a global interconnected network through Azure.

- User-defined routes (UDR) allow you to control the routing tables between subnets within a virtual network or between virtual networks.
	- This allows for greater control over network traffic flow

