---
tags: azure cloud devops microsoft az-400 lifecycle
date: 27th-October-2024
---

# DevOps application lifecycle

Primary target is optimizing application lifecycle management.  In example; migrations from an existing app to a new app with updated features requires revisiting every phase of the lifecycle.  DevOps can alter how each phase is implemented from;
  - Planning
  - Development and Delivery
  - Operations

## Application Lifecycle phases

These include;
- Planning
- Development
- Delivery
- and Operations

![Screenshot of the DevOps and Application Lifecycle.](https://learn.microsoft.com/en-us/training/wwl-azure/discover-devops/media/5-devops-lifecycle.png)

## Planning

Involves reviewing customer needs, to outline and define features and capabilities of the software to be developed.  Software can range from individual microservices to portfolios consisting of multiple products.  Outcome defines requirements, scope and milestones for the applications development and deployment.  Primary considerations agility, customer-centric focus, alignment, and transparency.

## Development

Covers all aspects of developing application code.  Including programming, testing, and code reviews.  The code resides in a source control system (git), which allows collaboration and supports versioning.  Working version of the code is used to build artifacts for subsequent delivery.  artifacts can be executable binaries, software libraries, container images, installer packages, config files, deployment scripts, or even documentation.
- Changes at this phase should be applied in small increments through automated testing and build, or (CI), accelerates development process and increases agility.

## Delivery

Deploying artifacts built during the development stage in production environments with consistency and reliability.  Ultimate goal being full automation through (CD). Automation helps make delivery scalable, repeatable, and more resilient (by minimizing possible human error).  Key to successful implementation of such an approach is following DevOps practices, proper testing, us of observable measurements, and continuous learning.
- Delivery should also take into account provisioning and configuring the targets environment's infrastructure through IaC.  Treating IaC offers a range of benefits, consistency, reproducibility, and agility.


## Operations

Involves maintaining, monitoring, and troubleshooting applications in production environments.  Primary objectives at this stage or stability and reliability, rapid incident response, security and compliance, and customer satisfaction.  Reaching these objectives is dependent on having properly implemented measurable outcomes, to some extent.  Feedback loops deliver data reflecting the current state of deployed application such as performance metrics, responsiveness, and overall user experience, including improved or degraded functionality.
- Important to ensure the maximum levels of collaboration between development, operations, and security teams.  This phase also serves as the essential source of continuous learning.

## What's the finale stage of the application lifecycle?

The lifecycle has a deterministic beginning and end of application lifespan determined by its inception and decommissioning events.  

Following the initial deployment(or even earlier), feedback from users and monitoring data inform subsequent updates and the evolution of the application.

>[!note]
>Keep in mind that even though security was mentioned only a few times, according the DevOps Principles, its role pervades throughout the application lifecycle.  Effectively, security-related considerations should be accounted for during each phase, starting at the very beginning during planning.



