---
tags: linux lbic-101 study debian package-management dpkg apt
date: 09-21-2024
---

# Debian Package Manager
- When linux was an infant still the most common way to distribute software was a compressed file (usually .tar.gz archive) with source code
	- You would unpack and compile yourself
- As the amount and complexity of software grew, the need for a way to distribute pre-compiled software became clear.
- Efforts tot standardize a way to distribute these software "packages" grew, thus the first package managers were born
	- These tools made it much easier to install, config or remove software from a system
- One of these was the Debian package format (.deb) and its package tool (dpkg).
- Today, they are widely used not only on Debian itself, but also on derivatives, like Ubuntu and those derived from it.
- Another popular Debian-based package management tool is the *Advanced Package Tool* or apt
- apt can streamline many of the aspects of the installation, maintenance and removal of packages.

# The Debian Package Tool (dpkg)

- dkpg tool is the essential ustility to install, config, maintain, and remove software on Debian-based systems.
- The most basic operation is to install a .deb package:
```bash
$dpkg -i PACKAGENAME
```

- Package upgrades are handled the same way.  before installing dpkg will check if a previous version already exists in the system.
- If so the package will be upgraded to the new version
- If not a fresh copy will be installed

# Dealing with Dependencies

 - A package may depend on others to work as intended.
 - dpkg will check if those dependencies are installed on your system, and will fail to install the package if they are not.
 - dpkg will list which packages are missing, but can't resolve dependencies on its own.
 - The user needs to find the .deb packages with the corresponding dependencies and install them
Example below shows a user trying to install OpenShot video editor package, but some dependcies were missing:\
```bash
# dpkg -i openshot-qt_2.4.3+dfsg1-1_all.deb
(Reading database ... 269630 files and directories currently installed.)
Preparing to unpack openshot-qt_2.4.3+dfsg1-1_all.deb ...
Unpacking openshot-qt (2.4.3+dfsg1-1) over (2.4.3+dfsg1-1) ...
dpkg: dependency problems prevent configuration of openshot-qt:
openshot-qt depends on fonts-cantarell; however:
Package fonts-cantarell is not installed.
openshot-qt depends on python3-openshot; however:
Package python3-openshot is not installed.
openshot-qt depends on python3-pyqt5; however:
Package python3-pyqt5 is not installed.
openshot-qt depends on python3-pyqt5.qtsvg; however:
Package python3-pyqt5.qtsvg is not installed.
openshot-qt depends on python3-pyqt5.qtwebkit; however:
Package python3-pyqt5.qtwebkit is not installed.
openshot-qt depends on python3-zmq; however:
Package python3-zmq is not installed.
dpkg: error processing package openshot-qt (--install):
dependency problems - leaving unconfigured
Processing triggers for mime-support (3.60ubuntu1) ...
Processing triggers for gnome-menus (3.32.0-1ubuntu1) ...
Processing triggers for desktop-file-utils (0.23-4ubuntu1) ...
Processing triggers for hicolor-icon-theme (0.17-2) ...
Processing triggers for man-db (2.8.5-2) ...
Errors were encountered while processing: 
openshot-qt
```

- As shown above, OpenShot depends on the fonts-cantarell, python3-openshot, python3- pyqt5, python3-pyqt5.qtsvg, python3-pyqt5.qtwebkit and python3-zmq packages. All of those need to be installed before the installation of OpenShot can succeed.

# Removing Packages

- To remove a package use dpkg -r PACKAGENAME
Example:

```bash
# dpkg -r unrar (Reading database ... 269630 files and directories currently installed.)
Removing unrar (1:5.6.6-2) ...
Processing triggers for man-db (2.8.5-2) ...
```

- The removal operation also runs a dependency check, and a package cannot be removed unless every other package that depends on it is also removed.
- Or you will get and error:
```bash
# dpkg -r p7zip
dpkg: dependency problems prevent removal of p7zip:
winetricks depends on p7zip; however:
Package p7zip is to be removed.
p7zip-full depends on p7zip (= 16.02+dfsg-6).

dpkg: error processing package p7zip (--remove):
dependency problems - not removing
Errors were encountered while processing:
p7zip
```

