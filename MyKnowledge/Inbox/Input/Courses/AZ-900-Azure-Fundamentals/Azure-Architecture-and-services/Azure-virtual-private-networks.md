---
tags: microsoft azure cloud networks private devops
date: 01-10-2024
---

- VPN uses an encrypted tunnel with another network
	- Typically deployed to connect wo or more trusted private networks to on another over an untested network (typically the public internet)
	- Traffic is encrypted while traveling over the untrusted network to prevent eavesdropping or other attacks
	- VPNs can enable networks to safely and securely share sensitive information

# VPN Gateways

- VPN gateway is a type of virtual network gateway
	- Azure VPN gateways are deployed in the subnet of the a virtual network and enable the following:
		- Connect onsite:
			- Datacenters to virtual networks through a site-to-site connection
			- Connect individual device to virtual networks through a point-to-site connections
			- Connect virtual networks to other virtual networks throught a network-to-network connection

- All data transfer is encrypted inside a private tunnel as it crosses the internet. 
- You can deploy only one VPN gateway in each virtual network
	- Can use one gateway to connect to multiple locations, which includes other virtual networks or onsite datacenters

- When setting up a VPN gateway, you must specify the type of VPN - either policy-based or route-based.
- The primary distinction between these two types is how they determine which traffic needs encryption
- In Azure, regardless of the VPN type, the method of authentication employed is a preshared key
	- Policy-based VPN gateways specify statically the IP address of packets that should be encrypted through each tunnel.  This device compares every data packet against those sets of IP addresses to pick the tunnel where the packet will be sent through.
	- In Route-based gateways, IPSec tunnels are a virtual tunnel interface.  IP routing static or dynamic routing
		- Decides which tunnel interfaces to use when sending each packet
			- Route-based VPNs a preferred  onsite
			- They're more resillient to topology changes such as the creation of new subnets.
	- Use a route based VPN gateway if you need any of the following types of connectivity
		- Connections between virtual networks
		- Point-to-site-connections
		- Multisite connections
		- Coexistence with an Azure ExpressRoute gateway

# High-availability scenarios

- If you're configuring a Vpn to keep information safe,
	- It should also be highly available and fault tolarant
	- There are a few ways to maximize the resilliency of a VPN gateway

## Active/Standby

- By default VPN gateways are mostly used as two instances in an active/standy config
	- Even if you only see one gateway resource in Azure
- When planned or unplanned disruption effects the active instance
	- The standby instance assumes responsibility for connections without any user intervention
- Connections are interrupted during the switch
	- Typically restores within a few seconds to 90 seconds.

## Active/Active

- With the introduction of support for the BGP routing protocol
	- VPN gateways can be deployed in an active/active sonfig
		- Assigns a unique public IP address to each instance
		- Then create separate tunnels from the onsite devices to each IP address
	- You can extend the high availability deploying an additonal VPN device onsite

## Zone redundant gateways

- In regions that support availability zones
	- VPN gateways, and ExpressRoute gateways can be used in a zone-redundant config.
	- This config brings resillency, scalability, and higher availability to virtual network gateways
	- gateways in Azure Availability zones physically and logically separates gateways within a region while protecting your onsite network connectivity to Azure from zone-level failures.
	- The gateways require different gateway stock keeping units (SKUs) and use standard public IP addresses instead of basic.