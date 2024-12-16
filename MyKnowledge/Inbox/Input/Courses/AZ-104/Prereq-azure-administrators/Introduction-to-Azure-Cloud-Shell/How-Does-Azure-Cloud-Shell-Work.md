---
tags: microsoft azure devops cloud shell
date: 10th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# How does azure cloud shell work

1. **Access Azure Cloud Shell**:
    
    - Open a web browser on your laptop.
    - Navigate to the Azure portal and log in with your organization's credentials.
    - Launch Azure Cloud Shell from the portal. You can choose between Bash or PowerShell, depending on your preference or the scripts you need to run.
2. **Mount Azure File Share**:
    
    - Use Azure Cloud Shell to mount an Azure File Share where your diagnostic scripts are stored. This allows you to access the necessary tools and scripts without needing your administrative workstation.
3. **Diagnose the VM Issue**:
    
    - Run your diagnostic scripts from the mounted file share to assess the state of the VM.
    - Check for common issues such as resource constraints, application errors, or connectivity problems.
4. **Remediate the Problem**:
    
    - Based on the diagnosis, take appropriate actions to resolve the issue. This might include restarting the VM, adjusting resource allocations, or rolling back the recent application update if necessary.
5. **Verify VM Operation**:
    
    - Ensure that the VM is back to normal operation and that the development team can access it remotely.

By using Azure Cloud Shell, you can perform these tasks efficiently without needing your usual workstation, leveraging the cloud-based environment to manage Azure resources directly from a web browser.

# Access Cloud Shell
- THeres a few different options for accessing Azure Cloud Shell:
	- From a direct link : [https://shell.azure.com](https://shell.azure.com/)
![[Pasted image 20241010005532.png]]

- From the Azure portal
![[Pasted image 20241010005557.png]]

- from code snippets when accessing Microsoft learn
![[Pasted image 20241010005624.png]]

- When you open a cloud Shell session
	- A temporary host is allocated to your session
	- This VM is preconfigured with the latest versions of PowerShell and Bash
		- You can then select the command-line experience you want to use.
![[Pasted image 20241010005815.png]]

- After you select the shell experience you want to use, you can start managing your Azure resources:
![[Pasted image 20241010005842.png]]

- Cloud sessions terminate after 20 minutes of inactivity
	- When session terminates, files on your CloudDrive are persisted
		- You need to start a new session to access the Cloud Shell environment.

# Access your own scripts and files

- When using cloud shell
	- Might also need to run scripts or use files for different actions
		- You can persist files on CloudShell by using the Azure CloudDrive
![[Pasted image 20241010010049.png]]

- After uploading files you can interact with them as you would in a regular PowerShell or Bash session:
![[Pasted image 20241010010120.png]]

- Once your file resides on CLoudDrive you can close the session and open another session on a different device and still access the samne file.
	- Cloud Shell also lets you map an Azure Storage File Share
		- Which is tied to a specific region.
		- Acess to an Azure File Share lets you work with the contents of that share through Cloud Shell

- If you need to edit scripts hosted on the CloudDrive or File Share
	- Use the Cloud Shell editor.
	- Select the curly brackets icon on the browser and open the file you want to edit, or use the command code and specify the filename
![[Pasted image 20241010010552.png]]

![[Pasted image 20241010010602.png]]

> [!note]
> The code command only works in the Classic mode in the Cloud SHell. To enable Classic mode, select the More icon (...), then select Settings > Go to CLassic Version

# Cloud Shell Tools

- If you need to manage resources (such as docker containers) or want to use non-microsoft tools (Ansible and Terraforms) in Cloud Shell, the Cloud Shell session comes with these add-ons already preconfigured

- List of all add-ons avaialble wwithin a CLoud SHell Session
![[Pasted image 20241010010817.png]]