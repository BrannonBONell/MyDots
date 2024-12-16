---
tags: azure microsoft cloud devops reliability predictability
date: 09-29-2024
---

# Reliability

- Is the ability of a system to recover from failures and continue to function
	- One of the pillars of the Microsoft Azure Well-Architected Framework.

- The cloud with its decentralized design, naturally supports a reliable and resilient infrastructure.
	- Enables you to have resources deployed in regions around the world
	- With global scale if one region has a catastrophic event other regions are still up and running
	- Sometimes your cloud environment itself will automatically shift toa different region for you
		- With no action needed on your part.

# Predictability

- Let's you move forward in the cloud with confidence.
	- Predictability can be focused on performance or cost
	- Both performance and cost Predictability are heavily influenced by the Microsoft Azure Well-Architected Framework.
	- Deploy a solution built around this framework and you have a solution whose cost and performance are predictable

# Performance

- Focuses on predicting the resources needed to deliver a positive experience for your customers.
- Autoscaling, load balancing, and high availability are just some of the cloud concepts that support performance predictability
- Suddenly you need more resources, auto scaling can deploy additional resources to meet the demand
	- Then scale back when the demand drops
- Traffic is heavily focused on one area, load balancing will help redirect some of the overload to less stressed areas.

# Cost

- Focused on predicting or forecasting the cost of the cloud spend
	- With the cloud you can track your resource use in real time
		- monitor resources to ensure that your using them in the most efficient way
			- and apply =data analytics to find patterns and trends that help better plan resource deployments.
	- Operating in the cloud and using cloud analytics and information you can predict future costs and adjust your resources as needed
	- You can even use tools like the Total Cost of Ownership (TCO) or Pricing Calculator to get an estimate of potential cloud spend.