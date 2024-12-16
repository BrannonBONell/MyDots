---
tags:
  - linux,
  - file,
  - editing
date: 09/24/2024
---

# Different types of files

- Regular files
  - store data and programs

- Directories
  - contain other files
- Special files
  - are used for input and output

- Of course other kinds of files exist

# Manipulating Files

## Using ls to List files

ls will list file and directory names only

```bash
$ ls
Desktop Downloads
 emp_salary
 file1
 Music
 Public
 Videos
Documents
 emp_name
 examples.desktop
 file2
 Pictures
 Templtes
```

- ls -l is long listing
![2024-09-24-at-05-47-33.png](2024-09-24-at-05-47-33.png)


The first character in the output indicates the file type:

"-"
  - for a regular file
d
  - for a directory
c
  - for a special file

To show the file sizes in a humjan readable format add the option -h

![2024-09-24-at-10-58-59.png](2024-09-24-at-10-58-59.png)

To list all files including hidden files ls -a

![2024-09-25-at-03-17-04.png](2024-09-25-at-03-17-04.png)

- In general, the ls comand syntax is given by:
```bash
ls OPTIONS FILE
```

- OPTIONS are any of the options shown previously
  - FILE is the name of the file or directory you want to list

> [!note]
>When FILE is not specified, the current directory is implied.

# Creating Copying, Moving and Deleting Files

- Creating files with touch

- create new empty file:
```bash
$ touch OPTIONS FILE_NAME(S)
```

- w/o any options touch would create a new file for any file names that are provided as arguments
  - If files with such names don't exist already
  - Can Create any number of file simultaneously
```bash
$ touch file1 file2 file3
```

- -a option changes access time -m changes modification time
  - use -am to change both
```bash
$ touch -am file3
```

# Copying Files with cp

-  cp to copy a file from one place to another
```bash
$ cp file1 dir2
```

- Copy file1 into the directory dir2
  - the path to file1 is given with more detail since the user is currently not located in dir1
```bash
$ cp /home/frank/Documents/file2 /home/frank/Documents/Backup
```
- In this case file2 located in /home/frank/Documents
  - is copied into the directory /home/frank/Documents/Backup
  - The source path provided is absolute
  - if path starts with / its absolute
  - otherwise it is a relative path

Syntax for cp is:
```bash
$ cp OPTIONS SOURCE DESTINATION
```

  - SOURCE = file to copy
  - DESTINATION = directory into  the file will be copied
  - SOURCE and DESTINATION can be specified absolute or relative

# Moving files with mv

- moving and renameing files with mv
- mv operation is the analogue to the cut and paste in a GUI
- Move a file to a new destination
```bash
$ mv FILENAME DESTINATION_DIRECTORY
```

- Example:
```bash
$ mv myfile.txt /home/frank/Documents
```

- To rename file use mv like this:
```bash
$ mv old_file_name new_file_name
```

- mv default no prompt -i for prompt
```bash
$ mv -i old_file_name new_file_name
mv: overwrite 'new_file_name'?
```

- -f forcefully overwrites the file
```bash
$ mv -f old_file_name new_file_name
```

# Deleting files with rm

- remove files with rm
```bash
$ rm file1
```

- -i option for a prompt
```bash
$ rm -i file1
rm: remove regular file 'file1'?
```

- -f will forcefully delete a file
```bash
$ rm -f file1
```

- delete multiple files at the same time:
```bash
$ rm file1 file2 file3
```

- rm syntax:
```bash
$ rm OPTIONS FILES
```

# Creating and Deleting Directores

## Creating Directories with mkdir

- Create a directory with
```bash
$ mkdir OPTIONS DIRECTORY_NAME
```

- Create multiple directories same time
```bash
$ mkdir dir1 dir2 dir3
```

- Create directory together with subdirectories with option -p(parents)
```bash
$ mkdir -p parents/children
```
- children would be located inside parents

## Removing Directories with rmdir

- rmdir deletes directories if they are empty
```bash
$ rmdir OPTIONS DIRECTORY
```

- DIRECTORY could be a single or list of arguments
```bash
$ rmdir dir1

$ rmdir dir1 dir2
```

- remove dir with a a subdir
```bash
$ rmdir -p parents/children
```
- this won't work unless the directories are empty

## Recursive Manipulation of Files and Directories

- Recursion is do an action and repeat that action all down the directory tree.
  - In Linux, the options -r or -R or --recursive are generally associated with recursion

- list contents of dir students
  - contains two subdirs level 1 and level 2
  - and a file named frank
  - by applying recursion to ls it will list the content of students and all other subdirs and contents

![2024-09-25-at-03-42-37.png](2024-09-25-at-03-42-37.png)

- listing above mydirectory including all contents are listed

