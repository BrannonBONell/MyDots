---
tags: microsoft azure compute networking service cloud devops
date: 01-10-2024
---

# Azure Virtual Machines

- Virtual Machines in the cloud
- VM's provide infrastructure as a service (Iaas) in the form of a virtualized server and can be used in many ways
	- Just like a physical computer
	- Customize all the software running on your VM
	- VM's are the ideal choice when:
		- Total control over the OS
		- The ability to run custom software
		- Use custom hosting configurations
- Azure VM gives the flexibility of virtualization without having to buy and maintain physical hardware that runs the VM.
- An IaaS offering you still need to configure, update, and maintain the software that runs on the VM

- Can create or use an already created image to rapidly provision VM's
	- Create and provision a VM in minutes when you select a preconfigured VM image.
		- Image is a template used to create a VM and may already include an OS and other software
		- like development tools or web hosting environments

# Scale VMs in Azure

- You can run single VMs for testing, development, or minor tasks
	- Group VMs together to provide high availability, scalability, and redundancy
- Azure can manage the grouping of VMs for you with features such as scale sets and availability sets

# VM Scale Sets

- VM scale sets let you create and manage a group of identical load-balanced VMs
- If you simply created multiple VMs with the same purpose, you'd need to ensure they were all configured identically and then set up network routing parameters to ensure efficiency
- Have to monitor the utilization to determine if you need to increase or decrease the number of VM's

- With scale sets Azure automates most of that work,
- Allow you to centerally manage, configure, and update a large number of Vms in minutes. 
- The number of VM instances can automatically increase or decrease in response to demand, or you can set it to scale based on a defined schedule.
- VM scale sets automically deploy a load balancer to make sure that your resources are being used effciently.
	- With scale sets you can build large-scale services for areas such as compute, big data, and container workloads.

# VM availability sets

- VM availaibility sets are a tool to help you build a more resilient, highly available environment.
	- Availability sets are designed to ensure that VMs stagger updates and have varied power and network connectivity, preventing you from losing all your5 VMs with a single network or power failure.
- Availability accomplish these objectives by grouping VMs in two ways: update domain and fault domain
	- Update domain:
		- The update domain groups VMs that can be rebooted at the same time
		- This setup allows you to apply updates while knowing that only one update domain grouping is offline at a time.
		- All of the machines in one update domain update
		- An update group going through the update process is given a 30-minute time to recover before maintenance on the next update domain starts.
	- Fault domain:
		- The fault domain groups your VMs by common power source and network switch
		- By default, an availability set splits your VMs across up to three fault domains.  This helps protect against a physical power or networking failure by having VMs in different fault domains
			- Thus being connected to different power and networking resources
	- Best of all there's no additional cost for configuring an availability set
		- You only pay for the VM instances created

# Example of when to use VMs

- Some common examples or use cases for virtual machines include:
	- During testing and development.
		- VMs provide a quick and easy way to create different OS and application configurations
		- Test and development personnel can then easily delete the VMs when they no longer need them
	- When running applications in the cloud.
		- The ability to run applications in the public cloud as opposed to creating a traditional infrastructure to run them can provide substantial economic benefit.
		- Applications might need to handle fluctuations in demand.
			- Shutting down VMs when you don't need them or quickly starting them up to meet a sudden increase in demand means you pay only for the resources you use.
	- When extending your datacenter to the cloud.
		- An organization can extend the capabilities of its own on-site network by creating a virtual network in Azure and adding VMs to the virtual network
		- Applications like SharePoint can then run on an Azure VM instead of running locally.
		- This arrangement makes it easier or less expensive to deploy than in an on-site environment.
	- During disaster recovery
		- As with running certain types of applications in the cloud and extending an on-site network to the cloud, you can get significant cost savings by using an IaaS-based approach to disaster recovery
		- If a primary datacenter fails, you can create VMs running on Azure to run your critical applications and then shut them down when the primary datacenter becomes operation again.

# Move to the cloud with VMs

- VMs are also a choice when you move from physical server to the cloud
	- (also known as lift and shift)
- You can create an image of the physical server and host it within a VM with little or no charges
- Just like a physical on-site server you must maintain the VM
	- Your responsible for maintaining the installed OS and software

# VM Resources

- Provision a VM, you also have the chance to pick the resources that are associated with that VM:
	- Size (purpose, number of processor cores, and amount of RAM)
	- Storage disks (hard disk drives, solid state drives, etc)
	- Networking (virtual network, public IP address, and port configuration)

