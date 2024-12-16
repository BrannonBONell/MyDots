---
tags:
  - linux software package-manager yum rpm fedora opensuse
date: "09-23-2024"
---

# RPM and Yum package management

- RPM (Rhel Package Manager) was one of the first package managers
	- developed bye Red Hat Enterprise Linux (RHEL)
	- used by its decendents, Fedora, CentOS, Oracle OS, openSUSE, etc.

- Other populer pakage managers on Red Hat compatabile distros are yum(YellowDogUpdaterModified)
	- dnf(Dandified YUM) and zypper, which streamline many aspects of the installation, maintenence and removal of packages.

> [!note]
> Despite using the same package format, there are internal differences between
>distributions so a package made specifically for openSUSE might not work on a
>RHEL system, and vice-versa. When searching for packages, always check for
>compatibility and try to find one tailored for your specific distribution, if possible. 

# RPM Package Manager (rpm)
- rpm is the essential tool for software package management on REHL based or derived systems

## Installing, Upgrading, and Removing Packages
- To install a package
```bash
#rpm -i PACKAGENAME
```

- If To upgradae a package
```bash
#rpm -U PACKAGENAME
```

- The -F option will upgrade a package, but won't reinstall it.
- you can add -v param to get verbose output and -h to get hash signs as visual aid to track progress
	- Multiple params can be combined -ivh.

- To uninstall or remove a package -e
```bash
# rpm -e PACKAGENAME
```

- if a package depends on the packagge being removed an error message will occur
```bash
# rpm -e unzip
error: Failed dependencies:
/usr/bin/unzip is needed by (installed) file-roller-3.28.1-2.el7.x86_64
```

## Dealing with Dependencies
- rpm will check if a Package's dependencies are installed on the system
	- it will fail to install the packagage if they are not.
	- rpm will list what is missing but won't resolve the dependencies itself.
	- Example below the user tried to install a package for GIMP but some dependencies were missing
```bash
# rpm -i gimp-2.8.22-1.el7.x86_64.rpm
error: Failed dependencies:
babl(x86-64) >= 0.1.10 is needed by gimp-2:2.8.22-1.el7.x86_64
gegl(x86-64) >= 0.2.0 is needed by gimp-2:2.8.22-1.el7.x86_64
gimp-libs(x86-64) = 2:2.8.22-1.el7 is needed by gimp-2:2.8.22-1.el7.x86_64
libbabl-0.1.so.0()(64bit) is needed by gimp-2:2.8.22-1.el7.x86_64
libgegl-0.2.so.0()(64bit) is needed by gimp-2:2.8.22-1.el7.x86_64
libgimp-2.0.so.0()(64bit) is needed by gimp-2:2.8.22-1.el7.x86_64
libgimpbase-2.0.so.0()(64bit) is needed by gimp-2:2.8.22-1.el7.x86_64
libgimpcolor-2.0.so.0()(64bit) is needed by gimp-2:2.8.22-1.el7.x86_64
libgimpconfig-2.0.so.0()(64bit) is needed by gimp-2:2.8.22-1.el7.x86_64
libgimpmath-2.0.so.0()(64bit) is needed by gimp-2:2.8.22-1.el7.x86_64
libgimpmodule-2.0.so.0()(64bit) is needed by gimp-2:2.8.22-1.el7.x86_64
libgimpthumb-2.0.so.0()(64bit) is needed by gimp-2:2.8.22-1.el7.x86_64
libgimpui-2.0.so.0()(64bit) is needed by gimp-2:2.8.22-1.el7.x86_64
libgimpwidgets-2.0.so.0()(64bit) is needed by gimp-2:2.8.22-1.el7.x86_64
libmng.so.1()(64bit) is needed by gimp-2:2.8.22-1.el7.x86_64
libwmf-0.2.so.7()(64bit) is needed by gimp-2:2.8.22-1.el7.x86_64
libwmflite-0.2.so.7()(64bit) is needed by gimp-2:2.8.22-1.el7.x86_64
```
- Up to the user to find the packages with the dependencies and install them.

