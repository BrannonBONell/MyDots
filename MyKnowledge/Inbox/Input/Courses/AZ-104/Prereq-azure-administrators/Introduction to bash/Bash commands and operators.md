---
tags: microsoft azure devops cloud bash commands operators
date: 10th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Bash Commands
>[!summary] 
>- ls cat sudo cd mkdir rmdir rm cp ps w are all vital Linux commands
>- I/O operators let you combine linux commands together.

## ls command

- ls lists the contents of your cd or the directory specified in an argument to the command
	- ls by itself lists the contents from the cd
![[Pasted image 20241010130913.png]]

- Files and directories whose names begin with . are hidden by default.  To include hidden files in a directory listing use the -a flag:
![[Pasted image 20241010130955.png]]

- For even more information the long or -l flag:
![[Pasted image 20241010131018.png]]

-  This is an output of a directory that contains a handful of imagse
![[Pasted image 20241010131045.png]]

- Each line provides detailed info about the corresponding file or dir.
	- Information includes the permissions assigned to it, its owner , its size in bytes, and the last time it was modified, and the file or directory name

## cat command

- cat will show the contents of a file it won't make much sense unless its a text file
	- Example:
![[Pasted image 20241010131250.png]]
- useful command to see what linux distro your running
![[Pasted image 20241010131309.png]]

- The /etc dir is special
	- It contains system-config files.


## sudo command

- Some commands can only be run by the root user; system admin or superuser.
- To run commands that require admin privilege without logging in as a superuser, you prefcae the commands with sudo

![[Pasted image 20241010131509.png]]

- sudo stands for superuser do
	- You're telling the shell that for this one command you're acting with the root-user level of permission.

## cd, mkdir, and rmdir commands

- cd stands for change directory
	- enables you to move directories.
		- Example command changes dir to sub dir named orders
![[Pasted image 20241010131645.png]]

- You can move up a dir by using ..
![[Pasted image 20241010131704.png]]

- you can go to your home dir with
![[Pasted image 20241010131721.png]]

- Create directories with mkdir command. 
	- Following command makes a subdir named orders in the current directory
![[Pasted image 20241010131752.png]]

- Create a subdir and a subdir under it with one command, use the --parents flag:
![[Pasted image 20241010131830.png]]

- The rmdir command deletes a directory but only if its empty.
	- you can use the rm -r command to delete directories that aren't empty

## rm command

- Is short for remove
	- it deletes files and dirs
		- Example this deletes 0001.jpg
![[Pasted image 20241010132019.png]]

- And this command deletes all the files in the current dir:
![[Pasted image 20241010132042.png]]

## cp command

- Copy files entire dirs and subdirs.
	- Make a copy of 0001.jpg named 0002.jpg:
![[Pasted image 20241010132156.png]]

- if 0002.jpg already exist bash relaces it.

- You can use wildcards to copy several files at once
	- Copy all the files in the current directory to a subdir named photos:
![[Pasted image 20241010132303.png]]

- Copy all the files in a subdir named photos into a subdir named images:
![[Pasted image 20241010132327.png]]

- This assumes the image dir already exists if it doesn't you can create it and copy the contents of photos dir:

![[Pasted image 20241010133845.png]]

- -r is recursive.
	- added benefit of the -r flag is that if photos contains a subdir of its own, they too are copied to the image dir.

## ps command

- Gives you a snapshot of all the currently running processes.
	- by itself it shows all your shell process
		- if you include -e it lists all running processes.
			- for a more comprehensive look at what processes are running in the system us the -ef flag
![[Pasted image 20241010134042.png]]

- Shows the names of all running processes, their process identification numbers (PIDs), the PIDs of their parents (PPIDs), and when they began (STIME)
- Shows what terminal if any they are attached to (TTY), how much CPU time they've racked up (TIME), and their full path names
![[Pasted image 20241010134234.png]]

- You might find documentation that shows ps being used:
![[Pasted image 20241010134305.png]]

- ps aux and ps -ef are the same
	- This duality traces back to the historical differences between POSIX and Unix systems, and BSD Unix systems (the most common of which is macOS). In the beginning, POSIX used -ef while the BSD required aux.  Today both OS families accept either format

- Excellent reminder of why you should look closely at the manual for all Linux command.
	- Learning Bash is like learning English as a second language.  There are many exceptions to the rules.

## w command

- Find out whos on your servers use the w command
	- Displays information about the users currently on the computer system and those user's activities.  w shows user names, their IP addresses, when they logged in, what processes they're currently running, and how mujch time those processes are consuming.  It's a valuable tool for sysadmins

# Bash I/O operators

- Combine bash commands by using I/O operators
	- `<` for redirecting input to a source other than the keyboard
	- `>` for redirecting output to destination other than the screen
	- `>>` for doing the same, but appending rather than overwriting
	- `|` for piping output from one command to the input of another

- List everything in the cd but capture the output in a file named listing.txt
	- This command does that
![[Pasted image 20241010134820.png]]

- if listing.txt already exists its overwritten
	- if you use >> operator instead, the output from ls is appended to whats already in listing txt:
![[Pasted image 20241010134901.png]]

- Piping operator redirects the output of the first command to the input of the second command
	- cat to display the contents of a large file but the contents scrolls by too quickly for you to read, you can make the output more manageable by pipingt the results to another command such as more.
		- The following command lists all the currently running processes
			- Once the screen is full the output pauses until you select Enter to show the next line:
![[Pasted image 20241010135108.png]]

- Pipe output to head to see just the first several lines:
![[Pasted image 20241010135127.png]]

- Filter the output to include only the lines that contain the word "daemon". One way to do this is by piping the output from ps to grep:
![[Pasted image 20241010135210.png]]
![[Pasted image 20241010135220.png]]

- Use files as input.  standard input comes from the keyboard, but it too can be redirected.
	- To get input from a file instead of the keyboard, use the < operator.
		- One common sysadmin task is to sort the contents of a file.
			- As the name suggests, sort sorts the text in alphabetical order:
![[Pasted image 20241010135342.png]]

- To save the stored results to a new file, you can redirect input and output:
![[Pasted image 20241010135405.png]]

- Use I/O operators to chain Linux commands as needed
	- Example
![[Pasted image 20241010135431.png]]

- Output from cat goes to fmt, the output frfom fmt goes to pr, and so on
	- fmt formats the results into a tidy paragraph, pr paginates the results, and lpr sends the paginated output to the printer, all in a single line.