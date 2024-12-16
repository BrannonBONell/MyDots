---
tags:
  - linux
  - streams
  - pipes
  - redirects
  - cli
  - lpic
date: "09-24-2024"
---

# General data pipeline for computers

- Data recieved from some source
  - transformed to generate and intelligible outcome
- Linux shell context
  - Data source can be a local file, remote file, device (keyboard), etc.
    - Program's output is usually rendered on a screen is also common to store the output data in a local filesystem, send it to a remote device, playit through audio speakers, etc

- OS's inspired by UNIX, like Linux, have a great variety of input/output methods
  - File descriptors allows to dynamically associate integer numbers with data channels
    - A process can reference them as its input/output data streams

- Standard Linux processes have three communication channels opened by default
  - the standard input channel (stdin)
  - standard output channel (stdout)
  - standard error channel (stderr)
  - The numerical file descriptors assigned to these channels are 0 to stdin, 1 to stdout, and 2 to sderr.
  - Communcation channels are also accessible through the special devices
    - /dev/stdin
    - /dev/stdout
    - /dev/stderr

- These three standard comm channels allow programmers to write code that reads and writeds data without worrying about the kind of media its coming from or going to.
-  A program needs a set of data as its input, it can just ask for data from  the standard input and whatever is beings used as the standard input will provide that data.
- A program can use the display its output is to write it in the standard output
- In a standard shell session, the keyboard is defined as the stdin and the mnonitor screen is defined as the stdout and stderr.

- Bash has the ability to reassign the comm channels when loading a program
- Override the screen as th standard output and use a file in the local filesystem as stdout

# Redirects

- Reassignment of a channel's file descriptor in the  shell environment is called a redirect
  - A redirect is defined by a special character within the command line
    - redirect the standard output of a process to a file > is positioned at the end of the command and followed by the path to the file that will receive the redirected output:
```bash
$ cat /proc/cpuinfo >/tmp/cpu.txt
```

- Default only the content coming to stdout is redirected
  - Numerical value of the file descriptor should be specifed just before the greater than symbol and when not specified Bash redirects the standard output.
  - Using > is equivalent to using 1> (The value of stdouts file descriptor is 1)
  - To capture the content of stderr the redirect 2> should be used instead.
    - Most cli programs send debug info and error messages to the standard error channel
    - capture the error message triggered by an attempt to read a non existent file:
```bash
$ cat /proc/cpu_info 2>/tmp/error.txt
$ cat /tmp/error.txt
cat: /proc/cpu_info: No such file or directory
```
- Both stdout and stderr are  redirected to the same target with &> or >&
  -  It's important to not place any spaces beside the ampersand, otherwise Bash will take it as the instruction to run the process i nthe background and not to perform the redirect.
  - Target must bea  path to a writable file /tmp/cpu.txt or a writable file descriptor
  - A file descriptor target is represented by an ampersand followed by the file descriptor's numbercal value
    - 1>&2 redirects stdout to stderr.
    - Opposite is stderr to stdout 2>&1

- Redirect to write both stderr and stdout to a file named log.txt can be written as >log.txt 2>&1
  - Main reason for redirecting stderr to stdout is to allow parsing of debug and error messages.
  - a program's stderr first needs to be redirected to stdout in order to be read by another programs stdin.

- .log.txt 2./dev/null saves the contents of stdout in the file log.txt and discards the stderr. 
  - The file /dev/null is writable by any user but no data can be recovered from it, its not stored anywhere.

- An error message is presented if the specified target is not writable.
  - Output redirect overwrites an existing writable target without any confirmation.
  - Files are overwritten by output redirects unless bash option noclobber is enabled
  - Can be done for the current session with the command set -o noclobber or set -C
```bash
$ set -o noclobber
$ cat /proc/cpu_info 2>/tmp/error.txt
-bash: /tmp/error.txt: cannot overwrite existing file
```

- To unset the noclobber option for the current session
  - run set +o noclobber or set +C.
  -  To make the noclobber option persistent, it must be included in the user's Bash profile or in the system-wide profiel.

- Even with the noclobber option enabled it is possible to append redirected data to existent content
  - This is accomplished with a redirection written with two >>
```bash
$ cat /proc/cpu_info 2>>/tmp/error.txt
$ cat /tmp/error.txt
cat: /proc/cpu_info: No such file or directory
cat: /proc/cpu_info: No such file or directory
```

- In this previous example the new error message was appended to the existing one in the file /tmp/error.txt.
- If the file does not exist yet, it will be created

- The data source of the stdin of a process can be reassigned as well.
- The < is used to redirect the content of a file to the stdin of a process
-  data flows from right to left:
  - the reassigned descriptor is assumed to be 0 at the left of the less than symbol and the data source( a path to a file) must be at the right of the <.
  - The command uniq accepts data sent to stdin by default
