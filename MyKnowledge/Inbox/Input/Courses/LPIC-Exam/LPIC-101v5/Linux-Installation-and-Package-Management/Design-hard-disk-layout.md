---
tags: linux install package-managers helpers disk-layout filesystems swap partition lvm mount-points /root /var /home /boot EFI
date: 09-19-2024
---

# Design hard disk layout

To succeed in this objective, understanding the relationship between disks, partitions, filesystems, and volumes is what you need.

- Disks (or storage device since modern devices do not contain any "disks") can be thought of as a "physical container" for data.
- Before a disk can be used by a computer it need to be partitioned.
	- A partition is a logical subset of the physical disk, like a logical "fence"
	- Partitioning is a way to "compartmentalize" information stored on the disk, separating, for example, OS data from user data.
- Every disk needs at least one partition but can have many partitions.
	- Information about them is stored in a partition table.
	- This table includes information about the first and last sectors of the partition and its type, as well as further details on each partition.
- Inside each partition there is a filesystem.  The filesystem describes the way the information is stored on the disk.  This information includes how the directories are organized, what is the relationship between them, where is the data for each file, etc.
- Partitions can't span multiple disks.
	- Using the Logical Volume Manager (LVM) multiple partitions can be combined, even across disks, to form a single logical volume
- Logical volumes abstract the limitations of physical devices and let your work with "pools" of disk space that can be combined or distributed in a much more flexible way than traditional partitions.  LVM is useful in situations where you would need to add more space to a partition without having to migrate the data to a larger device.
- Time to learn how to design disk partitioning scheme for a Linux system, allocating filesystems and swap space to separate partitions or disks when needed.
- An overview of LVM.

# Mount points

- Before a filesystem can be accessed on Linux it needs to be mounted
	- This means attaching the filesystem to a specific point in your system’s directory tree, called a mount point
- When mounted, the contents of the filesystem will be available under the mount point
	-  You have a partition with your users' personal data (their home directories), containing the directories /john, /jack and /carol. When mounted under /home, the contents of those directories will be available under /home/john, /home/jack and /home/carol
- The mount point must exist before mounting the filesystem
	-  You cannot mount a partition under /mnt/userdata if this directory does not exist
	- However if the directory does exist and contains files, those files will be unavailable until you unmount the filesystem
		- If you list the contents of the directory, you will see the files stored on the mounted filesystem, not the original contents of the directory.
- Filesystems can be mounted anywhere you want. However, there are some good practices that should be followed to make system administration easier
	- Traditionally, /mnt was the directory under which all external devices would be mounted and a number of pre-configured anchor points for common devices, like CD-ROM drives (/mnt/cdrom) and floppy disks (/mnt/floppy) existed under it
	- This has been superseded by /media, which is now the default mount point for any user- removable media (e.g. external disks, USB flash drives, memory card readers, optical disks, etc.) connected to the system.
- On most modern Linux distributions and desktop environments, removable devices are automatically mounted under /media/USER/LABEL when connected to the system, where USER is the username and LABEL is the device label. For example, a USB flash drive with the label FlashDrive connected by the user john would be mounted under /media/john/FlashDrive/. The way this is handled is different depending on the desktop environment.
	- That being said, whenever you need to manually mount a filesystem, it is good practice to mount it under /mnt. The specific commands to control the mounting and unmounting of filesystems under Linux will be discussed in another lesson.

# Keeping things separated

- Some directories should be kept on separate partitions
	- Keep the bootloader-related files stored on /boot on a boot partition
	- This will ensure your system will still be able to boot in case of a crash on the root filesystem
	- Keeping user personal data under /home on a separate partition makes it easy to reinstall the system without the risk of accidentally touching user data. 
	- Keeping data related to a web or database server (usually under /var) on a seperate partition or even a separate disk makes system administration should you need to add more disk space for those use cases
- Also there are performance reasons you may want to keep the root filesystem (/) on a speedy ssd unit, and bigger directories like /home and /var on slower hard disks which offer much more space for a fraction of the cost.

# The Boot Partition (/boot)

- The boot partition has files used by the bootloader to load the OS
- On Linux systems the bootloader is usually GRUB2 or, on older systems, GRUB legacy.
- The partition is usually mounted under /boot and files are stored in /boot/grub
- Technically a boot partition is not needed, since in most cases GRUB can mount the root partition (/) and load the files from a separate /boot directory
	- However, a separate boot partition may be desired for safety (ensuring the system will boot even in case of a root filesystem crash), or if you wish to use a filesystem which the bootloader cannot understand in the root partition, or if it uses an unsupported encryption or compression method.
- The boot partition is usually the first partition on the disk. This is because the original IBM PC BIOS addressed disks using cylinders, heads and sectors (CHS), with a maximum of 1024 cylinders, 256 heads and 63 sectors, resulting in a maximum disk size of 528 MB (504 MB under MS-DOS)
- This means that anything past this mark would not be accessible on legacy systems, unless a different disk addressing scheme (like Logical Block Addressing, LBA) was used
- So for maximum compatibility, the boot partition is usually located at the start of the disk and ends before cylinder 1024 (528 MB), ensuring that no matter what, the machine will be always able to load the kernel
- Since the boot partition only stores the files needed by the bootloader, the initial RAM disk and kernel images, it can be quite small by today’s standards. A good size is around 300 MB.

# The EFI System Partition (ESP)