- list contents of a dir and its subdirs use:
```bash
$ ls -R DIRECTORY_NAME
```

# Recursive copy with cp -r

cp -r(-R or --recursive) copy a directory together with all its subdirs and files:

![2024-09-25-at-03-46-15.png](2024-09-25-at-03-46-15.png)

- copying directories and subdirectories use
```bash
$ cp -r SOURCE DESTINATION
```

# Recursive deletion with rm -r

- rm -r will delete a directory and all of its contents

- trying to delete a directory witout using -r the system woudl error:
```bash
$ rm newcopy/
rm: cannot remove 'newcopy/': Is a directory
$ rm -r newcopy/
```

- Have to add -r as the second command for deltion to succeed

- add -i to recieve confirmation prompt
```bash
$ rm -ri mydir/
rm: remove directory 'mydir/'?
```

# File Globbing and Wildcards

- globbing is a feature of UNIX/Linux shelll to represent multiple file names by using special characters
  - called wildcards.
  - Wildcards are essentially symbols which may be used to substitute for one or more characters
  - Wildcards let you show all files that start with the letter A or  all the files taht end with tthe letters .conf

- Examples of globbings
  - rm *
    - Delete all files in the current work dir
  ls l?st
    - List all files with names beginning with l followed by a singl character and ending in st
  rmdir [a-z]*
    - Remove all directories whose names start with a letter

  ## Types of Wildcards

  - three wildcards in linux

  - *(asterisk)
    - one or more occurrences of any character.
  - ?(question mark)
    - represents a single occurence of any character
  - [ ] (bracketed characters) 🆔 hkNm03
    - represents any occourrence of the character(s) enclosed in the brackets

- The Asterisk
  - an * matches zero, one or more occurrences of any character
```bash
$ find /home -name *.png
```
- find all files that end wiht .png

```bash
$ ls lpic-*.txt
```
- list all text files that start with the characters lpic-
  - followed by a number of characters and end with .txt

- The asterisk wildcard can be used with cp rm or mv all the contents of a directory
```bash
$ cp -r animal/* forest
```
- all contents of animal is copied into forest

- Copy all contents of a dir:
```bash
cp -r SOURCE_PATH/* DEST_PATH
```
- SOURCE_PATH can be omitted if we are in the required dir
  - any wildcard can be used repeatedly in the same command and at any position
```bash
$ rm *ate*
```

- Filenames prefixed with zero, on or more occurrence of any character followed by letters ate
  - and endwith with zero, one or more occurence of any character would be removed.

- The Question Mark
  - the ? matches a single occurence of a character
![2024-09-25-at-04-00-39.png](2024-09-25-at-04-00-39.png)

- To return only the files that start with l
  - followed by any single character and the characters st.txt:

![2024-09-25-at-04-01-34.png](2024-09-25-at-04-01-34.png)

Similar:
![2024-09-25-at-04-02-09.png](2024-09-25-at-04-02-09.png)

- output files are prefixed with any two characters followed by st.txt

## Bracketed Characters

- Match any occurrence of the character(s) enclosed in the square brackets:
```bash
$ ls l[aef]st.txt
last.txt  lest.txt
```
- brackets can also take ranges
```bash
$ ls l[a-z]st.txt
last.txt  lest.txt  list.txt
```
- Multiple ranges could also be applied
```bash
$ ls
student-1A.txt  student-2A.txt  student-3.txt
$ ls student-[0-9][A-Z].txt
student-1A.text student-2A.txt
```
- Listing shows school dir with a list of students.  To list only those students whose registration numbers meet the following criteria:
  - begin with studint-
  - followed by a number, and an uppercase character
  - and end with .txt

# Combining Wildcards

```bash
$ ls
last.txt  lest.txt  list.txt  third.txt past.txt
```

```bash
$ ls [plf]?st*
last.txt  lest.txt  list.txt  past.txt
```
- first wildcard [plf] matches any of the characters p,l,or f
  - second wildcard ? matches any single character
  - third wildcard * matches zero, on or many occurrences of any character


![2024-09-25-at-04-08-51.png](2024-09-25-at-04-08-51.png)

- The previous command displays all files that begin with the letter f, followed by any set of letters,
at least one occurrence of a digit and ends with .txt. Note that file.txt is not displayed as it
does not match this criteria.

### Guided Exercises

1. Consider the listing below:

![2024-09-25-at-04-10-26.png](2024-09-25-at-04-10-26.png)
◦ What does the character d represent in the output?
__d is the character that identifies a directory.__
◦ Why are the sizes given in human readable format?
__Due the option -h.__
◦ What would be the difference in the output if ls was used with no argument?
__Directory and file names would be provided only.__

