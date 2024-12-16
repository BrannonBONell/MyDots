---
tags: microsoft azure networking cloud devops express-route
date: 01-10-2024
---

# Azure ExpressRoute

- Lets you extend your onsite networks into the Microsoft cloud over a private connections
	- With the help of a connectivity provider.
- This connection is called ExpressRoute Circuit.
	- You can make connections to Microsoft cloud services like Azure and Microsoft 365.
	- This feature lets you connect to offices, datacenters, or other facilities to the Microsoft cloud
- Each location has its own ExpressRoute

-  Connectivity can be from any-to-any
	- (IP VPN) network
	- point-to-point Ethernet network
	- Or a virtual cross-connection through a connectivity provider at a Colocation facitlity
	- ExpressRoute connections don't go over the public Interrnet
	- This alows ExpressRoute connections to offer more reliability, faster speeeds, consistent latencies. and higher security than typical connections over the internet

# Features and benefits from ExpressRoute

- Benefits using ExpressRoute as connections service between Azure and onsite networks
	- Connectivity to Microsoft cloud ser5vices across all regions in the geopolitical region
	- Global connectivity to Microsoft service across all regions with the ExpressRoute Global Reach
	- Dynamic routing between your network and Microsoft via BGP(Border Gateway Protocol.
	-#$####
	
	
	WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWwwwwww
	Connectivity to Microsoft cloud services

ExpressRoute enables direct access to the following services in all regions:

- Microsoft Office 365
- Microsoft Dynamics 365
- Azure compute services, such as Azure Virtual Machines
- Azure cloud services, such as Azure Cosmos DB and Azure Storage

### Global connectivity

You can enable ExpressRoute Global Reach to exchange data across your on-premises sites by connecting your ExpressRoute circuits. For example, say you had an office in Asia and a datacenter in Europe, both with ExpressRoute circuits connecting them to the Microsoft network. You could use ExpressRoute Global Reach to connect those two facilities, allowing them to communicate without transferring data over the public internet.

### Dynamic routing

ExpressRoute uses the BGP. BGP is used to exchange routes between on-premises networks and resources running in Azure. This protocol enables dynamic routing between your on-premises network and services running in the Microsoft cloud.

### Built-in redundancy

Each connectivity provider uses redundant devices to ensure that connections established with Microsoft are highly available. You can configure multiple circuits to complement this feature.

## ExpressRoute connectivity models

ExpressRoute supports four models that you can use to connect your on-premises network to the Microsoft cloud:

- CloudExchange colocation
- Point-to-point Ethernet connection
- Any-to-any connection
- Directly from ExpressRoute sites

### Colocation at a cloud exchange

Colocation refers to your datacenter, office, or other facility being physically colocated at a cloud exchange, such as an ISP. If your facility is colocated at a cloud exchange, you can request a virtual cross-connect to the Microsoft cloud.

### Point-to-point Ethernet connection

Point-to-point ethernet connection refers to using a point-to-point connection to connect your facility to the Microsoft cloud.

### Any-to-any networks

With any-to-any connectivity, you can integrate your wide area network (WAN) with Azure by providing connections to your offices and datacenters. Azure integrates with your WAN connection to provide a connection like you would have between your datacenter and any branch offices.

### Directly from ExpressRoute sites

You can connect directly into the Microsoft's global network at a peering location strategically distributed across the world. ExpressRoute Direct provides dual 100 Gbps or 10-Gbps connectivity, which supports Active/Active connectivity at scale.

## Security considerations

With ExpressRoute, your data doesn't travel over the public internet, reducing the risks associated with internet communications. ExpressRoute is a private connection from your on-premises infrastructure to your Azure infrastructure. Even if you have an ExpressRoute connection, DNS queries, certificate revocation list checking, and Azure Content Delivery Network requests are still sent over the public internet.