- EFI System Partition (ESP) is used by machines based on the UEFI to store boot loaders and kernel images for the operating systems installed.
- This partition is formatted in a FAT-based filesystem. On a disk partitioned with a GUID Partition Table it has a globally unique identifier of C12A7328-F81F-11D2-BA4B-00A0C93EC93B. If the disk was formatted under the MBR partitioning scheme the partition ID is 0xEF
- On machines running Microsoft Windows this partition is usually the first one on the disk, although this is not required. The ESP is created (or populated) by the operating system upon installation, and on a Linux system is mounted under /boot/efi

# The Home partition (/home)

- Each user in the system has a home directory to store personal files and preferences, and most of them are located under /home. Usually the home directory is the same as the username, so the user John would have his directory under /home/john
	- However there are exceptions. For example the home directory for the root user is /root and some system services may have associated users with home directories elsewhere
- There is no rule to determine the size of a partition for the /home directory (the home partition). You should take into account the number of users in the system and how it will be used. A user which only does web browsing and word processing will require less space than one who works with video editing, for example

# Variable Data (/var)

- This directory contains “variable data”, or files and directories the system must be able to write to during operation. This includes system logs (in /var/log), temporary files (/var/tmp) and cached application data (in /var/cache)
	- /var/www/html is also the default directory for the data files for the Apache Web Server and /var/lib/mysql is the default location for database files for the MySQL server. However, both of these can be changed
- One good reason for putting /var in a separate partition is stability. Many applications and processes write to /var and subdirectories, like /var/log or /var/tmp. A misbehaved process may write data until there is no free space left on the filesystem
- If /var is under / this may trigger a kernel panic and filesystem corruption, causing a situation that is difficult to recover from. But if /var is kept under a separate partition, the root filesystem will be unaffected.
- Like in /home there is no universal rule to determine the size of a partition for /var, as it will vary with how the system is used. On a home system, it may take only a few gigabytes. But on a database or web server much more space may be needed. In such scenarios, it may be wise to put /var on a partition on a different disk than the root partition adding an extra layer of protection against physical disk failure

# Swap

- The swap partition is used to swap memory pages from RAM to disk as needed. This partition needs to be of a specific type, and set-up with a proper utility called mkswap before it can be used
- The swap partition cannot be mounted like the others, meaning that you cannot access it like a normal directory and peek at its contents.
- A system can have multiple swap partitions (though this is uncommon) and Linux also supports the use of swap files instead of partitions, which can be useful to quickly increase swap space when needed.
- The size of the swap partition is a contentious issue. The old rule from the early days of Linux (“twice the amount of RAM”) may not apply anymore depending on how the system is being used and the amount of physical RAM installed
- of course the amount of swap can be workload dependent. If the machine is running a critical service, such as a database, web or SAP server, it is wise to check the documentation for these services (or your software vendor) for a recommendation

# LVM

- Logical Volume Management (LVM) is a form of storage virtualization that offers system administrators a more flexible approach to managing disk space than traditional partitioning. The goal of LVM is to facilitate managing the storage needs of your end users. The basic unit is the Physical Volume (PV), which is a block device on your system like a disk partition or a RAID array
- PVs are grouped into Volume Groups (VG) which abstract the underlying devices and are seen as a single logical device, with the combined storage capacity of the component PVs
- Each volume in a Volume Group is subdivided into fixed-sized pieces called extents. Extents on a PV are called Physical Extents (PE), while those on a Logical Volume are Logical Extents (LE). Generally, each Logical Extent is mapped to a Physical Extent, but this can change if features like disk mirroring are used.
- Volume Groups can be subdivided into Logical Volumes (LVs), which functionally work in a similar way to partitions but with more flexibility.
- The size of a Logical Volume, as specified during its creation, is in fact defined by the size of the physical extents (4 MB by default) multiplied by the number of extents on the volume. From this it is easy to understand that to grow a Logical Volume, for example, all that the system administrator has to do is add more extents from the pool available in the Volume Group. Likewise, extents can be removed to shrink the LV
- After a Logical Volume is created it is seen by the operating system as a normal block device. A device will be created in /dev, named as /dev/VGNAME/LVNAME, where VGNAME is the name of the Volume Group, and LVNAME is the name of the Logical Volume.
- These devices can be formatted with a desired filesystem using standard utilities (like mkfs.ext4, for example) and mounted using the usual methods, either manually with the mount command or automatically by adding them to the /etc/fstab file

### Guided Exercises
1. On Linux systems, where are the files for the GRUB bootloader stored? __Under /boot/grub.__ 
2. Where should the boot partition end to ensure that a PC will always be able to load the kernel? __Before cylinder 1024.__ 
3. Where is the EFI partition usually mounted? __Under /boot/efi.__ 
4. When manually mounting a filesystem, under which directory should it usually be mounted? __Under /mnt. However, this is not mandatory. You can mount a partition under any directory you want__

### Explorational Exercises

1. What is the smallest unit inside of a Volume Group? __Volume Groups are subdivided into extents.__
2. How is the size of a Logical Volume defined? __By the size of the physical extents multiplied by the number of extents on the volume.__ 
3. On a disk formatted with the MBR partitioning scheme, which is the ID of the EFI System Partition? __The ID is 0xEF.__ 
4. Besides swap partitions, how can you quickly increase swap space on a Linux system? __Swap files can be used.__
