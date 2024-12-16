---
tags: linux boot lpic 
date: 09-18-2024
---

# Bootloader
In order to control the machine, the operating systems main component the kernel, must be loaded by a program called a bootloader.
- Bootloaders are loaded by pre installed firmware such as BIOS or UEFI.
- Bootloaders can be customized to pass parameters to the kernel
	- Partition contains the root filesystem or in which mode the operating system should execute.
- Once loaded the kernel continues the boot process identifying and configuring the hardware.
- Latstly the kernel calls the utility for starting and managing the system's services.

## Bios or UEFI

Procedures executed by x86 machines to run a bootloader are different whther they use BIOS or UEFI
- BIOS(Basic Input/Output System), is a program stored in a non volatile memory chip attached to the motherboard.
	- executed every time the computer is powered on.
	- This type of program is called firmware and its storage location is seperate from the other storage devices the system may have.
- BIOS assumes that the first 440 bytes in the first storage device -- following the order defined in the BIOS configuration utility -- are the first stage of the bootloader(also called bootstrap).
- The first 512 bytes of a storage device are named the MBR(Master Boot Record) of storage devices using the standard DOS partition schema and, in addition to the first stage of the bootloader, contain a partition table.
- If the MBR does not contain the correct data the system will not be able to boot unless an alternative method is deployed.

Generally speaking the pre-operating steps to boot a system equipped with BIOS are:
1. The POST(power on self-test) process is executed to identify simple hardware failures as soon as the machine is powered on
2.  BIOS activates the basic components to load the system, video output, keyboard and storage media.
3.  BIOS loads the first stage of the bootloader from the MBR the first 440 bytes of the first device.
4.  The first stage of the bootloader calls the second stage of the bootloader, responsible for presenting boot options and loading the kernel

UEFI(Unified Extensible Firmware Interface), differs from BIOS in some key ways.

-  UEFI is also a firmware, but it can identify partitions and read many filesystems found in them.
- UEFI does not rely on the MBR, taking into account only the settings stored in the non volatile memory (NVRAM) attatched to the motherboard. 
-  UEFI compatible programs called EFI applications will be edxecuted automatically or called from a boot menu.
-  EFI applications, that will be executed automatically or called from a boot menu.
- EFI applications can  be bootloaders, operating syst5em selectors, tools for system diagnostics and repair. 
- They must be in a conventional storage device partition and in a compatible filesystem.
-  The standard compatible filesystems are FAT12, FAT16, and FAT32 for block devices and ISO-9660 for optical media.
-  This approach allows for the implementation of a much more sophisticated tools than those possible with BIOS.

The partition containing the EFI applications is called the EFI system Partition(ESP).
- This partition must not be shared with other system filesystems, like the root or user data filesystems.
-  EFI directory in the ESP partition contains the applications pointed to by the entries saved in the NVRAM

Generally speaking, the pre operating systemn boot steps on UEFI are.
1. The POST process is executed to identy simnple hardware failure soon.
2. UEFI activates the basic components to load the system,  video output, keyboard, storage media.
3. UEFI's firmware reads the definitions stored in NVRAM to execute the pre-defined EFI applications stored 8in the ESP parrtitions filesystem.  Usually the pre defined EFI application is a bootloader
4. The pre defined EFI application is a bootloader, it will load the kernelto start the operation systems

> [!note] SECURE BOOT
> The UEFI standard also supports a feature called Secure Boot, which only allows the execution of signed EFI applications, that is, EFI applications authorized by the hardware manufacturer. This feature increases the protection against malicious software, but can make it difficult to install operating systems not covered by the manufacturer’s warranty.

## The BootLoader

Most popular bootloader for Linux in the x86 architecture is GRUB(Grand Unified Bootloader).
- As soon as it is called by BIOS or UEFI, Grub displays a list of operationg systems available to boot. 
- Sometimes the list doesn't apear automatically
	- It can be invoked by pressing shift while grub is beings called by BIOS.  
	- UEFI systems the Esc key should be used instead
