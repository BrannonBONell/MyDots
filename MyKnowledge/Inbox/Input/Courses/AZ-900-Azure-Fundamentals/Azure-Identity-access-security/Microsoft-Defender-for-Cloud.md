---
tags: azure microsoft cloud defender security authenticate defence
date: 8th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Defender for Cloud
>[!summary] 
>- Microsoft Defender for Cloud monitors and enhances security across cloud, onsite, hybrid, and multicloud environments.
>- It integrates natively with Azure and extends protection to AWS and GCP using Azure Arc.
>- Provides threat detection, vulnerability assessments, and security recommendations to improve security posture.
>- Offers advanced threat protection, including security alerts and fusion kill-chain analysis.
>- Continuously assesses security posture and applies tailored security policies for compliance.
 

- is a monitoring tool for threat protection and security posture management.
	- It monitors your cloud, onsite, hybrid and multicloud environments to provide guidance and notifications aimed at strengthening your security posture.

- Provides the tools needed to harden your resources
	- track your security posture
		- protect against cyber attacks
			- streamline security management
- Deployment is easy it's already natively integrated to Azure

>[!cue] Defender For Cloud
>Monitoring for threat protection
>Monitors cloud, onsite, hybrid, multicloud
>Provides tool to harden your resources
# Protection everywhere you're deployed

- Since Defender for Cloud is Azure native service
	- If you have onsite datacenter
		- Or are operating in another cloud environment
			- Monitoring of Azure services may not give you a complete picture of your Security situation.

- Defender for cloud can automatically deploy a Log Analytics agent to gather security related data.
	- Azure Machines, deployment is handled directly
		- For hybrid and multicloud environments
			- Microsoft defender plans are extended to non-Azure machines with the helpe of Azure Arc.
				- Cloud security posture management (CSPM) features are extended to multicloud machines without the need for any agents.

>[!cue] What is
>Microsoft Azure Arc?
# Azure-native protections

- Defender for Cloud helps you detect threats across:

	- Azure PaaS services – Detect threats targeting Azure services including Azure App Service, Azure SQL, Azure Storage Account, and more data services. You can also perform anomaly detection on your Azure activity logs using the native integration with Microsoft Defender for Cloud Apps (formerly known as Microsoft Cloud App Security).
	- Azure data services – Defender for Cloud includes capabilities that help you automatically classify your data in Azure SQL. You can also get assessments for potential vulnerabilities across Azure SQL and Storage services, and recommendations for how to mitigate them.
	- Networks – Defender for Cloud helps you limit exposure to brute force attacks. By reducing access to virtual machine ports, using the just-in-time VM access, you can harden your network by preventing unnecessary access. You can set secure access policies on selected ports, for only authorized users, allowed source IP address ranges or IP addresses, and for a limited amount of time.

>[!cue] Defender for Cloud in
>native products
>Azure PaaS services detects threats against
>Azure App Service, Azure SQL, Azure Storage Account, and more
>Azure Data services helps automatically classify data
>Get assessments for potential vulnerabilities across SQL and Storage services
# Defend your hybrid resources

- You can add Defender for Cloud capabilities to your hybrid cloud environment to protect your non Azure servers.
	- Get customized threat intelligence and prioritized alerts according to yoru specific environment.

- Extend protection to on site machines
	- deploy Azure Arc and enable Defender for Cloud's enhanced security features.

# Defend resources running on other clouds

- Defender for Cloud can protect resources in other clouds such as AWS and GCP

- If you've connected AWS account to an Azure subscription, you can enable any of these protections
	- Defender for Cloud's CSPM features extend to your AWS resources. This agentless plan assesses your AWS resources according to AWS-specific security recommendations, and includes the results in the secure score. The resources will also be assessed for compliance with built-in standards specific to AWS (AWS CIS, AWS PCI DSS, and AWS Foundational Security Best Practices). Defender for Cloud's asset inventory page is a multicloud enabled feature helping you manage your AWS resources alongside your Azure resources.
	- Microsoft Defender for Containers extends its container threat detection and advanced defenses to your Amazon EKS Linux clusters.
	- Microsoft Defender for Servers brings threat detection and advanced defenses to your Windows and Linux EC2 instances.

# Access Secure and Defend

- Defender of the Cloud fills three vital needs in the cloud and onsite
	- Continuously assess – Know your security posture. Identify and track vulnerabilities.
	- Secure – Harden resources and services with Azure Security Benchmark.
	- Defend – Detect and resolve threats to resources, workloads, and services.\
![[Pasted image 20241008204052.png]]


>[!cue] What are three vital needs
>Defender for cloud fills for cloud and onsite?
# Continuously assess

-  Includes vulnerability assessment solutions for your VMs, container registries, and SQL server.

- Microsoft Defender for Servers include automatics, native integration with Microsoft Defender for Endpoint.
	- This integration enabled you'll have access to the vulnerability findings from Microsoft threat and vulnerability management..

# Secure

- Cloud Security Basics:

	- Essential to implement proper authentication, access control, and Zero Trust principles.
	- Security policies must be tailored to your specific environment and situation.

- Defender for Cloud Policies:

	- Built on Azure Policy controls, offering flexibility and comprehensive solutions.
	- Policies can be applied to management groups, subscriptions, or entire tenants.

- Scalability and Monitoring:
	- Cloud allows for growth and scaling by adding new services/resources.
	- Defender for Cloud continuously monitors new resources for security compliance.

- Security Recommendations:
	- New resources are assessed against security best practices.
	- Non-compliant resources are flagged, and prioritized recommendations are provided.
	- Recommendations aim to reduce the attack surface.

- Azure Security Benchmark:
	- Provides guidelines for security and compliance based on common frameworks.
	- Supports the list of recommendations in Defender for Cloud.

- Security Controls and Secure Score:
	- Recommendations are grouped into security controls.
	- Each control is assigned a secure score, indicating the health of your security posture.
	- Secure score helps prioritize actions to improve security.
![[Pasted image 20241008205431.png]]

# Defend

- Defender for Cloud also helps you defend yoru environment by providing securitry alerts and advanced threat protection features

# Security alerts

>[!cue] Security alerts
>Detects threats in any area of your environment.
>- Describe details of the affected resources
>- Suggest remediation steps
>- Option to trigger a logic app in response
- Detects a threat in any area of your environment, it generates a secureity alert
- Security alerts:
	- Describe details of the affected resources
	- Suggest remediation steps
	- Provide, in some cases, an option to trigger a logic app in response
- Defender for Cloud's threat protection includes
	- fusion kill-chain analysis
		- which automatically correlates alerts in your environment based on cyber kill-chain analysis
		- To better understand the full story of an attack campaign, where it started, and what kind of impact it had on your resources.

# Advanced threat protection
- Defender for cloud provides advanced threat protection for many of your deployed resources
	- including VMs, SQL databases, containers, web apps, and your network.
		- Protections include securing the management ports of your VMs with Just In Time access, and adaptive app controls to create allowlists for what apps should and shouldn't run on your machines.