---
tags: azure microsoft powershell cloud devops commands
date: 10th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Locate commands

- a cmdlet is a compiled commands
	- cmdlet can be developed in .NET or .NET Core and invoked as a command within PowerShell.
	- Thousands of cmdlets are available in your PowerShell Installation.

- Cmdlets are named according to a verb-noun naming standard.
	- This helps create consistent names.
		- You can see the list of approved verbs by using the Get-Verb cmdlet.
			- Verbs are organized according to activity type and function
- Here's a part of the output from running Get-Verb:
A![[Pasted image 20241010222002.png]]

- The listing shows the verb and its description.
	- Cmdlet developers should use an approved verb
		- also ensure that the verb description fits their cmdlets function

- Three core smdlets allow you to delve into what cmdlets exist and what they do:
	- Get-Command:
		- lists all the available cmdlets on your system.  Filter the list to quickly find the command you need.
	- Get-Help:
		- invokes the built-in help system. You can also run an alias help command to invoke Get-Help but improve the reading experience by paginating the response
	- Get-Member:
		- When calling a command the response is an object that contains many properties.  Get-Member to drill down into that response and learn more about it.

# Locate commands by using Get-Command

- Get-Command you get a list of every commmand that's installed in PowerShell.  Thousands of commands are installed you need a way to filter the response so you can quickly locate the command that you need.

- To filter the list Use flags to target  either the verb or the noun in the command you want.
	- The flag you specify expect a value that's a string.
		- You can add pattern-matching characters to the string to ensure you express that a flag's value should start or end with a certain string
- These examples show how to use flags to filter a command list:

- -Noun:
	- The -Noun flag targets the part of the comnmnand name  that's related to the noun.  Example
![[Pasted image 20241010223003.png]]

- This command searches for all cmdlets whose noun part starts with alias.

- Verb:
	- The -Verb flag targets the part of the command name that's related to the verb.  You can combine the -Noun flag and the -Verb flag to createe an even more detailed search query and type.
	- Example:
![[Pasted image 20241010223116.png]]

- Now you've narrowed the search to specify that the verb part needs to match Get, and the noun part needs to match alias.