## Listing installed packages
- get a list of all installed packages on the system use rpm -qa (query all)
```bash
# rpm -qa
selinux-policy-3.13.1-229.el7.noarch
pciutils-libs-3.5.1-3.el7.x86_64
redhat-menus-12.0.2-8.el7.noarch
grubby-8.28-25.el7.x86_64
hunspell-en-0.20121024-6.el7.noarch
dejavu-fonts-common-2.33-6.el7.noarch
xorg-x11-drv-dummy-0.3.7-1.el7.1.x86_64
libevdev-1.5.6-1.el7.x86_64
[...]


## Getting Package Information
- To get info about an installed package
- rpm -qi (query info)
```bash
# rpm -qi unzip
Name
 : unzip
Version
 : 6.0
Release
 : 19.el7
Architecture: x86_64
Install Date: Sun 25 Aug 2019 05:14:39 PM EDT
Group
 : Applications/Archiving
Size
 : 373986
License
 : BSD
Signature
 : RSA/SHA256, Wed 25 Apr 2018 07:50:02 AM EDT, Key ID 24c6a8a7f4a80eb5
Source RPM
 : unzip-6.0-19.el7.src.rpm
Build Date
 : Wed 11 Apr 2018 01:24:53 AM EDT
Build Host
 : x86-01.bsys.centos.org
Relocations : (not relocatable)
Packager
 : CentOS BuildSystem <http://bugs.centos.org>
Vendor
 : CentOS
URL
 : http://www.info-zip.org/UnZip.html
Summary
 : A utility for unpacking zip files
Description :
The unzip utility is used to list, test, or extract files from a zip
archive. Zip archives are commonly found on MS-DOS systems. The zip
utility, included in the zip package, creates zip archives. Zip and
unzip are both compatible with archives created by PKWARE(R)'s PKZIP
for MS-DOS, but the programs' options and default behaviors do differ
in some respects.
Install the unzip package if you need to list, test or extract files from
a zip archive.
```

- get a list of what files are inside a package use the -ql params (query list)
```bash
# rpm -ql unzip
/usr/bin/funzip
/usr/bin/unzip
/usr/bin/unzipsfx
/usr/bin/zipgrep
/usr/bin/zipinfo
/usr/share/doc/unzip-6.0
/usr/share/doc/unzip-6.0/BUGS
/usr/share/doc/unzip-6.0/LICENSE
/usr/share/doc/unzip-6.0/README
/usr/share/man/man1/funzip.1.gz
/usr/share/man/man1/unzip.1.gz
/usr/share/man/man1/unzipsfx.1.gz
/usr/share/man/man1/zipgrep.1.gz
/usr/share/man/man1/zipinfo.1.gz
```
- If you want the same from a package not installed add -p param, rpm -qip, or rpm -qlp
```bash
# rpm -qip atom.x86_64.rpm
Name
 : atom
Version
 : 1.40.0
Release
 : 0.1
Architecture: x86_64
Install Date: (not installed)
Group
 : Unspecified
Size
 : 570783704
License
 : MIT
Signature
 : (none)
Source RPM
 : atom-1.40.0-0.1.src.rpm
Build Date
 : sex 09 ago 2019 12:36:31 -03
Build Host
 : b01bbeaf3a88
Relocations : /usr
URL
 : https://atom.io/
Summary
 : A hackable text editor for the 21st Century.
Description :
A hackable text editor for the 21st Century.

# rpm -qlp atom.x86_64.rpm
/usr/bin/apm
/usr/bin/atom
/usr/share/applications/atom.desktop
/usr/share/atom
/usr/share/atom/LICENSE
/usr/share/atom/LICENSES.chromium.html
/usr/share/atom/atom
/usr/share/atom/atom.png
/usr/share/atom/blink_image_resources_200_percent.pak
/usr/share/atom/content_resources_200_percent.pak
/usr/share/atom/content_shell.pak
(listing goes on)
```

## Finding Out Which Package Owns a Specific File

- To find out which installled package owns a file use -qf (query file) followed by path to the file
```bash
# rpm -qf /usr/bin/unzip
unzip-6.0-19.el7.x86_64#
```

In the example above /usr/bin/unzip belongs to the unzip-6.0-19.e17.x86_64 package

## YellowDog Updater Modified (YUM)
- yum was originally developed as the Yellow Dog Updater (YUP)
- a package manager for the Yellow Dog Linux distro
- It evolved to manage other packages on other RPM based systems, Fedora, CentOS, RHEL and Oracle Linux.

- it's similar to apt in utility

## Searching for packages
- search for packages with yum search
```bash
# yum search 7zip
Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
* base: mirror.ufscar.br
* epel: mirror.globo.com
* extras: mirror.ufscar.br
* updates: mirror.ufscar.br
=========================== N/S matchyutr54ed: 7zip ============================
p7zip-plugins.x86_64 : Additional plugins for p7zip
p7zip.x86_64 : Very high compression ratio file archiver
p7zip-doc.noarch : Manual documentation and contrib directory
p7zip-gui.x86_64 : 7zG - 7-Zip GUI version
Name and summary matches only, use "search all" for everything.
```

## Installing, Upgrading and Removing Packages.
- yum install for installing packages.
	- yum will also install the packages dependencies.

```bash
# yum install p7zip
Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
* base: mirror.ufscar.br
* epel: mirror.globo.com
* extras: mirror.ufscar.br
* updates: mirror.ufscar.br
Resolving Dependencies
--> Running transaction check
---> Package p7zip.x86_64 0:16.02-10.el7 will be installed
--> Finished Dependency Resolution
Dependencies Resolved
==========================================================================
Package
 Arch
 Version
 Repository
 Size
