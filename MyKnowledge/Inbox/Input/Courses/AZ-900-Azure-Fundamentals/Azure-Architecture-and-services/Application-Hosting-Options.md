---
tags: application hosting microsoft azure cloud devops
date: 01-10-2024
---

# Application hosting

- If you need to host your application on Azure, you may initially turn to VM or containers
- Both VMs and containers provide excellent hosting solutions
	- VMs give you maximum control of the hosting environment and allow you to configure it exactly how you want.
	- VMs also may be the most familiar hosting method if you're new to the cloud.
	- Containers have the ability to isolate and individually manage different aspects of the hosting solution
		- Can also be a robust and compelling option

- There are other hosting options that you can use with Azure including Azure App Service

# Azure App Service

- App Service enables you to build and host web apps, background jobs, mobile back-ends and RESTful APIs in the programming language of your choice without managing infrastructure.
- It offers automatic scaling and high availability
- App Service supports Windows and Linux
	- It enables automated deployments from GitHub, Azure DevOps, or any Git repo to support a continuous deployment model

- Azure App Service is a robust hosting option that you can use to host your apps in Azure,
- Azure App Service lets you focus on building and maintaining your app and Azure focuses on keeping the environment up and running

- Azure App Service is an HTTP-based service for hosting web applications, REST APIs, and mobile back ends.
- It supports multiple languages including .net, .net core, Java, Rub, Node.js, PHP, or Python
- It also supports both Windows and Linux environments.

# Types of app service

- App Service you can host most common app service styles:
	- Web apps
	- API apps
	- WebJobs
	- Mobile apps
- App Service handles most of the infrastructure decisions you deal with in hosting web-accessible apps:
	- Deployment and management are integrated into the platform
	- Endpoints can be secured
	- Sites can be scaled quickly to handle high traffic loads
	- The built-in-load balancing and traffic manager provide hgigh availability.

- All of these styles are hosted in the same infrastructure and she the benefits.  This malleability makes App Service an ideal choice to host different web apps

# Web Apps
- App Service includes full support for hosting web apps  using ASP.NET, ASP.NET Core, Java, Ruby, Node.js, PHP, or Python
	- You can choose Linux or Windows as the host OS

# API apps
- Like hosting a website, Build REST-based web APIs by using your choice of language and framework
- You get full Swagger support and the ability to package and publish your API in the Azure Marketplace
- The produced apps can be consumed from any HTTP- or HTTPS- based client.

# WebJobs

- WebJobs feature to runs a program (.exe, Java, PHP, Python, or Node.js) or script(.cmd, .bat, PowerShell, or Bash) in the same contexts as a web app, API app, or mobile app.
- They can be scheduled or run by a trigger.
	- WebJobs are often used to run background tasks as part of your app logic

# Mobile Apps

- Mobile Apps feature of App Service to quickly build and back end for iOS and Android apps
- With just a few actions in the Azure portal
	- Store mobile app data in a cloud-based SQL database
	- Authenticate customers against common social providers, such as MSA, Google, X, and Facebook
	- Send push notifications
	- Execute custom back-end-logic in C# or Node.js
- On the mobile app side, there's SDK support for native iOS and Android, Xamarin, and React native apps.