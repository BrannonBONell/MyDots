---
tags: azure microsoft resource remove cloud devops
date: 10th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Remove resources and resource groups
>[!summary] 
>- Powershell to delete resource groups
>- Can delete and move individual resources

- Caution when deleting a resource group
	- Deleting a resource group deletes all the resources within itl.
	- That resource group might contain resources that resources in other resource groups depend on
![[Pasted image 20241010003723.png]]

# Using PowerShell to delete resource groups

- Remove-AzResourceGroup
	- Example, Removing the ConstosoRG01 resource group from the subscription.  The cmdlet prompts you for confirmation and returns no output.
![[Pasted image 20241010003829.png]]

# Removing Resources
>[!cue] Removing a resource
>You can remove individual resource
- Delete individual resources within a group.  Example deleting a virtual network, instead of deleting you can move the resource to another resource group
![[Pasted image 20241010003933.png]]

#