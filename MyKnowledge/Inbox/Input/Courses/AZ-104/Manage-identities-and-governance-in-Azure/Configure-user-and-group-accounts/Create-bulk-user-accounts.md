---
tags: bulk-user account microsoft azure entra-id devops cloud
date: 11th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Create bulk user accounts

- The most common approach is to use Azure Portal.
- Azure PowerShell can be used for bulk upload of user accounts.

# Things to know about bulk account operations.

- Example of Bulk create user options for new user accounts in Microsoft Entra ID
![[Pasted image 20241011092117.png]]

- Only Global administrators or User administrators can create and delete user accounts in the Azure portal.
- To complete bulk operations, the admin fills out a comma-separated values (CSV) template of the data for the user accounts
- Bulk operation templates can be downloaded from the Microsoft Entra center.
- Bulk lists of user accounts can be downloaded.

# Things to consider when creating user accounts

- __Consider naming conventions:
	- Establish a naming convention for your user accounts.  Apply them to user account names, display names, and user aliases for consistency.  Conventions for names and aliases can simplify the bulk create process.  A convention for user names could begin with the user's last name followed by a period, and end with the user's first name, ie Sawyer5-Miller.Aran@contoso.com
- __Consider using initial passwords:
	- Implement a convention for initial passwords.  Design a system to notify new users about their passwords in a secure way.  Maybe generate a random password and email it to the new user  or their manager.
- __Consider strategies for minimizing errors:
	- View and address any errors, by downloading the results file on the Bulk operation results page.  The results file contains a reason for each error.  Errors might occur when a user account that's already been created or an account that's duplicated.  GeneraLLY ITS EASIER TO UPLOAD AND TROUBLESHOOT SMALLER GROUPS OF USER ACCOUNTS.