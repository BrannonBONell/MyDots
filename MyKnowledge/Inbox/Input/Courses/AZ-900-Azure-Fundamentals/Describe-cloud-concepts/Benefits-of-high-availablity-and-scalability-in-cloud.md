---
tags: scale availability could azur devops
date: 09-29-2024
---

# Cloud Applications

- Two of the biggest considerations for cloud applications
	- Uptime (or availability)
	- Ability to handle demand (scale)

# High Availability

- When Deploying and application, service, or an IT resource
	- It's important the resources are available when needed
- High availability focuses on ensuring maximum availability 
	- Regardless of disruptions or events that may occur

- When architecting solutions
	- Need to account for service ability guarantees.
	- Azure is a highly available cloud environment with uptime guarantees depending on the service
	- These guarantees are part of the service-level agreements (SLAs)


# Scalability

- Major benefit of cloud computing is the scalability of cloud resources
	- Scalability refers to the ability to adjust resources to meet demand
	- Suddenly experience peak traffic and your systems are overwhelmed
		- The ability to scale means you can add more resources to better handle the increased demand

- Scalability also means that you aren't overpaying for services.
	- The cloud is a consumption-based model
	- You only pay for what you use
		- if demand drops you can reduce your resources and thereby reduce your cost.

- Scaling generally comes in two varieties:
	- Vertical scaling is focused on increasing or decreasing the capabilities of resources.
	- Horizontal scaling is adding or subtracting the number of resources

# Vertical Scaling

- If you were developing an app and you needed more processing power.
	- Vertically scale up to add more CPUs or RAM to the VM.
	- If you realized you had over-specified the needs, you could vertically scale down by lowering the CPU or RAM specifications

# Horizontal Scaling

- Suddenly you experienced a steep jump in demand your deployed resources could be scaled out (either automatically or manually).
	- You could add additional VMs or containers, scaling out In the same manner, if there was a significant drop in demand, deployed resources could be scaled (automatically or manually), scaling in.

## Summary
You should now be able to:

- Describe the benefits of high availability and scalability in the cloud.
- Describe the benefits of reliability and predictability in the cloud.
- Describe the benefits of security and governance in the cloud.
- Describe the benefits of manageability in the cloud.

### Additional Resources
[Build great solutions with Microsoft Azure Well-Architected Framework](https://learn.microsoft.com/en-us/learn/paths/azure-well-architected-framework/)
- A course that introduces you to the Microsoft Azure Well-Architected Framework