==========================================================================
Installing:
p7zip
 x86_64
 16.02-10.el7
 epel
 604 k
Transaction Summary
==========================================================================
Install
 1 Package
Total download size: 604 k
Installed size: 1.7 M
Is this ok [y/d/N]:
```

- yum update to upgrade a package
```bash
# yum update wget
Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
* base: mirror.ufscar.br
* epel: mirror.globo.com
* extras: mirror.ufscar.br
* updates: mirror.ufscar.br
Resolving Dependencies
--> Running transaction check
---> Package wget.x86_64 0:1.14-18.el7 will be updated
---> Package wget.x86_64 0:1.14-18.el7_6.1 will be an update
--> Finished Dependency Resolution
Dependencies Resolved
==========================================================================
Package
 Arch
 Version
 Repository
 Size
==========================================================================
Updating:
wget
 x86_64
 1.14-18.el7_6.1
 updates
 547 k
Transaction Summary
==========================================================================
Upgrade
 1 Package
Total download size: 547 k
Is this ok [y/d/N]:
```

- omit the package name you can update every package on the system that is available
- yum check-update to check what can be upgraded
- remove a package use yum remove.

## Finding Which Package Provides a Specific File

- To see what package provides a certain dependencies use the yum whatprovides
```bash
# yum whatprovides libgimpui-2.0.so.0
Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
* base: mirror.ufscar.br
* epel: mirror.globo.com
* extras: mirror.ufscar.br
* updates: mirror.ufscar.br
2:gimp-libs-2.8.22-1.el7.i686 : GIMP libraries
Repo
 : base
Matched from:
Provides
 : libgimpui-2.0.so.0
```

- to find out where the file /etc/hosts came from
```bash
# yum whatprovides /etc/hosts
Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
* base: mirror.ufscar.br
* epel: mirror.globo.com
* extras: mirror.ufscar.br
* updates: mirror.ufscar.br
setup-2.8.71-10.el7.noarch : A set of system configuration and setup files
Repo
 : base
Matched from:
Filename
 : /etc/hosts
```
- answer is setup2.8.71-10.e17.noarch

## Getting information about a Packagfe
- yum info
```bash
# yum info firefox
Last metadata expiration check: 0:24:16 ago on Sat 21 Sep 2019 02:39:43 PM -03.
Installed Packages
Name
 : firefox
Version
 : 69.0.1
Release
 : 3.fc30
Architecture : x86_64
Size
 : 268 M
Source
 : firefox-69.0.1-3.fc30.src.rpm
Repository
 : @System
From repo
 : updates
Summary
 : Mozilla Firefox Web browser
URL
 : https://www.mozilla.org/firefox/
License
 : MPLv1.1 or GPLv2+ or LGPLv2+
Description
 : Mozilla Firefox is an open-source web browser, designed