- You can pass multiple package names to dpkg -r so they will all be removed at one
- When a package is removed, the configuration files are left on the system
- If you want to remove everything associated with the package use the -P (purge) option instaed of -r

> [!note] 
> You can force dpkg to install or remove a package, even if dependencies are not met, by adding the --force parameter like in dpkg -i --force PACKAGENAME. However, doing so will most likely leave the installed package, or even your system, in a broken state. Do not use --force unless you are absolutely sure of what you are doing.

# Getting Package Information
- To get info about a .deb package
	- its version, architecture, maintainer, dependencies and more.
- dpkg command with -I followed by the filename  of the package you want info on:
```bash
# dpkg -I google-chrome-stable_current_amd64.deb
new Debian package, version 2.0.
size 59477810 bytes: control archive=10394 bytes.
1222 bytes, 13 lines control
16906 bytes, 457 lines * postinst #!/bin/sh
12983 bytes, 344 lines * postrm #!/bin/sh
1385 bytes, 42 lines * prerm #!/bin/sh
Package: google-chrome-stable
Version: 76.0.3809.100-1 
Architecture: amd64 
Maintainer: Chrome Linux Team <chromium-dev@chromium.org> 
Installed-Size: 205436 
Pre-Depends: dpkg (>= 1.14.0) 
Depends: ca-certificates, fonts-liberation, libappindicator3-1, libasound2 (>= 1.0.16), libatk-bridge2.0-0 (>= 2.5.3), libatk1.0-0 (>= 2.2.0), libatspi2.0-0 (>= 2.9.90), libc6 (>= 2.16), libcairo2 (>= 1.6.0), libcups2 (>= 1.4.0), libdbus-1-3 (>= 1.5.12), libexpat1 (>=2.0.1), libgcc1 (>= 1:3.0), libgdk-pixbuf2.0-0 (>= 2.22.0), libglib2.0-0 (>= 2.31.8), libgtk-3-0 (>= 3.9.10), libnspr4 (>= 2:4.9-2~), libnss3 (>= 2:3.22), libpango-1.0-0 (>= 1.14.0), libpangocairo-1.0-0 (>= 1.14.0), libuuid1 (>= 2.16), libx11-6 (>= 2:1.4.99.1), libx11-xcb1, libxcb1 (>= 1.6), libxcomposite1 (>= 1:0.3-1), libxcursor1 (>> 1.1.2), libxdamage1 (>= 1:1.1), libxext6, libxfixes3, libxi6 (>= 2:1.2.99.4), libxrandr2 (>= 2:1.2.99.3), libxrender1, libxss1, libxtst6, lsb-release, wget, xdg-utils (>= 1.0.2) 
Recommends: libu2f-udev 
Provides: www-browser 
Section: web 
Priority: optional 
Description: The web browser from Google Google Chrome is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier.
```

# Listing Installed Packages and Package Contents

- To get a list of every package installed on your system, use the --get-selections option, as in dpkg --get-selections. You can also get a list of every file installed by a specific package by passing the -L PACKAGENAME parameter to dpkg, like below:
```bash
# dpkg -L unrar
/. 
/usr 
/usr/bin 
/usr/bin/unrar-nonfree
/usr/share
/usr/share/doc
/usr/share/doc/unrar
/usr/share/doc/unrar/changelog.Debian.gz
/usr/share/doc/unrar/copyright
/usr/share/man
/usr/share/man/man1
/usr/share/man/man1/unrar-nonfree.1.gz
```

# Finding Out which Package Owns a Specific File

- Sometimes you may need to find out which package owns a specific file in your system. You can do so by using the dpkg-query utility, followed by the -S parameter and the path to the file in question:

```bash
# dpkg-query -S /usr/bin/unrar-nonfree
unrar: /usr/bin/unrar-nonfree
```

