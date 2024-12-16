---
tags: azure microsoft service file movement devops cloud data
date: 4th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# File movement options
>[!summary] 
>- Azure has three tools designed to help move or interact with individual files or small file groups
>- AzCopy a command line utility to copy blobs or files or from your storage account
>- Azure Storage Explorer a GUI that uses AzCopy on the backend
>- Azure File Sync a bi-directional synchronization with a windows file server and Azure

- Azure has tools designed to help you move or interact with individual files or small file groups
	- AzCopy
	- Azure Storage Explorer
	- Azure File Sync

# AzCopy
>[!cue] AzCopy
>What is AzCopy?
>What can it do?
>Can it work with other
>cloud Providers?
-  Is a command line utility that can be used to copy blobs or files to or from your storage account
	- AzCopy can upload files, download files, copy files between storage accounts, and even synchronize files
		- AzCopy can be configured to work with other cloud providers to help move files back and forth between clouds
	> [!important] 
	>Synchronizing blobs or files with AzCopy is on-direction synchronization.
	>You designate the source and destination and AzCopy will will copy files or blobs in that direction.
	>it doesn't synchronize bidirectionally.

# Azure Storage Explorer
>[!cue] Azure Storage Explorer
> Is it a GUI?
> What OSs does it work on
- Is a standalone app that providesa a GUI to manage files and blobs in your Azure Storage account
	- Works on windows macOS and Linux OSs and uses AzCopy on the backend to perform all of the file and blob management tasks
		- Storage Explorer can upload to Azure download from Azure or move between storage accounts.

# Azure file sync
>[!cue]  Azure File Sync
> Windows file server?
> bi-directional synchronization?
> How does it work?
- A tool that lets you centralize your file shares in Azure Files and keep the flexibility, performance, and compatability of a Windows file server
	- Analogous to turning your Windows file server into a mini content delivery network
		- Once Azure File Sync is installed on your local Windows server
			- It will automatically stay bi-directionally synced with your files in Azure

- Azure File sync can:
	- Use any protocol that's available on Windows Server to access your data locally, including SMB, NFS, and FTPS
	- Have as many caches as you need across the world
	- Replace a failed local server by installing Azure File Sync on a new server in the same datacenter
	- Configure cloud tiering so the most frequently accessed files are replicated locally, while infrequently accessed files are kept in the cloud until requested.