---
tags: microsoft devops cloud azure app service
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Create an app with App Service

**Overview:** Azure App Service provides features like Web Apps, Mobile Apps, and API Apps to help you quickly build, deploy, and manage applications. These apps can be created and configured through the Azure portal.

---

### **Basic Configuration Settings for Creating an App**:

1. **Name**:
    
    - The app name must be **unique** and serves as the URL to locate your app in Azure (e.g., `webappces1.azurewebsites.net`).
    - You can map a **custom domain** if desired.
2. **Publish**:
    
    - App Service can host your app as **code** or as a **Docker Container**.
3. **Runtime Stack**:
    
    - Defines the language and SDK versions for your app.
    - Options include: **.NET Core, .NET Framework, Node.js, PHP, Python, Ruby**.
    - You can also set a start-up command or file for Linux or custom container apps.
4. **Operating System**:
    
    - Choose between **Linux** or **Windows** for your app runtime environment.
5. **Region**:
    
    - The **region** affects available App Service plans and impacts latency and availability.
6. **App Service Plan**:
    
    - Your app needs to be associated with an **App Service plan**, which determines resources, features, and capacity.
    - Choose from different **pricing tiers** based on your region and app requirements.

---

### **Post-Creation Configuration Settings**:

Once your app is created, additional settings can be configured in the Azure portal:

![[Pasted image 20241014125548.png]]

1. **Always On**:
    
    - Keeps your app loaded even when there’s no traffic.
    - Required for continuous **WebJobs** or WebJobs triggered using **CRON** expressions.
2. **ARR Affinity**:
    
    - In multi-instance deployments, ensures your app’s client is routed to the **same instance** throughout the session.
3. **Connection Strings**:
    
    - Connection strings are **encrypted** at rest and transmitted over a **secure channel**.

---

### **Key Concepts to Keep in Mind**:

- **Unique App Name**: Required to identify and locate your app.
- **Publish Method**: Choose between deploying your app as code or using a Docker container.
- **Runtime Stack**: Choose the correct language and SDK version that matches your development environment.
- **App Service Plan**: Select a plan that fits your app’s performance and resource needs.
- **Post-Creation Options**: Take advantage of settings like Always On, ARR Affinity, and secure connection strings to enhance your app’s performance and security.A