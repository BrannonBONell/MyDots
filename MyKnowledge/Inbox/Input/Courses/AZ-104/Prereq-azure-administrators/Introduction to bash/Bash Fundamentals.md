---
tags: azure microsoft devops cloud bash shell
date: 10th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Understand Bash
>[!summary] 
>- Bash syntax is command [options] [arguments]
>- To get help in bash you man command
>- Wildcards can help you do many things in bash


- Full syntax for a Bash command:
![[Pasted image 20241010115042.png]]

- The first string encountered is treated as a command
- To list contents of the current working directory
![[Pasted image 20241010115135.png]]

- Arguments often accompany a command EX:
![[Pasted image 20241010115207.png]]

- Most bash commands have options which are like asking for more specific instructions of the command
- Example:
![[Pasted image 20241010115308.png]]

- You can combine options or flags
![[Pasted image 20241010115337.png]]

- Bash is concise

# Get Help

- get help in bash with man
![[Pasted image 20241010115427.png]]

>[!cue] Get Help
>use man command
>or command --help 
>to get help in bash
- Also most commands support --help option
- Example: mkdir --help
![[Pasted image 20241010115505.png]]

# Use wildcards

- asterisk is most commonly used wildcard, it represents 0 characters or a sequence of characters
	- Imagine you had thousands of image files but only wanted to see the PNG files
![[Pasted image 20241010115629.png]]

> [!important]
> Linux has no formal concept of a file-name extensions as other OS's do.  This doesn't mean that .PNG files won't have a .png extension.  It simply means Linux attaches no special significance to the fact that the file names end with .png.

>[!cue] What are
>Wildcards?
- The same directory has some jpeg files some listed as .jpg and .jpeg
![[Pasted image 20241010125559.png]]

- Another way of listing them
![[Pasted image 20241010125615.png]]

- The * wildcard matches on zero or more chars.
	- The ? wildcard represents a single character
		- If the current directory contains files name 0001.jpg, 0002.jpg, and so on through 0009.jpg
		- Command lists them all:
![[Pasted image 20241010125756.png]]

- Filter output by using []
	- Denote groups of characters..
		- Following command lists all the files in the CD whose names contain a period immediately followed a lowercase j or p. it will list all the .jpg .jpeg and .png files, but not .gif files
![[Pasted image 20241010125914.png]]

- File names and commands are case sensitive
	- To list all the files in the CD whose names contain periods followed by an uppercase or lowercase J or P
![[Pasted image 20241010130012.png]]

- Expressions in brackets can represent a range of characters
	- Following command lists all the files in the cd whose names begin with a lowercase letter:
![[Pasted image 20241010130050.png]]

- Following command lists all the files in the cd whose names begin with an uppercase letter:
![[Pasted image 20241010130124.png]]

- FOllowing command lists all the files in the cd whose names begin with a lowercase or uppercase letter:
![[Pasted image 20241010130154.png]]

- if you need to use a wildcard character as an ordinary character you make it literal or escape it.
	- By prefacing it with a backslash
		- IF for some reason a * was part of a file name you could use a command like this:
![[Pasted image 20241010130330.png]]