2. Consider the command below:
```bash
$ cp /home/frank/emp_name /home/frank/backup
```
◦ What would happen to the file emp_name if this command is executed successfully?
__emp_name would be copied into backup.__
◦ If emp_name was a directory what option should be added to cp to execute the command?
__-r__
◦ If cp is now changed to mv what results do you expect?
__emp_name would be moved into backup. It would no longer be present inside the home
directory of user frank.__

3. Consider the listing :
```bash
$ ls
file1.txt file2.txt file3.txt file4.txt
```
Which wildcard would help to delete all the contents of this directory?
__the asterisk *__

4. Based on the previous listing, what files would be displayed by the following command?
```bash
$ ls file*.txt
```
__All of them, since the asterisk character represents any number of characters.__

5. Complete the command by adding the appropriate digits and characters in the square brackets
that would list all the content above:
```bash
$ ls file[].txt
```
__file[0-9].txt__

### Explorational Exercises


![2024-09-25-at-04-14-47.png](2024-09-25-at-04-14-47.png)

![2024-09-25-at-04-15-14.png](2024-09-25-at-04-15-14.png)



# How to find files

- find to quickly search and locate find syntax:
```bash
$ find STARTING_PATH OPTIONS EXPRESSION
```
  - STARTING_PATH
    - the dir where the search begins
  - OPTIONS
    - Controls the behavior and adds specific criteria to optimize search results
  - EXPRESSION
    - defines search query

	```bash
$ find . -name "myfile.txt"
./myfile.txt
```

- Starting path is current dir
  - option is -name specifies that the search is based on the name of the file
  - myfile.txt is the name of the file to search
  - when using file globbing, be sure to include the expression in quotation marks:
```bash
$ find /home/frank -name "*.png"
/home/frank/Pictures/logo.png
/home/frank/screenshot.png
```

- Finds all files ending with .png starting from /home/frank dir

## Using Criteria to SPeed Search

- find works with type, size, or time

Switches to finiding files based on type:

- -type f
  - file search
- -type d
  - dir search
- -type l
  - symbolic search

```bash
$ find . -type d -name "example"
```
- finds al ldirs in the current dir and below, that have the name "example"

- Other criteria which could be used with find:

- -name
  - search based on the given name
- -iname
  - based on name the case is not important
- -not
  - returns those results that do not match the test case.
- -mexdepth N
  - searches current dir as well as subirs N levels deeps

```bash
$ sudo find / -name "*.conf" -mtime 7
/etc/logrotate.conf
```
- Seach for all files in the entire filesystem (starting at root /)
  - and ending with characters.conf and have been modified in the last seven days
  - this command would require elevated privileges to access directories starting from the base of the systems directory structure so sudo was used
  - argument passed to mtime represents the number of days since the file was modified

## Locating files by size

- find can aslo lacate files by size
- search for files larger than 2G in /var
```bash
$ sudo find /var -size +2G
/var/lib/libvirt/images/debian10.qcow2
/var/lib/libvirt/images/rhel8.qcow2
```
- -size option displays file sizes corresponding to the argument passed:

- -size 100b
  -files which are exactly 100bytes
- -size +100k
  - files taller than 100kb
- -size -20M
  - files smaller than 20MB
- -size +2G
  - files larger than 2GB

# Acting on the Result set

-Once search is dont, it is possible to perform an action on the resulting set using -exec:
```bash
$ find . -name "*.conf" -exec chmod 644 '{}' \;
```
- Filters every object in the cur dir (.) and below for file names ending in .conf
  - then executes chmod 644 command to modify file permissions on the results

## Using grep to Filter for Files Based on Content

- grep is used to search for the occurrence of a keyword

![2024-09-25-at-04-34-43.png](2024-09-25-at-04-34-43.png)

- Search every object in the  current dir hierarchy(.) that is a file (-type f) and then executes the command grep "lpi" for every file that satisfies the conditions
  - The files that match these conditions are printed o nscreen (-print)
  - The curly braces ({}) are a placeholder for the find match results
  - the {} are enclosed in single quotes '' to avoid passing grep files with names containt special characters
  - The -exec command is terminiated with a semicolon (;) which should be escaped (\;) to avoid interpretation by the shell

- Addin the option -delete to the end of an expression would delete all files taht match.
  - This option should be used when you are certain that the results only match tthe files that you wish to delete

- find locates all files in the hierarchy starting from current dr then deletes all files that end with characters .bak
```bash
$ find . -name "*.bak" -delete
```

# Archiving FIles

- The tar Command (Archiving and COmpressing)

- tar is used to create tar  archives by converting a group of files into an archive.
- Archives are created so as to easily move or backup a group of files
- Thnk of tar as a tool that creates a glue onto which files can be attached, grouped and easily moved

- tar also can extract tar archives
  - display a list of files included in the archive
  - add additional files to existing archives

