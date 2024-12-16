---
tags: azure cloud devops microsoft az-400 git local
date: 30th-October-2024
---

# Working with git locally

Using **Git** with **Continuous Delivery (CD)** enables quality management and automation in your codebase, vital for rapid, reliable software delivery. Here’s a step-by-step overview to help you get started with Git, automate checks, and perform key operations in **Visual Studio Code (VS Code)**.

---

#### Key Git Operations

1. **Set Up Environment**:
    
    - Install required tools: **.NET SDK**, **VS Code**, **C# extension**, and **Git**.
2. **Initialize a Git Repository**:
    
    - Open Command Prompt, create a new folder, initialize Git:
        
        bash
        
        Copy code
        
        `mkdir myWebApp cd myWebApp git init`
        
    - Configure global settings:
        
        bash
        
        Copy code
        
        `git config --global user.name "Your Name" git config --global user.email "your.email@example.com"`
        
3. **Create and Version a New Project**:
    
    - Generate a new ASP.NET Core app:
        
        bash
        
        Copy code
        
        `dotnet new mvc`
        
    - Open the project in VS Code:
        
        bash
        
        Copy code
        
        `code .`
        
4. **Create `.gitignore`**:
    
    - Exclude unnecessary folders (like `.VS Code`) from version control:
        - Select a file, use `F1`, type `gitIgnore`, and add the folder.
5. **Stage and Commit Code in VS Code**:
    
    - From VS Code’s Git menu, add a commit message and click the checkmark to stage and commit changes.
6. **Branch Management**:
    
    - Check current branches:
        
        bash
        
        Copy code
        
        `git branch --list`
        
    - Create and switch to a new branch:
        
        bash
        
        Copy code
        
        `git branch feature-devops-home-page git checkout feature-devops-home-page`
        
    - Edit and commit changes:
        
        bash
        
        Copy code
        
        `git add . git commit -m "updated welcome page."`
        
7. **Merge and Delete Branches**:
    
    - Merge branch changes back into main:
        
        bash
        
        Copy code
        
        `git checkout main git merge feature-devops-home-page`
        
    - Delete the feature branch:
        
        bash
        
        Copy code
        
        `git branch --delete feature-devops-home-page`
        

---

#### Viewing Change History

- **Git Logs**:
    
    - View commit history:
        
        bash
        
        Copy code
        
        `git log -v`
        
    - Check file changes within commits:
        
        bash
        
        Copy code
        
        `git log -p`
        
- **Undo Changes with Git Reset**:
    
    - Reset to a previous commit:
        
        bash
        
        Copy code
        
        `git reset --hard [commit_hash]`
        

---

### Additional Tips

- **Git Lens** in VS Code for detailed history and comparison commands.
- **Commit and Stage Separately**: Running `git add` stages changes, while `git commit` saves them.

![Screenshot of Web App from Visual Studio Code.](https://learn.microsoft.com/en-us/training/wwl-azure/introduction-to-devops/media/web-app-from-visual-studio-code-578464bb-8d1dc0c2-f7676947.png)

**![Screenshot of add file to .gitignore action.](https://learn.microsoft.com/en-us/training/wwl-azure/introduction-to-devops/media/add-file-gitignore-a59fa521-82e51d96-856ec323.png)

![Screenshot of add vscode folder to .gitignore action.](https://learn.microsoft.com/en-us/training/wwl-azure/introduction-to-devops/media/gitignore-0eac5553-d1ca4ff7-3fd1e0b2.png)

![Screenshot of commit using VS Code.](https://learn.microsoft.com/en-us/training/wwl-azure/introduction-to-devops/media/commit-using-vscode-e38129f0-a2c50b72-c02b9039.png)

![Screenshot of Program.cs code showing class decoration.](https://learn.microsoft.com/en-us/training/wwl-azure/introduction-to-devops/media/program-code-showing-class-decoration-318e7a26-a823ee22-fde890d3.png)


![Screenshot of localhost welcome page.](https://learn.microsoft.com/en-us/training/wwl-azure/introduction-to-devops/media/localhost-welcome-page-d81bd903-3c672201-3596de95.png)

![Screenshot of merge feature-devops-home-page output window.](https://learn.microsoft.com/en-us/training/wwl-azure/introduction-to-devops/media/merge-feature-devops-home-page-output-window-4ee10ad1-1c83334e-d02466fd.png)

![Screenshot of history of changes in the main branch.](https://learn.microsoft.com/en-us/training/wwl-azure/introduction-to-devops/media/history-changes-master-branch-721b0c7f-873e304b-adb926f3.png)

![Screenshot of the command line-showing git log -p output with the file changes.](https://learn.microsoft.com/en-us/training/wwl-azure/introduction-to-devops/media/command-line-showing-git-log-output-c8e1eec2-2144654f-b8c78288.png)

These steps help you understand Git basics, collaborate effectively, and streamline your CD process using Git and VS Code.