```bash
$ uniq -c </tmp/error.txt
2 cat: /proc/cpu_info: No such file or directory
```

- -c option makes uniq display how many times repeated line appears in the text.
  - the numberic value of the redirected file descriptor was suppressed
  - the example command is equivalent to uniq -c 0</tmp/error.txt.
  - To use a file ddescriptor other than 0 in an input redirect only makes sense i nspecific contexts
    - because it is possible for a program to ask for data at file descriptors 3,4, etc.
    -  Programs can use any integer above 2 as a new file descriptor for data input/output.
    - The following C code reads data from the file descriptor 3 and just replicates it to file descriptor 4

> [!note]
>The program must handle such file descriptors correctly, otherwise it could
>attempt an invalid read or write operation and crash.


![2024-09-25-at-07-39-04.png](2024-09-25-at-07-39-04.png)

- To test, save the sample code as fd.c and compile it with gcc -o fd fd.c
  - This program needs file descriptors 3 and 4 to be available so it can read and write to them.
  - As an example, the previously created file /tmp/error.txt can be used as the source for file descriptor 3 and the file descriptor 4 can be redirected to stdout:
```bash
$ ./fd 3</tmp/error.txt 4>&1
cat: /proc/cpu_info: No such file or directory
cat: /proc/cpu_info: No such file or directory
```

- From a programmer's perspective, using file descriptors avoids having to deal with option parsing and filesystem paths.
  - The same file descriptor can bve used as input and output.
    - The file descriptor is defined in the command line with both <>
      - 3<>/tmp/error.txt

# Here Document and Here String

- Another way to redirect input involve the Here document and Here string methods
  - Here document redirect allows to type multi-line text that will be used as the redirected content
  -  Two << indicate a Here document redirect

![2024-09-25-at-07-42-45.png](2024-09-25-at-07-42-45.png)

- At the right of the << is the ending term EOF.
  - The insertion mode will finish as soon as a line containing only the ending term is entered.
    - Any other term can be used as the ending term, bit it is important to not put blank characters betweeen the < and the ending term.
    - The two lines of text were sent to the stdin of wc -c command, which displays the characters count.
      - As with input redirects for files the stdin is assumed if the redirected file descriptor is suppressed

- The Here string method is much like the Here document mthod, but for one line only:
```bash
$ wc -c <<<"How many characters in this Here string?"
41
```

- String at the right of the <<< is sent to the stdin of wc -c
 - which counts the number of characters
 - Strings containing spaces must be inside quotes, otherwise only the first word will be used as the Here string and the remaining ones will be passed as arguments to the command

### Guided exercises


![2024-09-25-at-07-46-38.png](2024-09-25-at-07-46-38.png)

### Explorational Exercises


![2024-09-25-at-07-47-23.png](2024-09-25-at-07-47-23.png)


# Pipes

- Unlike redirects
  - Pipes data flows  from left to right in the CLI and the target is another process, not a filesystem path, file descriptor or Here document.
    - The pipe character | tells teh shell to start all distinct commands at the same time and to connect the output of the previous command to the input of the following command left to right.
    - Instead of redirects the content of the file /proc/cpuinfo sent to the stdout by cat can be piped to stdin of wc with the following:
```bash
$ cat /proc/cpuinfo | wc
208 1184  6096
```
- In the absence of a path to a file wc counts the number of lines words and characters it recieves o nthe stdin
  - Manyh pipes can be present in a compund command
```bash
$ cat /proc/cpuinfo | grep 'model name' | uniq
model name    : Intel(R) Xeon(R) CPU    X5355   @ 2.66GHz
```

- Content of file /proc/cpuinfo produced by cat /proc/cpuinfo was piped to the command grep 'model name', which then slects only the lines containing the term model name.
  - The machine running the example has many CPUS, there are repeated lines with model name.
  - The last pipe connects grep 'model name' to uniq
    - Which is responsible for skipping any line equal to the previous.

- Pipes can be combined with redirects in the same CLI
  - The previous example can be rewritten:
```bash
$ grep 'model name' </proc/cpuinfo | uniq
model name    : Intel(R) Xeon(R) CPU    X5355   @ 2.66GHz
```

- The input redirect for grep is not strictly necessary as grep accepts a file path as argument
  - the example demonstrates how to build such combined commands.

- Pipes and redirects are exclusive, that is, one source can be mapped to only one target.
  - Yet it is possible to redirect an output to a file and still see it on the screen with program tee.
  - To do it the first program sends its output to the stdin of tee
  - A file name is provided to the latter to store the data:

![2024-09-25-at-07-55-25.png](2024-09-25-at-07-55-25.png)