# Reconfiguring Installed Packages
When a package is installed there is a configuration step called post-install where a script runs to set-up everything needed for the software to run such as permissions, placement of configuration files, etc. This may also ask some questions of the user to set preferences on how the software will run.
Sometimes, due to a corrupt or malformed configuration file, you may wish to restore a package’s settings to its “fresh” state. Or you may wish to change the answers you gave to the initial configuration questions. To do this run the dpkg-reconfigure utility, followed by the package name.
This program will back-up the old configuration files, unpack the new ones in the correct directories and run the post-install script provided by the package, as if the package had been installed for the first time. Try to reconfigure the tzdata package with the following example:

```bash
# dpkg-reconfigure tzdata
```

# Advanced Package Tool (apt)

- apt is a package management system, including tools for installation, upgrade, removal and management
- apt provides advanced search capabilities and automatic dependency resolution.
- APT is not a “substitute” for dpkg. You may think of it as a “front end”, streamlining operations and filling gaps in dpkg functionality, like dependency resolution.
- APT works in concert with software repositories which contain the packages available to install. Such repositories may be a local or remote server, or (less common) even a CD-ROM disc.
- Linux distributions, such as Debian and Ubuntu, maintain their own repositories, and other repositories may be maintained by developers or user groups to provide software not available from the main distribution repositories.
- There are many utilities that interact with apt
	- apt-get
		- used to download, install, upgrade or remove packages from the system.
	- apt-cache
		- used to perform operations, like searches, in the package index.
	- apt-file
		- used for searching for files inside packages.
	- There is also a “friendlier” utility named simply apt, combining the most used options of apt-get and apt-cache in one utility. Many of the commands for apt are the same as the ones for apt- get, so they are in many cases interchangeable. However, since apt may not be installed on a system, it is recommended to learn how to use apt-get and apt-cache.

> [!note] 
> apt and apt-get may require a network connection, because packages and package indexes may need to be downloaded from a remote server.

# Updating the Package Index
- Before installing or upgrading software with APT, it is recommended to update the package index first in order to retrieve information about new and updated packages. This is done with the apt- get command, followed by the update parameter:
```bash
# apt-get update
Ign:1 http://dl.google.com/linux/chrome/deb stable InRelease 
Hit:2 https://repo.skype.com/deb stable InRelease 
Hit:3 http://us.archive.ubuntu.com/ubuntu disco InRelease 
Hit:4 http://repository.spotify.com stable InRelease 
Hit:5 http://dl.google.com/linux/chrome/deb stable Release 
Hit:6 http://apt.pop-os.org/proprietary disco InRelease 
Hit:7 http://ppa.launchpad.net/system76/pop/ubuntu disco InRelease
Hit:8 http://us.archive.ubuntu.com/ubuntu disco-security InRelease
Hit:9 http://us.archive.ubuntu.com/ubuntu disco-updates InRelease
Hit:10 http://us.archive.ubuntu.com/ubuntu disco-backports
InRelease Reading package lists... Done
```

- apt update also works

# Installing and Removing Packages
With the package index updated you may now install a package. This is done with apt-get install, followed by the name of the package you wish to install: 
```bash
# apt-get install xournal
Reading package lists... Done
Building dependency tree Reading state information... Done
The following NEW packages will be installed:
xournal
0 upgraded, 1 newly installed, 0 to remove and 75 not upgraded. 
Need to get 285 kB of archives.
After this operation, 1041 kB of additional disk space will be used.
```

Similarly, to remove a package use apt-get remove, followed by the package name:

```bash
# apt-get remove xourna
Reading package lists... Done
Building dependency tree Reading state information... Done
The following packages will be REMOVED: 
xournal 
0 upgraded, 0 newly installed, 1 to remove and 75 not upgraded.
After this operation, 1041 kB disk space will be freed.
Do you want to continue? [Y/n]
```

Be aware that when installing or removing packages, APT will do automatic dependency resolution. This means that any additional packages needed by the package you are installing will also be installed, and that packages that depend on the package you are removing will also be removed. APT will always show what will be installed or removed before asking if you want to continue

