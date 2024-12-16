---
tags: microsoft azure container service cloud devops
date: 01-10-2024
---

# Containers

- If you need to run multiple instances of an application on a single host machine
	- containers are an excellent choice

# What are Containers?

- Are a virtualization environment.
	- Like running multiple VMs on a single physical host
	- You can run multiple containers on a single physical or virtual host
- Unlike VMs you don't manage the OS for a container
- VMs appear to be an instance of an operating system that you can connect and manage.
- Containers are lightweight and designed to be created scaled out and stopped dynamically.
- It's possible to create and deploy VMs as application demand increases
	- It's possible to create deploy VMs as application demand increases
		- Containers are a lighter weight, more agile method
	- Containers are designed to allow you to respond to changes on demand
	- Containers you can quickly restart if there's a crash or hardware interruptions
		- One of the most popular container engines is Docker, and Azure supports it.

# Azure Container Instances

- Container Instances offer the fastest and simplest way to run a container in Azure
	- Without having to manage any VMs or adopt any additional resources.
- Azure Container instances are a platform as a service (PaaS) offering.
- Container Instances allow you to upload your containers and then the service runs the containers for you.

# Azure Container Apps

- Container apps are similar in many ways to container instnaces.
	- They allow you to get up and running right away they remove the container management piece and they're a PaaS offering
	- Container Apps have extra benefits such as the ability to incorporate load balancing and scaling.
	- These other functions allow you to be more elastic in your design.

# Azure Kubernetes Service

- Kubernetes Service (AKS) is a container orchestration service
	- An orchestration service manages the lifecycle of containers
	- When you're deploying a fleet of containers, AKS can make fleet management simpler and more efficient.

# Use containers in your solutions

- Containers are often used to create solutions by using a microservice architecture
	-  This architecture is where you break solutions into smaller independent pieces
		- Example; you might split a website into a container hosting your front end, and another hosting your back end, and a third for storage.
	- This split allows you to separate portions of your app into logical sections that can be maintained scaled or updated independently

- Your website back-end reaches capacity
	- The front end and storage aren't stressed.
	- With containers you could scale the back-end separately to improve performance
	- If something necessitated such a change you could also choose to change the storage service or modify the front end without impacting any of the other components.