: for standards compliance, performance and portability.
```

## Managing Software repositories
- yum, repos are listed in the dir /etc/yum.repos.d/  Each repo is represented by a .repo file
- Additional repos can be added by adding  a .repo file in the dir /etc/yum.repos.d/
	- also can be added to the end of /etc/yum.conf.
	- The recommended way to add repos is with yum-config-manager
- to add a repository, yum-config-manager --add-repo (URL to .repo file)
```bash
# yum-config-manager --add-repo https://rpms.remirepo.net/enterprise/remi.repo
Loaded plugins: fastestmirror, langpacks
adding repo from: https://rpms.remirepo.net/enterprise/remi.repo
grabbing file https://rpms.remirepo.net/enterprise/remi.repo to /etc/yum.repos.d/remi.repo
repo saved to /etc/yum.repos.d/remi.repo
```

- get a list of all available repos yum repolist all
```bash
# yum repolist all
Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
* base: mirror.ufscar.br
* epel: mirror.globo.com
* extras: mirror.ufscar.br
* updates: mirror.ufscar.br
repo id	repo name status
updates/7/x86_64 CentOS-7 - Updates enabled:2,500
updates-source/7 CentOS-7 - Updates Sources disabled
```

- disabled repos are ignored when installing or updating software
	- to enable or disable a repo
		- yum-config-manager (repo id)
- In the output above
	- repo id is shown in the first column (repo id) 
	- use only the part before the first /
```bash
# yum-config-manager --disable updates
```

```bash
# yum-config-manager --enable updates
```

> [!note]
>Yum stores downloaded packages and associated metadata in a cache directory
>(usually /var/cache/yum). As the system gets upgraded and new packages are
>installed, this cache can get quite large. To clean the cache and reclaim disk space
>you can use the yum clean command, followed by what to clean. The most useful
>parameters are packages (yum clean packages) to delete downloaded packages
>and metadata (yum clean metadata) to delete associated metadata. See the
>manual page for yum (type man yum) for more information.

# DNF

- dnf is the package manager used on Fedora, its a fork of yum.

## Searching for packages
- dnf search

## Getting information on a package
- dnf info

## Installing Packages
-dnf install

## Removing Packages
- dnf remove

## Upgrading Packages
- dnf upgrade (Without a package name it will upgrade all packages on the system)

## Finding out which package provides a specific file
- dnf provides FILENAME

## Getting a list of all installed packages
- dnf list --installed

## Listing the contents of a package
- dnf repoquery -l PACKAGENAME

> [!note]
>dnf has a built-in help system, which shows more information (such as extra
>parameters) for each command. To use it, type dnf help followed by the
>command, like dnf help install.

## Managing Software Repositories

- get a list of all available repos
	- dnf repolist to list only enabled repo --enabled option list only disabled --disabled option
```bash
# dnf repolist
Last metadata expiration check: 0:20:09 ago on Sat 21 Sep 2019 02:39:43 PM -03.
repo id		repo name	status
*fedora		Fedora 30 - x86_64	56,582
*fedora-modular		Fedora Modular 30 - x86_64	135
*updates	Fedora 30 - x86_64 - Updates	12,774
*updates-modular	Fedora Modular 30 - x86_64 - Updates	145
```

- To add a repo use dnf config-manager --add_repo (URL to the repo)
- to enable a repo dnf config-manager --set-enabled REPO_ID
- to disable a repo dnf config-manager --set-disabled REPO_ID
	- REPO_ID is the unique ID for the repo which you can find with dnf repolist
- Repos are stored in .repo files in /etc/yum.repo.d/ same syntax as yum

# Zypper

- Zypper is the package manager for openSUSE similar to apt and yum in features.

## Updating the Package Index

- Zypper works with packages with metadata, the metadata needs to be refreshed from time to tim
```bash
# zypper refresh
Repository 'Non-OSS Repository' is up to date.
Repository 'Main Repository' is up to date.
Repository 'Main Update Repository' is up to date.
Repository 'Update Repository (Non-Oss)' is up to date.
All repositories have been refreshed.
```

- zypper has an auto-refresh feature that can be enabled on a per repo basis

## Searching for packages

- To search for a package, use the search or (se)
```bash
# zypper se gnumeric
Loading repository data...
Reading installed packages...
S | Name	| Summary	| Type
--+----------------+-----------------------------------+--------
| gnumeric	| Spreadsheet Application	| package
| gnumeric-devel | Spreadsheet Application	| package
| gnumeric-doc	| Documentation files for Gnumeric	| package
| gnumeric-lang	| Translations for package gnumeric | package
```

- search can also be used to obtain a list of all installed packages in the system with -i
	- zypper search -i

- add a packagename to the command above to search for a specific package
```bash
# zypper se -i firefox
Loading repository data...
Reading installed packages...
S | Name	| Summary	| Type
--+------------------------------------+-------------------------+--------
i | MozillaFirefox	| Mozilla Firefox Web B-> | package
i | MozillaFirefox-branding-openSUSE	| openSUSE branding of -> | package
i | MozillaFirefox-translations-common | Common translations f-> | package
```

- to search non-installed packages add the -u param

## Installing, Upgrading and Removing Packages

- To install zypper install (in)
```bash
# zypper in unrar
zypper in unrar
Loading repository data...
Reading installed packages...
Resolving package dependencies...
The following NEW package is going to be installed:
unrar
1 new package to install.
Overall download size: 141.2 KiB. Already cached: 0 B. After the operation, additional 301.6
KiB will be used.
Continue? [y/n/v/...? shows all options] (y): y
Retrieving package unrar-5.7.5-lp151.1.1.x86_64
(1/1), 141.2 KiB (301.6 KiB unpacked)
Retrieving: unrar-5.7.5-lp151.1.1.x86_64.rpm .......................[done]
Checking for file conflicts: .......................................[done]
(1/1) Installing: unrar-5.7.5-lp151.1.1.x86_64 .....................[done]
```

- zypper can be used to install rpm on disk while trying to satisfy dependencies from repos.
	- zypper install /home/john/newpackage.rpm

- zypper update to update packages
- Only list updates zypper list-updates
- zypper remove (rm) to remove packages

```bash
# zypper rm unrar
Loading repository data...
Reading installed packages...
Resolving package dependencies...
The following package is going to be REMOVED:
unrar
1 package to remove.
After the operation, 301.6 KiB will be freed.
Continue? [y/n/v/...? shows all options] (y): y
(1/1) Removing unrar-5.7.5-lp151.1.1.x86_64 ........................[done]
```

- This also removes the dependencies

```bash
# zypper rm libgimp-2_0-0
Loading repository data...
Warning: No repositories defined. Operating only with the installed resolvables. Nothing can
be installed.
Reading installed packages...
Resolving package dependencies...
The following 6 packages are going to be REMOVED:
gimp gimp-help gimp-lang gimp-plugins-python libgimp-2_0-0
libgimpui-2_0-0
6 packages to remove.
After the operation, 98.0 MiB will be freed.
Continue? [y/n/v/...? shows all options] (y):
```

## Finding Which Packages Contain a Specific file
- zypper --provides /path/to/the/file
```bash
# zypper se --provides /usr/lib64/libgimpmodule-2.0.so.0
Loading repository data...
Reading installed packages...
S | Name	| Summary	| Type
--+---------------+----------------------------------------------+--------
i | libgimp-2_0-0 | The GNU Image Manipulation Program - Libra-> | package
```

# Getting Package Information

- zypper info PACKAGENAME
```bash
# zypper info gimp
Loading repository data...
Reading installed packages...
Information for package gimp:
-----------------------------
Repository
 : Main Repository
