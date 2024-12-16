---
tags: microsoft azure powershell cloud devops
date: 10th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# What is PowerShell

- PowerShell consists of two parts:
	- A command line shell
	- and a scripting language
	- Started out as a framework to automate administrative tasks in Windows
		- PowerShell has grown into a cross-platform tool that's used for many kinds of tasks

- A command-line shell lacks a gui
	- Instead you type text commmands into a computer console
	- here are some benefits of using a console:
		- Much faster than using a GUI
		- Ideal for task automation for continuous-integration pipelines.
		- Use a console to interact with cloud resources and other resources
		- Store commands and scripts in a text file and use a source-control system.  This is probably one of the biggest benefits, your commands are repeatable and auditable.  In many systems everything must be traced and evaluated, or audited.  Audits cover everything from database changes to changes done by a script.

# Features

- PowerShell shares some features with traditional shells
	- Built-in help system:
		- Most shells have a help system, which you can learn more about a command.  The help system in PowerShell provides information about commands and also integrates with online help articles.
	- Pipeline:
		- Traditional shells use pipeline to run commands sequentially.  Output of one command is the input for the next command.  PowerShell implements this concept like traditional shells but differs because it operates on objects over text.
	- Aliases:
		- Are alternate names that can be used to run commands.  PowerShell supports the use of common aliases such as cls(clear the screen) and ls(list the files).  Therefore, new users can use their knowledge of other frameworks and don't necessarily have to remember the PowerShell name for familiar commands

- PowerShell differs from a traditional command-line shell in a few ways
	- It operates on objects over text:
		- Command-line shells, you have to run scripts whose output and input might differ so you end up spending time formatting the output and extracting the data you need.  In PowerShell you use objects as input and output. This means you spend less time formatting and extracting
	- It has cmdlets:
		- Commands are called cmdlets. Cmdlets are built on a common runtime rather than separate executables as they are in many other shell environments.  This provides a consistent experience in parameter parsing and pipeline behavior.  Cmdlets usually take object input and return objects.  Core cmdlets in PowerShell are built in .Net Core, and are open source.  You can extend PowerShell by using more cmdlets, scripts, and functions from the community and other sources, or you can build your own cmdlets in .NET Core or PowerShell
	- It has many types of commands:
		- Commands can be native executables, cmdlets, functions, scripts, or aliases.   Every command you run belongs to one of these types.