- From the Grub menu it is possible to choose which one of the installed kernels should be loaded and to pass new parameters to it.  
	- Most kernel parameters follow the pattern option=value some of the most useful kernel parameters are:
		- acpi
			- Enables/Disables acpi support. acpi=off will disable supports for ACPI
		- init
			- Sets an alternative system iitiator.  For example, init/bin/bash will set the bash shell as the initiator.  This means that a shell sesion will start just after the kernel boot process.
		- systemd.unit
			- Sets the systemd target to be activated
				- For example, systemd.unit=graphical.target.  Systemd also accepts the  numerical runlevels as defined for sysV. To activate the runlevel 1, for example, it is only necessary to include the number 1 or the letter S as a kernel parameter
		-  mem
			- Sets the amount of available RAM for the system.
				-  Useful for virtual machines so as to limit how much RAM will be vailable to each gues.  Using mem=512M will limit to 512 megabytes the ammount of available RAM to a particvular quest system
		- maxcups
			- Limits the number of processors(or processor cores) visible to the system in symmetric multiprocessor machines.  Its is also useful for virtual machines.  A value of 0 turns off the support for multi-processor machines and has the same effect as thye kernel parameter nosmp.  The parameter maxcups=2 willl limit the number of processors avilalable to the operating system to two.
		- quiet
			- Hides most boot messages
		- vga
			- Selects a video mode. the parameter vga=ask will show a list of the vailable modes to chose from.
		- root
			-  Sets the root partition, distinct from the one pre-configured in the bootloader. For example, root=/dev/sda3.
		- rootflags
			- Mount options for the root filesystmem
		- ro
			- Makes the initial amount of the root filesystem read-only
		- rw
			- Allows writing in the root flesystem during the initial mount.

Changing the kernel parameters is not usually required, but it can be useful to detect and solve operating system related problems
- Kernel parameters are added to the file /etc/default/grub in the line GRUB_CMDLINE_LINUX to make them persistent
- A new config file for the bootloader must be generated every time /etc/default/grub changes, which is accomplished by the command grub-mkconfig -o /boot/grub/grub.cfg
- Once the operating system is running, the kernel parameters used for loading the current session are available for reading in the file /proc/cmdline.

## System Initializaztion

Apart from the kernel, the operating system depends on other components that provide the expected features. Many of these components are loaded during the system initialization process, varying from simple shell scripts to more complex service programs
- Scripts are often used to perform short lived tasks that will run and terminate during the system intialization profcess.
- Services, also known as daemons, may be active all the time as they can be responsible for intrinsic aspects of the OS.

The diversity of ways that startup scripts and daemons with the most different characteristics can be built into a Linux distribution is huge, a fact that historically hindered the development of a single solution that meets the expectations of maintainers and users of all Linux distributions.
- Any tool that the distribution maintainers have chosen to perform this function will at least be able to start, stop and restart system services.
- These actions are often performed by the system itself after a software update, fore example, but the system administrator will almost always need to manually restart the service after making modifications to its config file.

It is also convenient for a system administrator to be able to activate a particular set of daemons, depending on the circumstances. It should be possible, for example, to run just a minimum set of services in order to perform system maintenance tasks.

> [!important] 
> trictly speaking, the operating system is just the kernel and its components which control the hardware and manages all processes. It is common, however, to use the term “operating system” more loosely, to designate an entire group of distinct programs that make up the software environment where the user can perform the basic computational tasks.

- The initialization of the OS starts when the bootloader loads the kernel into RAM
	- The kernel will take charge of the CPU and will start to detect and setup the fundamental aspects of the OS, like basic hardware config and memory addressing.
	- The kernel will then open the intiramfs(initial RAM filesystem)
		- initramfs is an archive containing a filesystem used as a temp root filesystem during the boot process
		- Main purpose of an initramfs file is to provide the required modules so the kernel can access the "real" filesystem of the OS.
	- Once the root filesystem is available the kernel will mount all filesystems configed in the /etc/fstab and then will execute the first program, a utility named init.
		- init is responsible for running all the initialization scripts and system daemons
		- There are distinct implementations of such initiators aport from the traditional init, like systemd and Upstart.
		- Once the init program is loaded, the initramfs is removed from RAM.