Name
 : gimp
Version
 : 2.8.22-lp151.4.6
Arch
 : x86_64
Vendor
 : openSUSE
Installed Size : 29.1 MiB
Installed
 : Yes (automatically)
Status
 : up-to-date
Source package : gimp-2.8.22-lp151.4.6.src
Summary
 : The GNU Image Manipulation Program
Description
 :
The GIMP is an image composition and editing program, which can be
used for creating logos and other graphics for Web pages. The GIMP
offers many tools and filters, and provides a large image
manipulation toolbox, including channel operations and layers,
effects, subpixel imaging and antialiasing, and conversions, together
with multilevel undo. The GIMP offers a scripting facility, but many
of the included scripts rely on fonts that we cannot distribute.
```

## Managing Software Repositories

- to see current repos registered in your system zypper repos
```bash
# zypper repos
Repository priorities are without effect. All enabled repositories share the same priority.
#
 | Alias	| Name	| Enabled | GPG Check |	Refresh
---+---------------------------+------------------------------------+---------+-----------+
--------
1 | openSUSE-Leap-15.1-1	| openSUSE-Leap-15.1-1	| No	| ----	|
----
2 | repo-debug	| Debug Repository	| No	| ----	|
----
3 | repo-debug-non-oss	| Debug Repository (Non-OSS)	| No	| ----|
----
4 | repo-debug-update	| Update Repository (Debug)	| No	| ----	|
----
5 | repo-debug-update-non-oss | Update Repository (Debug, Non-OSS) | No	| ----	|
----
6 | repo-non-oss	| Non-OSS Repository	| Yes	| (r ) Yes	|	
Yes
7 | repo-oss	| Main Repository	| Yes	| (r ) Yes|	
Yes
8 | repo-source	| Source Repository	| No	| ----	|
----
9 | repo-source-non-oss	| Source Repository (Non-OSS)	| No	| ----	|
----
10 | repo-update	| Main Update Repository	| Yes	| (r ) Yes	|
Yes
11 | repo-update-non-oss	| Update Repository (Non-Oss)	| Yes	| (r ) Yes	|
Yes
```

- Enabled column some repos are enabled and otherrs not
	- You can change this with modifyrepo -e(enable) or -d(disable) and repo alias second column above
```bash
# zypper modifyrepo -d repo-non-oss
Repository 'repo-non-oss' has been successfully disabled.
# zypper modifyrepo -e repo-non-oss
Repository 'repo-non-oss' has been successfully enabled.
```

- auto-refresh capability can be used by modifyrepo -F or -f
```bash
# zypper modifyrepo -F repo-non-oss
Autorefresh has been disabled for repository 'repo-non-oss'.
# zypper modifyrepo -f repo-non-oss
Autorefresh has been enabled for repository 'repo-non-oss'.
```

## Adding and removing repos

- add a repo for zypper use addrepo (repo URL) REPONAME
```bash
# zypper addrepo http://packman.inode.at/suse/openSUSE_Leap_15.1/ packman
Adding repository 'packman' ........................................[done]
Repository 'packman' successfully added
URI
 : http://packman.inode.at/suse/openSUSE_Leap_15.1/
