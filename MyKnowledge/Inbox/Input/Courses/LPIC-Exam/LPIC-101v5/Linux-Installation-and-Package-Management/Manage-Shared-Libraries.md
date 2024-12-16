---
tags:
  - libraries
  - static
  - dynamic
  - shared
  - linux
  - compiler
date: "09-21-2024"
---
# Manage Shared Libraries

- Shared libraries, also known as shared objects
	- pieces of compiled code that's reusable ie.
		- functions
		- classes
		- etc
- Libraries are collections of code that are meant to be used by many different programs.
- To build an executable program from a program's source code two steps are necessare
	- A Compiler turns the code into machine code and is stored in object files.
	- A Linker combines the object files and links them to libraries to make the final executable file.
		- Linking can be done statically or dynamically.
		- there are static and dynamic libraries
		- Dynamic libraries are called shared libraries
- Static Libraries
	- Is merged with a program at link time.  A copy of the library code is embedded into the program and becomes part of it.  The program has no dependencies on the library at run time because the program already contains the libraries code.
	- The downside to this is statically linked programs are heavier.
- Shared or dynamic libraries
	- The linker takes care that the program references libraries correctly
	- Linker doesn't copy any library code into the program file.
	- At run time the shared library must be available to satisfy the program's dependencies.
	- Economical approach to managing system resources by reducing the size of the program files and only one copoy of the library is loaded in memory, even when it is used by multiple programs.

# Shared Object File Naming Conventions

- Name of shared library known as soname
	- folllows a pattern which is made up of three elements
		- Library name (normally prefixed with lib)
		- so (which stands for "shared object")
		- Version number of the library
	- Example: __libpthread.so.0__
	- By contrast, static library names end in .a Ex. __libpthread.a__

> [!note] 
> Because the files containing shared libraries must be available when the program is executed, most Linux systems contain shared libraries. Since static libraries are only required in a dedicated file when a program is linked, they might not be present on an end user system

- glibc is a good example of a shared library.
- On a Debian GNU/Linux 9.9 system, its file is named __libc.so.6.__
- general file names are normally symbolic links that point to the actual file containing a library.
- In case of glibc, the symbolic link looks like this:
```bash
ls -l /lib/x86_64-linux-gnu/libc.so.6
lrwxrwxrwx 1 root root 12 feb 6 22:17 /lib/x86_64-linux
gnu/libc.so.6 -> libc-2.24.so
```

- This pattern of referencing shared library files named by specific version by more general file name is common practice
- Common locations for shared libraries in a Linux system are:
	- /lib
	- /lib32
	- /lib64
	- /usr/lib
	- /usr/local/lib

> [!note]
> he concept of shared libraries is not exclusive to Linux. In Windows, for example, they are called DLL which  stands for dynamic linked libraries.

# Configuration of Shared Library Paths

- The references contained in dynamically linked programs are resolved by the dynamic linker (ld.so or ld-linux.so)when the program is run
- Dynamic Linker searches for libraries in a number of Dirs.
- These dirs are specified by the library path
- The library path is configured in the /etc dir.
- In the file /etc/ld.so.conf and, more commonly, in files residing in the /etc/ld.so.conf.d dir.
- The former includes just a single include line for \*.conf files in the latter:
```bash
$ cat /etc/ld.so.conf.d/*.conf
include /etc/ld.so.conf.d/*.conf
```

- the /etc/ld.so.conf.d dir contains \*.conf files:
```bash
$ ls /etc/ld.so.conf.d/
libc.conf x86_64-linux-gnu.conf
```

- These \*.conf files must include the absolute paths to the shared library dir:
```bash
$ cat /etc/ld.so.conf.d/x86_64-linux.gnu.conf
#Multiarch support
/lib/x86_64-linux-gnu
/usr/lib/x86_64-linux-gnu
```

- the Idconfig command takes care of reading these files, creating the aformentioned set of symbolic links that help to locate the individual libraries and finally updating the cache file.
- /etc/ld.so.cache. Idconfig needs to be run every time the config files are added or updated.
 - Useful options for Idconfig:
   - -v, --verbose
    - Display the library version numbers, the name of each dir, and the links that are created:

```bash
$ sudo Idconfig -v 
/usr/local/lib:
/lib/x86_64-linux-gnu:
libnss_myhostname.so.2 -> libnss_myhostname.so.2
libfuse.so.2 -> libfuse.so.2.9.7
libidn.so.11 -> libidn.so.11.6.16
libnss_mdns4.so.2 -> libnss_mdns4.so.2
libparted.so.2 -> libparted.so.2.0.1
(...)
```

- So for example libfuse.so.2 is linked to the actual shared object file libfuse.so.2.9.7

   - -p --print-cache
    - Print the lists of dirs and cadidate libraries stored i nthe current cache:
```bash
$ sudo Idconfig -p
1094 libs found in the cache/etc/ld.so.cache
libzvbi.so.0(libc6,x86-64) => /usr/lib/x86_64-linux-gnu/libzvbi.so.0
libzvbi-chains.so.0(libc6,x86-64) => /usr/lib/x86_64-linux-gnu/libzvbi.so.0
libzmq.so.5(libc6,x86-64) => /usr/lib/x86_64-linux-gnu/libzmq.so.5
libzeitgeist-2.0.so(libc6,x86-64) => /usr/lib/x86_64-linux-gnu/libzeitgeist-2.0.so.0
(...)
```

