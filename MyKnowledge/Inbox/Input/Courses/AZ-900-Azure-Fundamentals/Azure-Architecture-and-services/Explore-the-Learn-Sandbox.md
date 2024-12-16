---
tags: sandbox learn microsoft azure cloud compute service
date: 09-30-2024
---

# Use the PowerShell CLI

- You can manage your azure environment using PowerShell commands
	- PowerShell Get-date command to get the current date and time.
- Most Azure specific commands start with the letters az
	- Command to check what version of the CLI you're using:
```pwsh
az version
```

- Use the Bash CLI
	- use bash to switch to a bash shell
```pwsh
bash
```

- In bash mode you can still run az commands

```bash
az upgrade
```

# Azure CLI interactive mode

- Interactive mode changes CLI behavior to more closely resemble an IDE.
	- Provides autocompletion, command descriptions, and even examples
- Enter az interactive to enter interactive mode

```
az interactive
```


- Once initialized, use the arrow keys or tab to help complete your commands
	- Interactive mode is setup specifically for Azure
		- Don't need to enter az to start a command.
- exit to exit interactive mode.

# Use the Azure portal

-  You will have the option to use the Azure portal during sandbox exercises
	- use the link provided in the exercise to access the azure portal
	- Using the link provided instead of opening the portal yourself, ensures the correct subscription is used and the exercise remains free for you.
- 