- THe output of the last program in the chain
  - generated by the uniw is displayed and stored in the file cpu_model.text
    - To not overwrite the content of the provided file but to append data to it, the option -a must be proveded to tee.

- Only the stdout of a process is captured by a pipe
  - You must to go through a long compilation process on the screen and at the same time save both the stdout and stderr to a file for later inspection.
  - Assuming your cur dir doesn't have a Makefile the following command will output an error:
```bash
$ make | tee log.txt
make: *** No targets specified and no makefile found. Stop.
```

- Although shown on the screen, therror message generated by make was not captured by tee and the file log.txt was created empty.
  - A redirect needs to bdone before a pipe can capture the stderr


![2024-09-25-at-08-00-13.png](2024-09-25-at-08-00-13.png)

- Above the stderr of make was redirected to the stdout
  - so tee was able to capture it with a pip display it on the screen and save it in the file log.txt
  -  In cases like this, it may be useful to save the error messages for late inspection.

# COmmand substitution

- To capture the output of a command is the command substitution.
  - By placing a command inside backquotes, Bash replaces it with its stdout.
  - How to use the stdout of a program as an argument to another program:
```bash
$ mkdir `date +%Y-%m-%d`
$ ls
2019-09-05
```

-  The stdout of the program date the current date formatted as year-month-day was used as an argument to create a dir with mkdir.
  - An identical result is obtained by using $() instead of backquotes

```bash
$ rmdir 2019-09-05
$ mkdir $(date +%Y-%m-%d)
$ ls
2019-09-05
```

- The same method can be used to store the output of a cojmmand as a variable:
```bash
$ OS=`uname -o`
$ echo $OS
GNU/Linux
```

- The command uname -o outputs the generic name of the current OS.
  - Which was stored in the session variable OS
  - To assign the output of a command to a variable is very useful in scripts, making it possible to store and evaluate the data in many distinct ways.

- Depending on the output generated by the replaced command, builtin command substitution may not be appropriate
  - A more sophisticated method to use the output of a program as the argument of another program emplays an intermediate called xargs. 
  - The program xargs uses the contents it recieves via stdin to run a given command with the contents as its argument.
  - The example shows xargs running the progrem identify with arguments provided by program find:


![2024-09-25-at-08-06-23.png](2024-09-25-at-08-06-23.png)

- The program identify is part of ImageMagick, a set of CLI tools to inspect, convert and edit most image file types
  -  Xargs took all paths listed by find and put them as arguments to identif, which then shows the information for each file formatted as requiored by the option -format.
  - The files found by find in the example are images containing the distribution logo in Debian filesystems
    - -format is aparameter to identify, not xargs

- Option -n 1 requires xargs to run the given commmand with only one argument at a time.
  - In the example's case, instead of passing all paths found by find as a list of arguments to identify, using xarrgs -n 1 would execute command identify for each path separately
    - Using -n 2 would execute identify with two paths as arguments, -n 3 with three paths as arguments and so on.  Similarly when xargs process multiline contents as is the case with input provided by find the option -L cna be used to limit how many lines will be used as argurments per command execution

> [!note]
>Using xargs with option -n 1 or -L 1 to process output generated by find may be
>unnecessary. Command find has the option -exec to run a given command for
>each search result item.

- If the paths have space characters it is imortant to run find with the option -print0.
  -This option instructs find to use a null character between each entry so the list can be correctly parsed by xargs(the output was suppressed)
```bash
$ find . -name '*avi' -print0 -o -name '*mp4' -print0 -o -name '*mkv' -print0 | xargs -0 du
| sort -n
```

- The option -0 tells xargs the null character should be used as the separator.
  - That way the file paths given by find are correctly parsed even with blank or other special characters in it
  - The prev example shows how to use the command dud to find out the disk usage of every file found and then sor
  - the result by size
  - The stdout was suppressed for conciseness.
    - Note that for each search criteria it is necessary to place the -print0 option for find

  - By default, xargs places the arguments of the executed command last
    - To change that the option -I Should be used
```bash
$ find . -mindepth 2 -name '*avi' -print0 -o -name '*mp4' -print0 -o -name '*mkv' -print0 |
xargs -0 -I PATH mv PATH ./
```

- In the last example every file found by find is moved to the cur dir
  - As the source paths must be informed to mv before the target path
    - substitution term is given to the option -I of xargs which is then appropriately placed alongsid mv
    - By using the null character as separator, it is not necessary to enclose the substitution term with quotes


### Guided Exercises


![2024-09-25-at-08-16-02.png](2024-09-25-at-08-16-02.png)

### Exploration Exercises


![2024-09-25-at-08-16-35.png](2024-09-25-at-08-16-35.png)