### SysV standard
- A service manager based on the SysVinit standard controls which daemons and resources will be available by employing the concept of runlevels.
	- Runlevels are numbered 0-6
	- They are designed by the distribution maintainers to fulfill specific purposes
	- The only runlevel definitions shared between all distributions are the runlevels 0, 1, and 6

### systemd
- systemd is a modern system and services manager with a compatibility layer for the SysV commands and runlevels
	- systemd has a concurrent structure, employs sockets and D-Bus for service activation, on-demand daemon execution, precess monitoring with cgroups, snapshot support, system session recovery, mount point control and dependency-based service control.
	- In recent years most major Linux distributions have gradually adopted systemd as their default system manager.

### Upstart
- Like systemd, Upstart is a substitute to init.  The focus of Upstart is to speed up the boot process by parallelizing the laoding process of system services.
	- Upstart was used by Ubuntu based distros in past releases, but today gave way to systemd.

## Initialization Inspection

Errors may occur during the boot process, but they may not be so critical to completely halt the operating system
- These errors may compromise the expected behaviour of the system
- All errors result in messages that can be used for future investigations, as they contain valuable information about when and how the error occured.
- Even when no messages are generated, the information collected during the boot process can be useful for tuning and config purposes

The memory space where the kernel stores its messages is called the kernel ring buffer
- messages are kept in the kernel ring buffer even when they are not displayed during the init process, like when an animation is displayed instad.
- The kernel ring buffer loses all messages when the system is turned off or by the command dmesg --clear.
- Without options command dmesg displays the current messages in the kernel ring buffer

```bash 
$ dmesg
[ 5.262389] EXT4-fs (sda1): mounted filesystem with ordered data mode. Opts: (null)
[ 5.449712] ip_tables: (C) 2000-2006 Netfilter Core Team
[ 5.460286] systemd[1]: systemd 237 running in system mode.
[ 5.480138] systemd[1]: Detected architecture x86-64.
[ 5.481767] systemd[1]: Set hostname to <torre>. 
[ 5.636607] systemd[1]: Reached target User and Group Name Lookups. [ 5.636866] systemd[1]: Created slice System Slice. 
[ 5.637000] systemd[1]: Listening on Journal Audit Socket. 
[ 5.637085] systemd[1]: Listening on Journal Socket. 
[ 5.637827] systemd[1]: Mounting POSIX Message Queue File System... [ 5.638639] systemd[1]: Started Read required files in advance. 
[ 5.641661] systemd[1]: Starting Load Kernel Modules... 
[ 5.661672] EXT4-fs (sda1): re-mounted. Opts: errors=remount-ro 
[ 5.694322] lp: driver loaded but no devices found 
[ 5.702609] ppdev: user-space parallel port driver 
[ 5.705384] parport_pc 00:02: reported by Plug and Play ACPI 
[ 5.705468] parport0: PC-style at 0x378 (0x778), irq 7, dma 3 [PCSPP,TRISTATE,COMPAT,EPP,ECP,DMA] 
[ 5.800146] lp0: using parport0 (interrupt-driven). 
[ 5.897421] systemd-journald[352]: Received request to flush runtime journal from PID 1
```

- The output of dmesg can be extremely long
	- The values in the beginning of the lines are the amount of seconds relative to when kernel load begins.

In systems based on systemd, command journalctl will show the initialization messages with options -b, --boot, -k or --dmesg.
- journalctl --list-boots shows a list of boot numbers relative to the current boot, their identification hash and the timestamps of the first and last corresponding messages:

```bash
$ journalctl --list-boots
-4 9e5b3eb4952845208b841ad4dbefa1a6 Thu 2019-10-03 13:39:23 -03—Thu 2019-10-03 13:40:30 -03 
-3 9e3d79955535430aa43baa17758f40fa Thu 2019-10-03 13:41:15 -03—Thu 2019-10-03 14:56:19 -03 
-2 17672d8851694e6c9bb102df7355452c Thu 2019-10-03 14:56:57 -03—Thu 2019-10-03 19:27:16 -03 
-1 55c0d9439bfb4e85a20a62776d0dbb4d Thu 2019-10-03 19:27:53 -03—Fri 2019-10-04 00:28:47 -03 
0 08fbbebd9f964a74b8a02bb27b200622 Fri 2019-10-04 00:31:01 -03—Fri 2019-10-04 10:17:01 -03
```