- tar syntax:
```bash
tar [OPERATION_AND_OPTIONS] [ARCHIVE_NAME] [FILE_NAME(S)]
```

- OPERATION
  - Only one operation is allowed/required most frequently used are

  - --create (-c)
    - Create a new tar archive
  - --extract (-x)
    - Extract the entire archive or one or more files from an archive
  - --list (-t)
    - Display a list of files included in the archive


- OPTIONS
  - Most frequently used are:

  - --verbose (-v)
    - Show the files being processed by the tar command
  - --file=archive-name(-f archive-name)
    - specifies the archive file name

- ARCHIVE_NAME
  - The name of the archive
- FILE_NAME(S)
  - A space-separated list of file names to be extracted
    - if not provided the entire archive is extracted

## Creating an archive

- dir named stuff in the cur dir
  - want to save it to a file name archive.tar:
```bash
$ tar -cvf archive.tar stuff
stuff/
stuff/service.conf
```

- -c
  - create an archive
- -v
  - Display progress in terminal while creating archive
    - also known as "verbos" mode
    - The -v is always optional in these commands
- -f
  - Allows to specify the filename of the archinve

- In general to archive a single dir or single file:
```bash
tar -cvf NAME-OF-ARCHIVE.tar /PATH/TO/DIRECTORY-OR-FILE
```

> [!note]
>tar works recursively. It will perform the required action on every subsequent
>directory inside the directory specified.

- To archive multiple dirs at once
  - list all the dirs delimitting them by a space in the section
```bash
$ tar -cvf archive.tar stuff1 stuff2
```
- This would produce an archive of stuff1 and stuff2

## Extracting an Archive
- extract using tar
```bash
$ tar -xvf archive.tar
stuff/
stuff/service.conf
```
- This will extract contents of archive.tar to cur dir

- same command as above except -x replaces -c

- To extract contents of the archive to specific dir we use -C
```bash
$ tar -xvf archive.tar -C /tmp
```
- This will extract the contents of archive.tar to the /tmp dir
```bash
$ ls /tmp
stuff
```

## Compressing with tar

- The GNU tar command included with Linux distros can create a .tar archive and then compress it with gzip or bzip2 compression in a single command
```bash
$ tar -czvf name-of-archive.tar.gz stuff
```
- Would create a compressed file using the gzip algorithm (-z)

- Replace -z for gzip  with -j for bzip2
```bash
$ tar -cjvf name-of-archive.tar.bz stuff
```

- Decompress the file replace -c with -x (extract):
```bash
$ tar -xzvf archive.tar.gz
```

```bash
$ gzip FILE-TO-COMPRESS
```

- gzip
  - creates the compressed file with the same name but with a .gz ending
gzip
  - removes the original files after creating the compressed file

- The bzip2 command works in a similar fashion
  - To uncompress the files we use either gunzip or bunzip2 depending on the algorithm used to compressed a file

## the cpio Command

- cpio stands for copy in copy out.
  - used to process archive files such as *.cpio or *.tar files

- cpio performs the following operations:
  - Copying files to an archive
  - Extracting files from an archive
- It takes the list of files from the standard input (mostly output from ls)
- To create a cpio archive, we use:
```bash
$ ls | cpio -o > archive.cpio
```

- The -o option instructs cpio to create an output
  - Output file created is archive.cpio
  - the ls command lists the contents of the cur dir which are to be archived

- To extract the archive:
```bash
$ cpio -id < archive.cpio
```

- the -i option is used to perform the extract
- the -d option would create the destination folder
- The character < represents standard input
- The input file to be extracted is archive.cpio

## The dd Command

- dd copies data from one location to another.  The command line syntax of dd differs from many other Unix programs
  - it uses the syntax option=value for its commmand lien operations rather than the GNU standard -option value or --option=value formats
```bash
$ dd if=oldfile of=newfile
```
- Would copy the content of oldfile into newfile
  - where if= is the input file and of= refers to the output file

> [!note]
>The dd command typically will not output anything to the screen until the
>command has finished. By providing the status=progress option, the console
>will display the amount of work getting done by the command. For example: dd
>status=progress if=oldfile of=newfile.

- dd is also used in changing data to upper/lower case or writing directly to block devices such as /dev/sbd
```bash
$ dd if=oldfile of=newfile conv=ucase
```
- Copy all the contents of oldfile into newfile and capitalise all of the text.

- Backup the whole hard disk located at /dev/sda to a file named backup.dd:
```bash
$ dd if=/dev/sda of=backup.dd bs=4096
```

### Guided Exercises


![2024-09-25-at-05-02-24.png](2024-09-25-at-05-02-24.png)

### Explorational Exercises


![2024-09-25-at-05-03-16.png](2024-09-25-at-05-03-16.png)

![2024-09-25-at-05-03-31.png](2024-09-25-at-05-03-31.png)