- Note how the cache uses the fully qualified soname of the links:
```bash
$ sudo Idconfig -p | grep libfuse
libfuse.so.2(lib6,x86-64) => /lib/x86_64-linux-gnu//libfuse.so.2
```

- if we long list /lib/x86_64-linux-gnu/libfuse.so.2
  - we will get the reference to the actual shared object file libfuse.so.2.9.7 which is stored in the same dir.

```bash
ls -l /lib/x86_64-linux-gnu/libfuse.so.2
lrwxrwxrwx 1 root root 16 Aug 21 2018 /lib/x86_64-linux-gnu/libfuse.so.2 -> libfuse.so.2.9.7
```


> [!note]
> Since it requires write access to /etc/ld.so.cache you must: either be root or use sudo to invoke ldconfig. For more information about ldconfig switches, refer to its manual page.

- In addition to the configuration files described above, the LD_LIBRARY_PATH environment variable can be used to add new paths for shared libraries temporarily. It is made up of a colon-separated (:) set of directories where libraries are looked up. To add, for example,

- /usr/local/mylib to the library path in the current shell session, you could type: 
```bash
$ LD_LIBRARY_PATH=/usr/local/mylib
```

check the value:

```bash
$ echo $LD_LIBRARY_PATH
/usr/local/mylib
```

To add /usr/local/mylib to the library path in the current shell session and have it exported to all child processes spawned from that shell, you would type:

```bash
$ export LD_LIBRARY_PATH=/usr/local/mylib
```

- To remove the LD_LIBRARY_PATH env variable:
```bash
$ unset LD_LIBRARY_PATH
```

- To make the changes permanent, you can write the line
```bash
export LD_LIBRARY_PATH=/usr/local/mylib
```

- In one of Bash's initialization scripts such as /etc/bash.bashrc or ~/.bashrc

> [!note] 
> LD_LIBRARY_PATH is to shared libraries what PATH is to executables. For more information about environment variables and shell configuration, refer to the respective lessons.

# Searching for the Dependencies of a Particular Executable

- To look up the shared libraries required by the specific program, use the ldd command followed by the absolute path to the program.
- Output shows the path of the shared library file as well as the hexadecimal memory address at which it is loaded:
```bash
$ ldd /usr/bin/git
linux-vdso.so.1 => (0x00007ffcbb310000)
libpcre.so.3 => /lib/x86_64-linux-gnu/libpcre.so.3 (0x00007f18241eb000)
libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1 (0x00007f1823fd1000)
libresolv.so.2 => /lib/x86_64-linux-gnu/libresolv.so.2 (0x00007f1823db6000)
libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f1823b99000)
librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1 (0x00007f1823991000)
libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f18235c7000)
/lib64/ld-linux-x86-64.so.2 (0x00007f182445b000)
```

- We use ldd to search dependencies for an object:
```bash
ldd /lib/x86_64-linux-gnu/libc.so.6
/lib64/ld-linux-x86-64.so.2 (0x00007fbfed578000)
linux-vdso.so.1 (0x00007fffb7bf5000)
```

- -u option or --unused ldd prints the unused direct dependencies (if they exist):
```bash
$ ldd -u /usr/bin/git
Unused direct dependencies:
/lib/x86_64-linux-gnu/libz.so.1
/lib/x86_64-linux-gnu/libpthread.so.0
/lib/x86_64-linux-gnu/librt.so.1
```

-  The reason for unused dependencies is related to the options used by the linker when building the binary
- Program does not need an unused library, it was still linked and labelled as NEEDEED in the information about the object file.
- Investigate this using commands such as readelf or objdump
- You will find out about in the exploration exercises

### Guided Exercises

1. Divide the following shared library names into their parts: 

| Complete file name   | Library name    | so suffix | Version number |     |
| -------------------- | --------------- | --------- | -------------- | --- |
| linux-vdso.so.1      | linux-vdso      | so        | 1              |     |
| libprocps.so.6       | libprocps       | so        | 6              |     |
| libd1.so.2           | libdl           | so        | 2              |     |
| libc.so.6            | libc            | so        | 6              |     |
| libsystemd.so.0      | libsystemd      | so        | 0              |     |
| ld-linux-x86-64.so.2 | ld-linux-x86-64 | so        | 2              |     |
|                      |                 |           |                |     |
2. You have developed a piece of software and want to add a new shared library directory to your system (/opt/lib/mylib). You write its absolute path in a file called mylib.conf.
  - In what directory should you put this file?
	  - /etc/ld.so.conf.d
  - What command should you run to make the changes fully effective?
	  - Idconfig

3. What command would you use to enumerate the shared libraries required by kill?
	- ldd /bin/kill

### Explorational Exercises

1. objdump is a command line utility that displays information from object files. Check if it is installed in your system with which objdump. If it is not, please, install it. 
	◦ Use objdump with the -p (or --private-headers) option and grep to print the dependencies of glibc:
		  __objdump -p /lib/x86_64-linux-gnu/libc.so.6 | grep NEEDED__
	◦ Use objdump with the -p (or --private-headers) option and grep to print the soname of glibc:
		 __objdump -p /lib/x86_64-linux-gnu/libc.so.6 | grep SONAME__ 
	◦ Use objdump with the -p (or --private-headers) option and grep to print the dependencies of Bash:
		 __objdump -p /bin/bash | grep NEEDED__
		 