- previous initialization logs are also kept in systems based on systemd.
	- So messages from prior OS sessions can still be inspected.
	- options -b 0 or --boot=0 are provided, then messages from the current boot will be shown.
	- options -b -1 or --boot=-1 will show messages from the previous initialization.  
	- options -b -2 or --boot=-2 will show the messages from the initialization before that and so on.
	- The following shows the kernel calling the systemd service manager for the last initialization process.

```bash
$ journalctl -b 0
oct 04 00:31:01 ubuntu-host kernel: EXT4-fs (sda1): mounted filesystem with ordered data mode. Opts: (null) 
oct 04 00:31:01 ubuntu-host kernel: ip_tables: (C) 2000-2006 Netfilter Core Team 
oct 04 00:31:01 ubuntu-host systemd[1]: systemd 237 running in system mode. 
oct 04 00:31:01 ubuntu-host systemd[1]: Detected architecture x86-64. 
oct 04 00:31:01 ubuntu-host systemd[1]: Set hostname to <torre>. oct 04 00:31:01 ubuntu-host systemd[1]: Reached target User and Group Name Lookups. 
oct 04 00:31:01 ubuntu-host systemd[1]: Created slice System Slice. oct 04 00:31:01 ubuntu-host systemd[1]: Listening on Journal Audit Socket. 
oct 04 00:31:01 ubuntu-host systemd[1]: Listening on Journal Socket. 
oct 04 00:31:01 ubuntu-host systemd[1]: Mounting POSIX Message Queue File System... 
oct 04 00:31:01 ubuntu-host systemd[1]: Started Read required files in advance. 
oct 04 00:31:01 ubuntu-host systemd[1]: Starting Load Kernel Modules... 
oct 04 00:31:01 ubuntu-host kernel: EXT4-fs (sda1): re-mounted. Opts: commit=300,barrier=0,errors=remount-ro 
oct 04 00:31:01 ubuntu-host kernel: lp: driver loaded but no devices found 
oct 04 00:31:01 ubuntu-host kernel: ppdev: user-space parallel port driver 
oct 04 00:31:01 ubuntu-host kernel: parport_pc 00:02: reported by Plug and Play ACPI 
oct 04 00:31:01 ubuntu-host kernel: parport0: PC-style at 0x378 (0x778), irq 7, dma 3 [PCSPP,TRISTATE,COMPAT,EPP,ECP,DMA] 
oct 04 00:31:01 ubuntu-host kernel: lp0: using parport0 (interrupt-driven). 
oct 04 00:31:01 ubuntu-host systemd-journald[352]: Journal started oct 04 00:31:01 ubuntu-host systemd-journald[352]: Runtime journal (/run/log/journal/abb765408f3741ae9519ab3b96063a15) is 4.9M, max 39.4M, 34.5M free. 
oct 04 00:31:01 ubuntu-host systemd-modules-load[335]: Inserted module 'lp' 
oct 04 00:31:01 ubuntu-host systemd-modules-load[335]: Inserted module 'ppdev' 
oct 04 00:31:01 ubuntu-host systemd-modules-load[335]: Inserted module 'parport_pc' 
oct 04 00:31:01 ubuntu-host systemd[1]: Starting Flush Journal to Persistent Storage...
```

- Initialization and other messages issued by the operating system are stored in files inside the directory /var/log/
- Critical error happens and the OS is unable to continue the init process after loading the kernel and the initramfs, an alternative boot medium could be used to start the system and to access the corresponding filesystem.
- The files under /var/log/ can be searched for possible reasons cousing the interruption of the boot process.
- Options -D or --directory of command journalctl can be used to read log messages in directories other than /var/log/journal/, which is the default location for systemd log messages
- systemd log messages are not stored in raw text, journalctl is required to read them.

#### Guided Exercises
1. On a machine equipped with a BIOS firmware, where is the bootstrap binary located?  __In the MBR of the first storage device, as defined in the BIOS configuration utility.__

