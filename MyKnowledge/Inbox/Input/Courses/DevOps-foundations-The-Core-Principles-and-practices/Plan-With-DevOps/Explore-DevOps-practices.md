---
tags: azure cloud devops microsoft az-400 practices
date: 27th-October-2024
---

# DevOps Practices

## Version control

- Managing updates to code by storing it in repositories, tracking revisions, and maintaining change history.
- Provides ability for code review and recover from programming errors
- Git allow for collaboration in code through features
	- Cloning
	- Pull Requests
	- Code Change Merges
	- Conflict Resolution
	- Support for Roll Backs
- Use of versions control is fundamental and a prerequisite for DevOps ractices

## Continuous Integration (CI) and Continuous Testing

- A core practice of DevOps is automation.
- Automation applies to merging code changes, testing them, and building resulting artifacts, as early as possible in the applications lifecycle
- Intention is to detect any issues in the development phase, minimizing the effort and cost to fix  them.
- Automated tests validate that code changes haven't introduced errors or regression issues.

## Continuous Delivery (CD)

- Automates deploying artifacts built as part of (CI), making it available to the consumer.
- CD automates the progression of artifacts through different environments, testing, staging, and production.
- (CI/CD) together form a unified, streamlined, end-to-end software development and delivery process

## Continuous Monitoring

- Provides automated real-time visibility into the health and performance of the entire applications stack, including its infrastructure.
- Accomplished through the collection of telemetry, including logs and metrics, and customizable alerting that delivers notifications about anomalous behaviour, facilitating prompt remediation actions.

## Continuous Security (DevSecOps)

- Is an extension of DevOps, that Focuses on integrating security practices into each stage from planning,  through coding, testing, and deployment, operations.

## Infrastructure as Code (IaC)

- Programming methods to provision and manage infrastructure services.
- IaC defines infrastructure components servers, network devices, and databases by using code.  Typically resides in a (VCS) which manages and tracks changes to configurations.
- Facilitates automated provisioning and configuration of infrastructure, enhancing efficiency, consistency, and scalability.
- IaC can be integrated with CI/CD, yielding a comprehensive software delivery strategy by combining infrastructure provisioning, with application build, test, and deployment into one continuous, fully automated sequence.