```bash
# apt-get remove p7zip
Reading package lists... Done
Building dependency tree
The following packages will be REMOVED:
android-libbacktrace android-libunwind android-libutils android-libziparchive android-sdk-platform-tools fastboot p7zip p7zip-full 
0 upgraded, 0 newly installed, 8 to remove and 75 not upgraded.
After this operation, 6545 kB disk space will be freed.
Do you want to continue? [Y/n]
```

Note that when a package is removed the corresponding configuration files are left on the system. To remove the package and any configuration files, use the purge parameter instead of remove or the remove parameter with the --purge option:

```bash
# apt-get purge p7zip
```

or

```bash
# apt-get remove --purge p7zip
```

- apt install and apt remove also work

# Fixing Broken Dependencies

- When you have broken dependencies it means the one or more of the installed packages depend on packages that have not bee installed or are not present anymore.
- This may happen due to an apt error, or because of manually installed package.
- To solve use apt-get install -f command
	- this will try to fix the broken package by installing the missing dependencies , ensuring all packages are consistent again
	- apt install -f also works

# Upgrading packages

- APT can be used to automatically upgrade any installed packages to the latest versions available from the repositories. This is done with the apt-get upgrade command. Before running it, first update the package index with apt-get update:
```bash
# apt-get update
Hit:1 http://us.archive.ubuntu.com/ubuntu disco InRelease 
Hit:2 http://us.archive.ubuntu.com/ubuntu disco-security InRelease 
Hit:3 http://us.archive.ubuntu.com/ubuntu disco-updates InRelease 
Hit:4 http://us.archive.ubuntu.com/ubuntu disco-backports InRelease Reading package lists... Done

# apt-get upgrade
Reading package lists... Done
Building dependency tree
Reading state information... Done
Calculating upgrade... Done
The following packages have been kept back:
gnome-control-center
The following packages will be upgraded:
cups cups-bsd cups-client cups-common cups-core-drivers cups-daemon cups-ipp-utils cups-ppdc cups-server-common firefox-locale-ar (...)
74 upgraded, 0 newly installed, 0 to remove and 1 not upgraded.
Need to get 243 MB of archives.
After this operation, 30.7 kB of additional disk space will be used. 
Do you want to continue? [Y/n]
```

The summary at the bottom of the output shows how many packages will be upgraded, how many will be installed, removed or kept back, the total download size and how much extra disk space will be needed to complete the operation. To complete the upgrade, just answer Y and wait for apt-get to finish the task.

- To upgrade a single package, just run apt-get upgrade followed by the package name. As in dpkg, apt-get will first check if a previous version of a package is installed. If so, the package will be upgraded to the newest version available in the repository. If not, a fresh copy will be installed.
	- You can also use apt upgrade and apt update.

# Local Cache

- When you install or update a package, the corresponding .deb file is downloaded to a local cache directory before the package is installed. By default, this directory is /var/cache/apt/archives. Partially downloaded files are copied to /var/cache/apt/archives/partial/.
- As you install and upgrade packages, the cache directory can get quite large. To reclaim space, you can empty the cache by using the apt-get clean command. This will remove the contents of the /var/cache/apt/archives and /var/cache/apt/archives/partial/ directories.

> [!tip] 
> apt clean also works

# Searching for Packages

- The apt-cache utility can be used to perform operations on the package index, such as searching for a specific package or listing which packages contain a specific file.
- To conduct a search, use apt-cache search followed by a search pattern. The output will be a list of every package that contains the pattern, either in its package name, description or files provided.
```bash
# apt-cache search p7zip
liblzma-dev - XZ-format compression library - development files
liblzma5 - XZ-format compression library
forensics-extra - Forensics Environment - extra console components (metapackage)
p7zip - 7zr file archiver with high compression ratio
p7zip-full - 7z and 7za file archivers with high compression ratio
p7zip-rar - non-free rar module for p7zip
```

- In the example above, the entry liblzma5 - XZ-format compression library does not seem to match the pattern. However, if we show the full information, including description, for the package using the show parameter, we will find the pattern there:

```bash
# apt-cache show liblzma5
Package: liblzma5 
Architecture: amd64 
Version: 5.2.4-1 
Multi-Arch: same 
Priority: required 
Section: libs 
Source: xz-utils 
Origin: Ubuntu 
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com> 
Original-Maintainer: Jonathan Nieder <jrnieder@gmail.com> 
Bugs: https://bugs.launchpad.net/ubuntu/+filebug 
Installed-Size: 259 
Depends: libc6 (>= 2.17) 
Breaks: liblzma2 (<< 5.1.1alpha+20110809-3~) 
Filename: pool/main/x/xz-utils/liblzma5_5.2.4-1_amd64.deb 
Size: 92352 
MD5sum: 223533a347dc76a8cc9445cfc6146ec3 
SHA1: 8ed14092fb1caecfebc556fda0745e1e74ba5a67 
SHA256:01020b5a0515dbc9a7c00b464a65450f788b0258c3fbb733ecad0438f5124800 
Homepage: https://tukaani.org/xz/ 
Description-en: XZ-format compression library XZ is the successor to the Lempel-Ziv/Markov-chain Algorithm compression format, which provides memory-hungry but powerful compression (often better than bzip2) and fast, easy decompression. . The native format of liblzma is XZ; it also supports raw (headerless) streams and the older LZMA format used by lzma. (For 7-Zip's related format, use the p7zip package instead.)
```

You can use regular expressions with the search pattern, allowing for very complex (and precise) searches. However, this topic is out of scope for this lesson.

> [!tip] 
> apt search and apt show also work.

# The Sources List

- APT uses a list of sources to know where to get packages from. This list is stored in the file sources.list, located inside the /etc/apt directory. This file can be edited directly with a text editor, like vi, pico or nano, or with graphical utilities like aptitude or synaptic.
- Typical sources.list:
```bash
deb http://us.archive.ubuntu.com/ubuntu/ disco main restricted universe multiverse
```

- Syntax is Archive type, URL. distribution and one or more components
	- Archive type
		- A repository may contain packages with ready-to-run software (binary packages, type deb) or with the source code to this software (source packages, type deb-src). The example above provides binary packages.
	- URL
		- The URL for the repository.
	- Distribution
		- The name (or codename) for the distribution for which packages are provided. One repository may host packages for multiple distributions. In the example above, disco is the codename for Ubuntu 19.04 Disco Dingo.
	- Components
		- Each component represents a set of packages. These components may be different on different Linux distributions. For example, on Ubuntu and derivatives, they are:
		- main
			- contains officially supported, open-source packages.
		- restricted
			- contains officially supported, closed-source software, like device drivers for graphic cards, for example.
		- universe
			- contains community maintained open-source software.
		- multiverse
			- contains unsupported, closed-source or patent-encumbered software.
	- On Debian, the main components are:
		- main
			- consists of packages compliant with the Debian Free Software Guidelines (DFSG), which do not rely on software outside this area to operate. Packages included here are considered to be part of the Debian distribution.
		- contrib
			- contains DFSG-compliant packages, but which depend on other packages that are not in main.
		- non-free
			- contains packages that are not compliant with the DFSG.
		- security
			- contains security updates.
		- backports
			- contains more recent versions of packages that are in main. The development cycle of the stable versions of Debian is quite long (around two years), and this ensures that users can get the most up-to-date packages without having to modify the main core repository.

> [!note] 
> You can learn more about the Debian Free Software Guidelines at: https://www.debian.org/social_contract#guidelines

- To add a new repository to get packages from
	- add the corresponding line to the end of sources.list save the file and reload the package index with
	- apt-get update
	- Packages in the new repository will be available for installation using apt

#### The /etc/apt/sources.list.d Directory

