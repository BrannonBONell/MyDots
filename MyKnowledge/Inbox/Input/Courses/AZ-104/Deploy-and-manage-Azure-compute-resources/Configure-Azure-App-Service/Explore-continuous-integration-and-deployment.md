---
tags: azure microsoft cloud devops configure app service continuous integration deployment
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Explore continuous integration and deployment

**Overview:** Azure App Service offers out-of-the-box continuous integration and deployment (CI/CD) options, allowing developers to automate code deployment from several sources like Azure DevOps, GitHub, Bitbucket, and more. This ensures seamless and efficient updates to web apps with minimal manual intervention.

![Illustration that shows two developers sharing a single GitHub source to produce a website built with Azure App Service.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-app-services/media/continuous-development-a0dfd350.png)
---

### **Deployment Methods**:

#### **1. Automated Deployment (Continuous Integration)**:

- **Purpose**: Push out new features and bug fixes quickly and repetitively with minimal impact on users.
- **Sources Supported**:
    - **Azure DevOps**:
        - Push code to Azure DevOps, run tests, build, and release the code to Azure automatically.
        - Suitable for defining custom build and release pipelines.
    - **GitHub**:
        - Connect a GitHub repository for automated deployment.
        - Changes pushed to the production branch in GitHub are automatically deployed to Azure.
    - **Bitbucket**:
        - Similar to GitHub, allowing automatic deployment from a Bitbucket repository.
- **Advantages**:
    - Every time you push code to the repository, it's automatically deployed.
    - Reduces human error and enables faster, more reliable updates.

#### **2. Manual Deployment**:

- **Purpose**: Manually push your code to Azure when you prefer more control over when and how the app is deployed.
- **Manual Deployment Options**:
    - **Git**:
        - Use the App Service-provided Git URL to push code to the remote repository for deployment.
    - **CLI**:
        - Use the `webapp up` command from the **Azure CLI** to package and deploy your app.
        - You can also create a new web app during this process.
    - **Visual Studio**:
        - Visual Studio offers an integrated deployment wizard for deploying apps directly to App Service.
    - **FTP/S**:
        - Use FTP or FTPS to manually upload and deploy code to your Azure App Service.

---

### **Key Concepts to Remember**:

1. **Automated Deployment**:
    
    - Ideal for fast, repetitive deployment of updates.
    - Azure App Service synchronizes code and future changes automatically with minimal manual intervention.
    - Best for teams using **Azure DevOps, GitHub**, or **Bitbucket** for source control.
2. **Manual Deployment**:
    
    - Provides more control over when the code is pushed and deployed.
    - Suitable for scenarios where the team prefers to manually trigger deployments.

---

### **Choosing the Right Deployment Method**:

- **Use Automated Deployment** for faster, repetitive updates without manual work (e.g., with **Azure DevOps** or **GitHub**).
- **Use Manual Deployment** when more control over the deployment process is needed or if automation is not required.