Enabled
 : Yes
GPG Check
 : Yes
Autorefresh : No
Priority
 : 99 (default priority)
Repository priorities are without effect. All enabled repositories share the same priority.
```

- enable auto-updates while addding a repo with -f param.
- added repos are enabled by default 
- add and disable a repo with -d param

- to remove a repo use removerepo REPONAME
```bash
# zypper removerepo packman
Removing repository 'packman' ......................................[done]
Repository 'packman' has been removed.
```

### Guided Exercises

1. Using rpm on a Red Hat Enterprise Linux system, how would you install the package file-
roller-3.28.1-2.el7.x86_64.rpm showing a progress bar during the installation?
__Use the -i parameter to install a package, and the -h option to enable “hash marks” showing
installation progress. So, the answer is: rpm -ih file-roller-3.28.1-2.el7.x86_64.rpm.__
2. Using rpm, find out which package contains the file /etc/redhat-release.
__You are querying information about a file, so use the -qf parameter: rpm -qf /etc/redhat-
release.__
3. How would you use yum to check for updates for all packages in the system?
__Use the check-update operation without a package name: yum check-update.__
4. Using zypper, how would you disable a repository called repo-extras?
__Use the modifyrepo operation to change the parameters of a repo, and the -d parameter to
disable it: zypper modifyrepo -d repo-extras.__
5. If you have a .repo file describing a new repository, where this file should be put so that it is
recognized by DNF?
__.repo files for DNF should be put on the same place used by YUM, inside /etc/yum.repos.d/__

### Explorational Exercises

1. How would you use zypper to find out which package owns the file /usr/sbin/swapon?
__Use the se (search) operator and the --provides parameter: zypper se --provides
/usr/sbin/swapon.__
2. How can you get a list of all installed packages in the system using dnf?
__Use the list operator, followed by the --installed parameter: dnf list --installed.__
3. Using dnf, what is the command to add a repository located a https://www.example.url/home:reponame.repo to the system?
Working with repositories is a “configuration change”, so use the config-manager and the --add_repo parameter:
__dnf config-manager --add_repo https://www.example.url/home:reponame.repo.__
4. How can you use zypper to check if the package unzip is installed?
__You need to do a search (se) on the installed (-i) packages: zypper se -i unzip.__
5. Using yum, find out which package provides the file /bin/wget.
__To find out what provides a file, use whatprovides and the filename: yum whatprovides
/bin/wget.__