- nside the /etc/apt/sources.list.d directory you can add files with additional repositories to be used by APT, without the need to modify the main /etc/apt/sources.list file. These are simple text files, with the same syntax described above and the .list file extension.simple text files, with the same syntax described above and the .list file extension.
Contents of file /etc/apt/sources.list.d/buster- backports.list:
```bash
deb http://deb.debian.org/debian buster-backports main contrib non-free 
deb-src http://deb.debian.org/debian buster-backports main contrib non-free
```

# Listing Package Contents and Finding Files

- A utility called apt-file can be used to perform more operations in the package index, like listing the contents of a package or finding a package that contains a specific file. This utility may not be installed by default in your system. In this case, you can usually install it using apt-get:
```bash
# apt-get install apt-file
```

After installation, you will need to update the package cache used for apt-file:
\
```bash
# apt-file update
```

This usually takes only a few seconds. After that, you are ready to use apt-file. 
To list the contents of a package, use the list parameter followed by the package name:
```bash
# apt-file list unrar
unrar: /usr/bin/unrar-nonfree
unrar: /usr/share/doc/unrar/changelog.Debian.gz 
unrar: /usr/share/doc/unrar/copyright 
unrar: /usr/share/man/man1/unrar-nonfree.1.gz
```

> [!tip]
> apt list instead of apt-file list.

You can search all packages for a file using the search parameter, followed by the file name. For example, if you wish to know which package provides a file called libSDL2.so, you can use:

```bash
# apt-file search libSDL2.so
libsdl2-dev: /usr/lib/x86_64-linux-gnu/libSDL2.so
```

The answer is the package libsdl2-dev, which provides the file /usr/lib/x86_64-linux-gnu/libSDL2.so.

The difference between apt-file search and dpkg-query is that apt-file search will also search uninstalled packages, while dpkg-query can only show files that belong to an installed package.

### Guided Exercises

1. What is the command to install a package named package.deb using dpkg? __Pass the -i parameter to dpkg: # dpkg -i package.deb__ 
2. Using dpkg-query, find which package contains a file named 7zr.1.gz. __Add the -S parameter to dpkg-query: # dpkg-query -S 7zr.1.gz__
3. Can you remove a package called unzip from the system using dpkg -r unzip if the package file-roller depends on it? If not, what would be the correct way to do it? __No. dpkg will not resolve dependencies, and will not let you remove a package if another installed package depends on it. In this example, you could first remove file-roller (assuming nothing depends on it) and then remove unzip, or remove both at the same time with: # dpkg -r unzip file-roller__ 
4. How can you find out which package contains the file /usr/bin/unrar using the apt-file utility? __Use the search parameter followed by the path (or filename): # apt-file search /usr/bin/unrar__
5. Using apt-cache, what is the command to show information for the package gimp? __Use the show parameter followed by the package name: # apt-cache show gimp__


### Explorational Exercises

1. Consider a repository with Debian source packages for the xenial distribution, hosted at http://us.archive.ubuntu.com/ubuntu/ and with packages for the universe component. What would be the corresponding line to be added to /etc/apt/sources.list? __Source packages are of the deb-src type, so the line should be: *deb-src http://us.archive.ubuntu.com/ubuntu/ xenial universe* This line could also be added inside a .list file in /etc/apt/sources.list.d/. The name is up to you but should be descriptive, something like xenial_sources.list.__
2. While compiling a program, you come across an error message complaining that the header file zzip-io.h is not present on your system. How can you find out which package provides that file? __Use apt-file search to find which package contains a file not present in the system: *# apt-file search zzip-io.h*__
3. How can you ignore a dependency warning and remove a package using dpkg, even if there are packages that depend on it in the system? __The parameter --force can be used, but this should never be done unless you know exactly what you are doing, since there is a great risk that your system will be left in an inconsistent or “broken” state.__
4. How can you get more information about a package called midori using apt-cache? __Use apt-cache show followed by the package name: *# apt-cache show midori*__
5. Before installing or updating packages with apt-get, which command should be used to ensure that the package index is up-to-date? __apt-get update should be used. This will download the latest package indexes from the repositories described in the /etc/apt/sources.list file or in the /etc/apt/sources.list.d/ directory.__
