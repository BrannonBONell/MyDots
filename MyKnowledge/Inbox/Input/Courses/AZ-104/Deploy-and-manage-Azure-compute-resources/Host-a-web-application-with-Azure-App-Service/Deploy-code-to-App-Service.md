---
tags: azure cloud devops microsoft app service deploy
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Deploy code to app service

**Overview:** Azure App Service allows you to easily deploy and manage web applications in the cloud. You can deploy applications through **automated deployment** (also known as continuous integration) or **manual deployment**. Each method has its advantages depending on your development workflow and environment. This guide explains both automated and manual deployment options.

---

### **Automated Deployment (Continuous Integration)**:

**What is Automated Deployment?**

- **Automated Deployment (CI)** is a process where every code change is automatically tested, built, and deployed without manual intervention.
- It allows you to push out **new features and bug fixes** rapidly with minimal downtime, ensuring a **fast and repetitive deployment cycle**.

**Sources for Automated Deployment:**

1. **Azure Repos**:
    
    - Push your code to **Azure Repos** (a Git-based source control).
    - Azure automatically pulls the code, runs the build process in the cloud, performs tests, and deploys the release to the **Azure Web App**.
2. **GitHub**:
    
    - Azure integrates directly with **GitHub** repositories.
    - When connected, any changes pushed to your **production branch** are automatically deployed to the Azure Web App.
3. **Bitbucket**:
    
    - **Bitbucket**, similar to GitHub, can be integrated with Azure for continuous deployment.
    - Once integrated, any changes pushed to the repository trigger automated deployments to App Service.

**Advantages of Automated Deployment**:

- **Fast**: Every code change is automatically deployed, minimizing time to market.
- **Reliable**: CI pipelines usually include **automated testing**, ensuring code is reliable before deployment.
- **Efficient**: It reduces human error and the need for manual deployment steps.

---

### **Manual Deployment Methods**:

In cases where automated deployment is not required, there are several ways to manually deploy code to **Azure App Service**:

1. **Git Deployment**:
    
    - Azure App Service provides a **Git URL** as a remote repository.
    - You can add the Git URL to your local repository using:
        
        bash
        
        Copy code
        
        `git remote add azure <App-Service-Git-URL>`
        
    - To deploy your code, simply push to this remote repository:
        
        bash
        
        Copy code
        
        `git push azure master`
        
    - When you push your code to the remote repository, Azure automatically pulls and deploys the latest version of your app.
2. **Azure CLI (az webapp up)**:
    
    - **`az webapp up`** is a feature of the **Azure CLI** that helps package and deploy your app.
    - This command can even **create a new App Service web app** if one doesn’t already exist, making it a quick and easy method for deployment.
    - Basic command to deploy:
        
        bash
        
        Copy code
        
        `az webapp up --name <app-name> --resource-group <resource-group-name>`
        
3. **Deploy Application Packages (az webapp deploy)**:
    
    - You can use **`az webapp deploy`** to deploy application packages (such as **ZIP, WAR, EAR, or JAR** files).
    - This method is great for deploying packaged apps or static files (like HTML, CSS, or JavaScript files).
    - Command to deploy a ZIP package:
        
        bash
        
        Copy code
        
        `az webapp deploy --resource-group <resource-group> --name <app-name> --src-path <package.zip>`
        
4. **Visual Studio Deployment**:
    
    - **Visual Studio** integrates tightly with Azure, offering a deployment wizard that walks you through the process.
    - In Visual Studio, select your web project, right-click, and choose **"Publish to Azure"**.
    - Visual Studio handles packaging and deploying your application via **Web Deploy** technology, making it ideal for .NET applications.
5. **FTP/FTPS Deployment**:
    
    - **FTP** or **FTPS** can be used to deploy code to App Service.
    - You can connect to the Azure web app using **FTP credentials**, then manually upload your code or application files to the server.
    - Though FTP is more traditional and involves manual file transfer, it can be a good choice for small or static applications.

---

### **Choosing Between Automated and Manual Deployment**:

**Automated Deployment**:

- Ideal for **frequent updates** and when using **version control systems** like GitHub or Azure Repos.
- Suitable for teams that want to integrate **CI/CD pipelines** to automate testing, building, and deployment.
- Recommended for **production environments** where rapid iteration is essential, and manual steps can introduce human error.

**Manual Deployment**:

- Ideal for **smaller projects**, **static websites**, or environments where full automation is not needed.
- Useful when you need **fine-grained control** over when and how updates are deployed.
- Suitable for **one-off deployments** or quick fixes when you don't need the full CI/CD pipeline.

---

### **Deployment Considerations**:

1. **Code Consistency**:
    
    - Ensure that your local and remote repositories are in sync to avoid overwriting changes.
2. **Build and Test Automation**:
    
    - In automated deployment, ensure your CI pipeline includes **build and test steps** to catch issues before they are deployed to production.
3. **Rollback Strategy**:
    
    - Always have a rollback strategy in place. In case a deployment causes issues, **Azure App Service** allows you to **swap deployment slots** or roll back to a previous version.
4. **Scaling**:
    
    - After deploying your app, monitor the resource usage. If necessary, you can configure **scaling options** in Azure to adjust the number of instances based on traffic.

---

### **Summary of Deployment Methods**:

|**Method**|**Description**|**Use Case**|
|---|---|---|
|**Azure Repos (CI/CD)**|Automates deployment from **Azure Repos** after every code push.|Ideal for continuous updates and versioning.|
|**GitHub (CI/CD)**|Integrates with **GitHub** for automated deployment.|Best for GitHub-based projects.|
|**Bitbucket (CI/CD)**|Similar to GitHub, but for **Bitbucket** repositories.|Suitable for Bitbucket users.|
|**Git Deployment**|Deploy code by pushing directly to Azure’s **Git URL**.|Simple, manual deployment using Git.|
|**az webapp up (CLI)**|Azure CLI command that **packages and deploys** your app, creating the App Service web app if needed.|Quick, simple CLI deployment.|
|**az webapp deploy**|Deploy **ZIP, WAR, EAR, JAR** packages using Azure CLI.|For deploying packaged applications.|
|**Visual Studio Deployment**|Integrated deployment using **Visual Studio's wizard**, ideal for .NET projects.|Best for .NET developers using Visual Studio.|
|**FTP/FTPS Deployment**|Upload files manually using **FTP** or **FTPS**.|Traditional method, useful for smaller sites.|