2. UEFI firmware supports extended features provided by external programs, called EFI applications. These applications, however, have their own special location. Where on the system would the EFI applications be located?  __EFI applications are stored in the EFI System Partition (ESP), located at any available storage block with a compatible filesystem (usually a FAT32 filesystem).__

3. Bootloaders allow the passing of custom kernel parameters before loading it. Suppose the system is unable to boot due to a misinformed root filesystem location. How would the correct root filesystem, located at /dev/sda3, be given as a parameter to the kernel?  __The root parameter should be used, as in root=/dev/sda3.__

4. The boot process of a Linux machine ends up with the following message:
```bash
ALERT! /dev/sda3 does not exist. Dropping to a shell!
```
	
   What is the likely cause of this problem?  __The kernel was unable to find the device /dev/sda3, informed as the root filesystem.__

#### Explorational Exercises

1. The bootloader will present a list of operating systems to choose from when more than one operating system is installed on the machine. However, a newly installed operating system can overwrite the MBR of the hard disk, erasing the first stage of the bootloader and making the other operating system inaccessible. Why would this not happen on a machine equipped with a UEFI firmware?

> [!answer] 
On a machine equipped with UEFI (Unified Extensible Firmware Interface) firmware, the process of managing multiple operating systems and bootloaders differs from the traditional Master Boot Record (MBR) approach used in legacy BIOS systems. Here's why the problem of overwriting the bootloader and making other operating systems inaccessible typically does not happen on a UEFI-equipped machine:
> 1. **UEFI Uses GPT Instead of MBR**:
 >- UEFI systems typically use the **GUID Partition Table (GPT)**, which replaces the older MBR scheme. Unlike MBR, which stores the bootloader in a small space (the first 512 bytes of the disk), GPT separates the partitioning data and bootloaders.
 >- In UEFI, each operating system has its own bootloader stored on a **dedicated EFI System Partition (ESP)**, a special partition formatted with a FAT file system.
 >2. **No Single Bootloader in UEFI**:
> - Instead of relying on a single bootloader residing in the MBR (like in BIOS), UEFI allows multiple bootloaders, each associated with different operating systems, to coexist on the ESP. The UEFI firmware keeps track of these bootloaders using NVRAM (non-volatile memory).
> - Each operating system can add its bootloader to the UEFI boot menu without overwriting others, making it possible to choose between operating systems directly from the UEFI boot menu.
> 3. **UEFI Boot Manager**:
> - UEFI firmware includes a built-in **UEFI Boot Manager**, which provides a list of boot entries for each OS. When a new operating system is installed, its bootloader is added to the UEFI boot menu, rather than replacing the existing bootloader.
> - Even if one operating system modifies its bootloader, the others remain intact, and the system can still boot into the other operating systems via the UEFI Boot Manager.
> 5. **No Dependency on First Sector of the Disk**:
> - Since UEFI doesn’t depend on the MBR, the first sector of the disk is no longer critical for booting the system. This avoids issues like overwriting the first stage of the bootloader (which was common with MBR-based systems) and losing access to other operating systems.
> 
> In summary, UEFI avoids the issue of a new operating system overwriting the bootloader by using a separate EFI System Partition to store bootloaders and leveraging the UEFI Boot Manager to keep track of them. Each OS gets its own bootloader entry, ensuring that other installed operating systems remain accessible

2. What is a common consequence of installing a custom kernel without providing an appropriate initramfs image?

> [!answer] 
> The root filesystem may be inaccessible if its type was compiled as an external kernel module.

3. The initialization log is hundreds of lines long, so the output of dmesg command is often piped to a pager command — like command less — to facilitate the reading. What dmesg option will automatically paginate its output, eliminating the need to use a pager command explicitly?

> [!answer] 
> Commands dmesg -H or dmesg --human will enable the pager by default.

4. A hard drive containing the entire filesystem of an offline machine was removed and attached to a working machine as a secondary drive. Assuming its mount point is /mnt/hd, how would journalctl be used to inspect the contents of the journal files located at /mnt/hd/var/log/journal/?

> [!answer] 
> With commands journalctl -D /mnt/hd/var/log/journal or journalctl --directory=/mnt/hd/var/log/journal

