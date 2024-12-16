---
tags: microsoft azure cloud devops create web app portal
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Create a web app in the Azure Portal

**Overview:** Azure App Service is a fully managed **Platform as a Service (PaaS)** solution that enables developers to host web applications, APIs, and mobile backends without managing the underlying infrastructure. Azure takes care of scaling, patching, backups, and other infrastructure tasks so developers can focus on building and deploying applications.

---

### **Why Use the Azure Portal?**

1. **User-friendly Interface**: The Azure portal provides a **graphical experience** that is easy to navigate, making it ideal for those new to Azure or those managing web apps.
2. **Feature Discovery**: The portal allows you to explore available features, such as deployment slots, scaling, and security settings.
3. **Customization**: You can configure and manage your resources with point-and-click actions.

---

### **Key Features of Azure App Service**:

1. **Fully Managed Hosting**:
    
    - Azure manages the infrastructure, so you don’t have to worry about the underlying VMs, patches, or load balancers.
    - You focus on deploying your code while Azure handles scaling and availability.
2. **Deployment Slots**:
    
    - You can create **staging slots** to test updates before pushing them to production.
    - **Swap slots** seamlessly without causing downtime.
3. **Continuous Integration/Deployment**:
    
    - Integrates with **Azure Repos**, **GitHub**, **Bitbucket**, **FTP**, or **local Git** repositories.
    - Automatic code synchronization and deployment of changes without manual intervention.
    - Define custom build and release processes with **Azure DevOps**.
4. **Integrated Publishing**:
    
    - You can publish web apps directly from **Visual Studio** using Web Deploy or via **FTP** for more traditional workflows.
5. **Auto-scaling**:
    
    - **Scale up/down**: Adjust the resources of the machine hosting your app (cores, memory).
    - **Scale out**: Increase the number of instances hosting your app based on real-time demand.

---

### **Creating a Web App**:

To create a web app in the Azure portal, you’ll need to provide the following information:

1. **Subscription**:
    
    - A valid and active Azure subscription is required to allocate resources and host the web app.
2. **Resource Group**:
    
    - Group your related Azure resources for better management. If you don’t have one, you can create it during the web app setup.
3. **Web App Name**:
    
    - This name becomes part of the app’s **URL** (e.g., `myapp.azurewebsites.net`). The name must be unique across all Azure web apps.
4. **Publish Type**:
    
    - **Code**: Deploy your application as code.
    - **Container**: Deploy your application as a Docker container.
5. **Runtime Stack**:
    
    - If deploying as **code**, select the appropriate runtime stack, such as **.NET, Node.js, Java, Python**, etc.
    - If deploying as a **container**, the image includes the runtime stack.
6. **Operating System**:
    
    - App Service can run on **Windows** or **Linux**.
    - If you select a runtime that supports both OS types, choose the one your app was developed and tested on.
7. **Region**:
    
    - Select the Azure region where the web app will be hosted. This affects performance and pricing.
8. **App Service Plan**:
    
    - **App Service Plan** determines the compute resources and pricing tier for your web app.
    - A single plan can host multiple apps, but the performance and cost depend on the size and configuration of the plan.
    - You can create a new plan or use an existing one.

---

### **Operating Systems**:

- **Windows**: Ideal for apps that use **.NET** or require the Windows environment.
- **Linux**: Preferred for open-source languages like **Node.js, PHP, Python,** or **Java**.
- **Container-based**: Choose the OS based on your container image.

---

### **App Service Plans**:

1. **What is an App Service Plan?**
    
    - It defines the **virtual machine resources** (CPU, memory) used to run your apps.
    - It determines the pricing tier and performance of the apps hosted on it.
    - A single plan can host **multiple web apps**, limited only by the plan’s performance characteristics.
2. **App Service Plan Features**:
    
    - **Size/Performance**: The plan size (SKU) determines the available CPU, memory, and scaling options.
    - **Billing**: The App Service plan defines how you are billed, based on the plan’s size and the resources used.
    - **Multiple Apps**: You can deploy multiple web apps within the same App Service plan at no extra cost, but all apps share the plan’s resources.
3. **Scaling**:
    
    - You can **scale up** by increasing the VM size or **scale out** by adding more instances to handle more traffic.
4. **Pricing Plans**:
    
    - **Free and Shared**: Basic plans suitable for development/testing, with limited features.
    - **Basic**: Dedicated compute resources for small production workloads.
    - **Standard**: Offers autoscaling and more advanced features, like deployment slots.
    - **Premium**: Higher performance, more instances, and extra features like better scaling and load balancing.
    - **Isolated**: Maximum performance, high security, and full isolation in an Azure VNet.

---

### **Deployment Options**:

![Screenshot of the staging deployment slot to test the deployments.](https://learn.microsoft.com/en-us/training/modules/host-a-web-app-with-azure-app-service/media/2-deployment-slots.png)

1. **Integrated Deployment**:
    
    - App Service integrates with continuous deployment tools like **Azure Repos**, **GitHub**, and **Bitbucket** to automatically pull and deploy code changes.
    - **FTP publishing** is also supported for more traditional workflows.
2. **Container Deployment**:

![Screenshot of setting up deployment options and choosing source for the deployment source code.](https://learn.microsoft.com/en-us/training/modules/host-a-web-app-with-azure-app-service/media/2-continuous-integration.png)

    - If deploying via **Docker**, you provide the image details and the Docker registry (like Docker Hub or Azure Container Registry).
    - The container includes the runtime stack and OS dependencies, so no runtime selection is needed.

---

### **Autoscale and Performance**:

1. **Scale-Up**:
    
    - Adjust the **size** of the VM hosting your web app by increasing CPU, memory, or storage.
2. **Scale-Out**:
    
    - Increase the **number of instances** running your web app to handle more traffic automatically.
    - You can configure autoscaling to dynamically adjust instance counts based on metrics like CPU usage or request volume.

---

### **Summary**:

1. **Azure App Service** allows you to host web apps, APIs, and backends without managing the infrastructure.
2. You can **create web apps** via the Azure portal by providing the subscription, resource group, app name, publish type (code or container), runtime stack, OS, region, and App Service plan.
3. App Service offers **built-in autoscaling** and **deployment slots** for staging environments, making it ideal for agile deployments.
4. **App Service Plans** determine your app's performance and cost, with the ability to host multiple web apps under a single plan.
5. Deployment can be done using **continuous integration** tools, **Visual Studio**, or **FTP**.
![[Pasted image 20241014193338.png]]