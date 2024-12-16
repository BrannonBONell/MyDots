---
tags:
  - linux
  - vm
  - lpic
  - kvm
  - xen
  - virtualbox
  - paravirtualized
  - hybrid
  - virtualmachine
date: "09-23-2024"
---

# Virtualization

- A technology that allows for a software platform (hypervisor), to run processes that contain a fully emulated computer system
	- Hypervisor is responsible for managing the physical hardware's resources that can be used by virtual machines
	- Virtual machines are called guests of hypervisor
	- Virtual machine has many aspects of a physical computer emulated in software
		- a system's BIOs, hard drive disk controllers, etc.
	- Virtual machines will often use hard disk images that are stored as individual files, and will have access to the host machine's RAM and CPU through hypervisore software.
	- Hypervisor separates the access to the host system's hardware resources amon the guests
		- allowing for multiple operating systems to run on a single host

- Community used hypervisors for Linux include:
	- Xen
		- Xen is an open source Type-1 hypervisor
			- it does not rely on an underlying OS to function
		- Hypervisor of this sort is known as a bare-metal hypervisor since the computer can boot directly to into the hypervisor.
	- KVM
		- Kernel Virtual Machine a Linux kernel module for virtualization
		- KVM is a hypervisor of Type-1 and Type-2 it is able to perform a hypervisor perfectly well by integrating with a running Linux installation.
		- Virtual Machines deployed with KVM use the libvirt daemon and associated software utilites to be created and managed
	- VirtualBox
		- Popular desktop application that makes it easy to create and manage virtual machines
		- Oracle VM VirtualBox is a cross-platform, and will work on Linux, macOS, and Windows.
		- Since VirtualBox requires an underlying OS to run, it is a Type-2

- Some hypervisors allow for the dynamic relocation of a virtual machine.
	- The process of moving a virtual machine from one hypervisor installation to another is called a migration
	- techniques involved differ between hypervisor implementations.
	- Some can only be performed when the guest system has been shut down
	- others can be performed while the gues is running (live migration)
	- these techniques can aid during maintenance windows for hypervisors
		- or for system resiliency when a hypervisor becomes non-functional when a guest can be moved to a hypervisor that is working.

## Types of Virtual Machines
- There are three main types of virtual machines
	1. full virtualized guest
	2. paravirtualized guest
	3. hybrid guest

	- Full Virtualized
		- All instructions that a guest os is expected to execute must be able to run within a fully virtualized OS installation.
		- No additional software drivers are installed within the guest to translate the instructions to either simulated or real hardware.
		- Fully virtualized guest is one where the guest (or HardwareVM) is unaware that it is a running virtual machine instance.
		- In order for this type of virtualization to take place on x86 based hardware the Intel VT-x or AMD-V CPU extensions must be enabled on the system that has the hypervisor installed.
		- This can be done from the BIOS or UEFI

	- Paravirtualized
		- A paravirtualized guest (PVM) is one where the guest OS is aware that it is a running virtual machine instance.  These types of guests will make use of a modified kernel and special drivers (guest drivers) that will help the guest OS utilize software and hardware resources of the hypervisor.  The Performance of the paravirtualized guest is often better than that of the fully virtualized guest due to  the advantage that these software drivers provide

	- Hybrid
		- PVM and Full virtualization can be combined to allow unmodified OS to recieve near native I/O performance by using PVM drivers on a full virtualized OS.  The PVM drivers contain storage and network device drivers with enhanced disk and network I/O performance

- Virtualization platforms often provide packaged guest drivers for virtualized OS systems.  The KVM utilizes drivers from the Virtio project, Oracle VM VirtualBox uses Guest Extensions available from a downloadable ISO file.

## Example libvirt Virtual Machine
- We will look at an example virtual machine that is managed by libvirt uses KVM hypervisor
- a vm consists of a group of files primarily an XML file that defines the vm (hardware config, network connectivity, display capabilities, etc) and a hard disk image file that contains the install of the OS and its software.

- Example XML config file for a vm and its network enviornment:
```bash
$ ls /etc/libvirt/qemu
total 24
drwxr-xr-x 3 root root 4096 Oct 29 17:48 networks
-rw------- 1 root root 5667 Jun 29 17:17 rhel8.0.xml
```

> [!note]
> the qemu portion of the directory path refers to the underlying software that  KVM-based vm rely on.
>The QEMU project provides software for the hypervisor to emulate hardware devices that the vm will use,
>such as disk controllers, access to the host CPU, network card emulation, and more.

- Note that there is a directory name networks.
	- this dir contains definition files (also using XML) that create network configs that the vm can use
	- This hypervisor is only using one network, and one definition file that contains a config for a virtual network segment that these systems will utilize.
```bash
$ ls -l /etc/libvirt/qemu/networks/
total 8
drwxr-xr-x 2 root root 4096 Jun 29 17:15 autostart
-rw------- 1 root root
 576 Jun 28 16:39 default.xml
$ sudo cat /etc/libvirt/qemu/networks/default.xml
<!--
WARNING: THIS IS AN AUTO-GENERATED FILE. CHANGES TO IT ARE LIKELY TO BE
OVERWRITTEN AND LOST. Changes to this xml configuration should be made using:
virsh net-edit default
or other application using the libvirt API.
-->
<network>
<name>default</name>
<uuid>55ab064f-62f8-49d3-8d25-8ef36a524344</uuid>
<forward mode='nat'/>
<bridge name='virbr0' stp='on' delay='0'/>
<mac address='52:54:00:b8:e0:15'/>
<ip address='192.168.122.1' netmask='255.255.255.0'>
<dhcp>
<range start='192.168.122.2' end='192.168.122.254'/>
</dhcp>
</ip>
</network>
```

- Definitions includes a Class C private network and an emulated hardware device to act as a router for this network.
- Range of IP addresses for the hypervisor to use with a DHCP server implementation that can be assigned to the vm that use this network
- Network config also ustilizes network address translation(NAT) to forward packets to other networks, such as the hypervisor's LAN.

- REHL 8 vm definition file:
```bash
$ sudo cat /etc/libvirt/qemu/rhel8.0.xml
<!--
WARNING: THIS IS AN AUTO-GENERATED FILE. CHANGES TO IT ARE LIKELY TO BE
OVERWRITTEN AND LOST. Changes to this xml configuration should be made using:
virsh edit rhel8.0
or other application using the libvirt API.
-->

<domain type='kvm'>
<name>rhel8.0</name>
<uuid>fadd8c5d-c5e1-410e-b425-30da7598d0f6</uuid>
<metadata>
<libosinfo:libosinfo xmlns:libosinfo="http://libosinfo.org/xmlns/libvirt/domain/1.0">
<libosinfo:os id="http://redhat.com/rhel/8.0"/>
</libosinfo:libosinfo>
</metadata>
<memory unit='KiB'>4194304</memory>
<currentMemory unit='KiB'>4194304</currentMemory>
<vcpu placement='static'>2</vcpu>
<os>
<type arch='x86_64' machine='pc-q35-3.1'>hvm</type>
<boot dev='hd'/>
</os>
<features>
<acpi/>
<apic/>
<vmport state='off'/>
</features>
<cpu mode='host-model' check='partial'>
<model fallback='allow'/>
</cpu>
<clock offset='utc'>
<timer name='rtc' tickpolicy='catchup'/>
<timer name='pit' tickpolicy='delay'/>
<timer name='hpet' present='no'/>
</clock>
<on_poweroff>destroy</on_poweroff>
<on_reboot>restart</on_reboot>
<on_crash>destroy</on_crash>
<pm>
<suspend-to-mem enabled='no'/>
<suspend-to-disk enabled='no'/>
</pm>
<devices>
<emulator>/usr/bin/qemu-system-x86_64</emulator>
<disk type='file' device='disk'>
<driver name='qemu' type='qcow2'/>
<source file='/var/lib/libvirt/images/rhel8'/>
<target dev='vda' bus='virtio'/>
<address type='pci' domain='0x0000' bus='0x04' slot='0x00' function='0x0'/>
</disk>
<controller type='usb' index='0' model='qemu-xhci' ports='15'>
<address type='pci' domain='0x0000' bus='0x02' slot='0x00' function='0x0'/>
</controller>
<controller type='sata' index='0'>
<address type='pci' domain='0x0000' bus='0x00' slot='0x1f' function='0x2'/>
</controller>
<controller type='pci' index='0' model='pcie-root'/>
<controller type='pci' index='1' model='pcie-root-port'>
<model name='pcie-root-port'/>
<target chassis='1' port='0x10'/>
<address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x0'
multifunction='on'/>
</controller>
<controller type='pci' index='2' model='pcie-root-port'>
<model name='pcie-root-port'/>
<target chassis='2' port='0x11'/>
<address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x1'/>
</controller>
<controller type='pci' index='3' model='pcie-root-port'>
<model name='pcie-root-port'/>
<target chassis='3' port='0x12'/>
<address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x2'/>
</controller>
<controller type='pci' index='4' model='pcie-root-port'>
<model name='pcie-root-port'/>
<target chassis='4' port='0x13'/>
<address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x3'/>
</controller>
<controller type='pci' index='5' model='pcie-root-port'>
<model name='pcie-root-port'/>
<target chassis='5' port='0x14'/>
<address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x4'/>
</controller>
<controller type='pci' index='6' model='pcie-root-port'>
<model name='pcie-root-port'/>
<target chassis='6' port='0x15'/>
<address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x5'/>
<controller type='pci' index='7' model='pcie-root-port'>
<model name='pcie-root-port'/>
<target chassis='7' port='0x16'/>
<address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x6'/>
</controller>
<controller type='virtio-serial' index='0'>
<address type='pci' domain='0x0000' bus='0x03' slot='0x00' function='0x0'/>
</controller>
<interface type='network'>
<mac address='52:54:00:50:a7:18'/>
<source network='default'/>
<model type='virtio'/>
<address type='pci' domain='0x0000' bus='0x01' slot='0x00' function='0x0'/>
</interface>
<serial type='pty'>
<target type='isa-serial' port='0'>
<model name='isa-serial'/>
</target>
</serial>
<console type='pty'>
<target type='serial' port='0'/>
</console>
<channel type='unix'>
<target type='virtio' name='org.qemu.guest_agent.0'/>
<address type='virtio-serial' controller='0' bus='0' port='1'/>
</channel>
<channel type='spicevmc'>
<target type='virtio' name='com.redhat.spice.0'/>
<address type='virtio-serial' controller='0' bus='0' port='2'/>
</channel>
<input type='tablet' bus='usb'>
<address type='usb' bus='0' port='1'/>
</input>
<input type='mouse' bus='ps2'/>
<input type='keyboard' bus='ps2'/>
<graphics type='spice' autoport='yes'>
<listen type='address'/>
<image compression='off'/>
</graphics>
<sound model='ich9'>
<address type='pci' domain='0x0000' bus='0x00' slot='0x1b' function='0x0'/>
</sound>
<video>
<model type='virtio' heads='1' primary='yes'/>
<address type='pci' domain='0x0000' bus='0x00' slot='0x01' function='0x0'/>
</video>
<redirdev bus='usb' type='spicevmc'>
<address type='usb' bus='0' port='2'/>
</redirdev>
<redirdev bus='usb' type='spicevmc'>
<address type='usb' bus='0' port='3'/>
</redirdev>
<memballoon model='virtio'>
<address type='pci' domain='0x0000' bus='0x05' slot='0x00' function='0x0'/>
</memballoon>
<rng model='virtio'>
<backend model='random'>/dev/urandom</backend>
<address type='pci' domain='0x0000' bus='0x06' slot='0x00' function='0x0'/>
</rng>
</devices>
</domain>
```

- This file defines a number of hardwar settings used by this guest
	- The amount of RAM that it will have assigned to it
	- Number of CPU cores from the hypervisor that the guest has access to
	- Hard disk image file that is associated with this guest
	- Display capabilities (via the SPICE protocol)
	- Guest's access to the USB devices as well as emulated keyboard and mice input

## Example VM Disk Storage
- This vm hard disk image /var/lib/libvrt/images/rehl8
Disk image itself on this hypervisor:
```bash
$ sudo ls -lh /var/lib/libvirt/images/rhel8
-rw------- 1 root root 5.5G Oct 25 15:57 /var/lib/libvirt/images/rhel8
```

- Current size of disk image consumes only 5.5GB of space
- OS within the guests sees a 23.3GB disk
	- output of the following command from within the running vm
```bash
$ lsblk
NAME MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
vda	252:0	0 23.3G	0 disk
├─vda1	252:1	0	1G	0 part /boot
└─vda2	252:2	0 22.3G	0 part	0
	├─rhel-root	253:0	20G	0 lvm	/
	└─rhel-swap	253:1	0	2.3G	0 lvm	[SWAP]
```

- This is due to the type of disk provisioning
	- there are multiple types of disk images that a vm can use but the two primary types are

- COW
	- copy-on-write(thin-provisioning or sparse images)
	- Is a method where a disk file is created with a pre-defined upper size limit.
	- The disk image size is only increases as new data is written.
	- Guest OS sees a predefined disk limit of 23.3GB has only 5.5GB of data to the disk file.
	- The disk image format used for the example virtual machine in qcow2 which is a QEMU COW file format
- RAW
	- full disk type is a file that has all of its space pre-allocated
	- 10GB raw disk image file consumes 10GB of actual disk space on the hypervisor
	- There is a performance benefit to this style of disk as all of the needed disk space already exists.
		- the underlying hypervisor can just write data to the disk without a performance hit
		- of monitoring the disk image to ensure that it has not yet reached its limit and extending the size of the file as new data is written on it.
- Other virtualization management platforms such as Red Hat Enterprise Virtualization and oVirt
	- can make use of physical disks to act as backing storage locations for a vm's OS.
	- Can utilize storage area network (SAN) or network attached stoarage (NAS) devices to write their data to
	- The hypervisor keeps track of what storage locations belong to which vm's
	- These storage systemcs can use technologies such as LVM to grrow or shrink the size of the vm's disk storage needed
	- and aids in the creation of a management of storage snapshots

## Working with Virtual Machine Templates

- vm's are typically just files running on a hypervisor
	- It's easy to create templates that can be customized for paticular deployment scenarios.
	- vm will have a basic OS installation and some pre-configured authentication config settings set up to ease future system launches
	- This makes the time it takes to buld a new system much less by reducing the amount of work that is often repeated
		- base package installation and locale settings for example.
- This vm template could than later get copied to a new guest system
	- New guest would be renamed, a new MAC address generated for its network interface, and other modifications can be made depending on its intended use.

## The D-Bus Machine ID

- Many Linux installations will utilze a machine identification number generated oat install time
	- Named the D-Bus machine ID
	- if a vm machine is cloned to be used as a template for other vm installations a new D-Bus machine ID would need to be created
	- it would ensure that system resources from the hypervisor get directed to the appropriate guest system
Validate that a D-Bus machine ID exists for the running system:
```bash
$ dbus-uuidgen --ensure
```
If no error messages are displayed, an ID exists for the system
To view the current D-Bus machine ID:
```bash
$ dbus-uuidgen --get
17f2e0698e844e31b12ccd3f9aa4d94a
```

- The string that is displayed is the current ID number.
- No two Linux systems running on a hypervisor should have the same D-Bus machine ID

- D-Bus machine ID is at /var/lib/dbus/machine-id and is symbolically linked /etc/machine-id
	- Changing the ID number on a running system is discouraged
		- system instability and crashes are likely to occur
	- if two vm's do have the same D-Bus machine ID, generate a new one:
```bash
$ sudo rm -f /etc/machine-id
$ sudo dbus-uuidgen --ensure=/etc/machine-id
```

- if /var/lib/dbus/machine-id is not symbolic link to /etc/machine-id
	- /var/lib/dbus/machine-id will need to be removed

## Deploying Virtual Machines to the Cloud

- There are a multitude of IaaS (infastructure as a service) providers available that run hypervisor systems and that can deploy virtual guest images for an organization.
- All of these providers have tools in place that allows an administrator to build, deploy and configure custom vm's based on a variety of Linux distros.
- Many also have systems in place that allow for the deployment and migrations of vm's built from within a customer's organization.

- When assessing a deployment of a Linux system in an IaaS environment
	- Key elements that an administrator should be cognizant of:

## Computer Instances

- Cloud providers will charge usage rates based on "computing instances"
	- How much SPU time your cloudd-based infrastructure will use
	- Careful planning of how much processing timne applications will actually require will aid in keeping the costs of a cloud solution manageable

- Computing instances also often refer to the number of VMs that are provisioned in a cloud environment
	- More instances of systems that are running at one time will also factor into how much overall CPU time and organization will be charged for

## Block Storage

- Cloud providers have various levels of block storage available for an organization to use
	- from web-based network storage for files to external storage for a cloud provisioned vm to use for hosting files

- Cost will vary based on the amount of storage used, speed of the storage within the provider's data centers.
	- Faster storage access typically will cost more
	- data "at rest" (archival storage) is often inexpensive

## Networking

- One of the main components of working with a cloud solutions provider is how the virtual network will be configured.
	- IaaS providers will have some form of web-based utilities that can be used for the design and implementation of different network routes, subnetting, and firewall configs.
	- Some will even provide DNS solutions so that publicly accessible FQDN(fully qualified domain names) can be assigned to your internet facing systems.
	- "Hybrid" solutions available that can connect an existing, on-premise network infrastructure to a cloud-based one through the means of a VPN tying the two together

## Securely Acessing Guests in the Cloud

- The mose used method in use for accessing a remote virtual guest on the cloud is through the use of OpenSSH software.
	- A linux system that resides in the cloud would have the OpenSSH server running
	- While an administrator would use an OpenSSH client with pre-shared keys for remote access.

- An administrator would run the following:
```bash
$ ssh-keygen
```

- follow the prompts to create a public and private SSH key pair.
	- Prrivate key remains on the administrator's local system (stored in ~/.ssh/)
	- Public key gets copied to the remote cloud system
	- The exact same method one would use when working with networked machines on a corporate LAN

- The administrator would then run the following:
```bash
$ ssh-copy-id -i <public_key> user@cloud_server
```

- This will copy the public SSH key from the key pair just generated to the remote cloud server.
- The public key will be recorded in the ~/.ssh/authorized_keys file on the cloud server, and set the appropriate permissions on the file

> [!note]
>If there is only one public key file in the ~/.ssh/ directory, then the -i switch can
>be omitted, as the ssh-copy-id command will default to the public key file in the
>directory (typically the file ending with the .pub extension).

- Cloud providers will automatically generate a key pair when a new Linux system is provisionsed
	- The administrator will then need to download the private key for the new system from the cloud provider and store it on their local system.
	- Note that the permissions for SSH keys must be 0600 for a private key, and 0644 for a public key

## Preconfiguring Cloud Systems

- A useful tool that simplifies the deployments of cloud-based VM is a cloud-init utility.
	- This command with the associated config files and  pre-defined virtual machine image is a vendor-neutral method for deplying a Linux guest across a plethora of IaaS providers
	- Utilizing YAML plain-text files an administrator can pre-configure network settings, software package selections, SSH key configs, user account creations, locale settings, along with a myriad of other options to quickly build out new systems.

- During a new system's initial boot up cloud-init will read  in the settings from the YAML configs files and apply them
	- This process only need to apply to a systems initial setup making deploying a fleet of new systems on the cloud provider's platform easy.

- the YAML, file syntax used with cloud-init is called cloud-config.
Here's an Example:

```YAML
#cloud-config
timezone: Africa/Dar_es_Salaam
hostname: test-system

# Update the system when it first boots up
apt_update: true
apt_upgrade: true

# Install the Nginx web server
packages:
- nginx
```

- Note that on the top line there is no space between the hash and the term cloud-config

> [!note]
>cloud-init is not just for virtual machines. The cloud-init tool suite can also be
>used to pre-configure containers (such as LXD Linux containers) prior to
>deployment.

## Containers

- Container technology is similar in some ways to a VM
	- You get an isolated environment to easily deploy an application
	- With a VM an entire computer is emulated
	- Containers use just enough software to run an applications having far less overhead

- Containers allow for greater flexibility
- An application container can be migrated from one host to another
- A container application is always running while it is getting migrated
- Containers also make it easy to deploy new versions of applications in tandem with an existing version.
- As users close their sessions with running containers
	- Containers can get automatically removed from the system by the container orchestration software and replaced with the new version thus reducing downtime

> [!note]
>There are numerous container technologies available for Linux, such as Docker,
>Kubernetes, LXD/LXC, systemd-nspawn, OpenShift and more. The exact
>implementation of a container software package is beyond the scope of the LPIC-1
>exam.

- Containers make use of control groups(cgroups) mechanisme within the Linux kernel
- cgroup is a way to partition system resources such as memory, processor time, disk and network bandwith for an individual application
- An administrator can use cgroups directly to set system resource limits on an application, or a group of applications that could exist within a single cgroup
- In essence this is what container software does for the administrator, and providing tools that ease the management and deployment of cgroups

> [!note]
>Currently, knowledge of cgroups are not necessary for passing the LPIC-1 exam.
>The concept of the cgroup is mentioned here so that the candidate would at least
>have some background knowledge of how an application is segregated for the sake
>of system resource utilization.

### Guided Exercises

1. What CPU extensions are necessary on an x86 based hardware platform that will run fully
virtualized guests?
__VT-x for Intel CPUs or AMD-V for AMD CPUs__
2. A mission-critical server installation that will require the fastest performance will likely use
what type of virtualization?
__An operating system that makes use of paravirtualization, such as Xen, as the guest operating
system can make better use of hardware resources available to it through the use of software
drivers designed to work with the hypervisor.__
3. Two virtual machines that have been cloned from the same template and that utilize D-Bus are
performing erratically. They both have separate hostnames and network configuration
settings. What command would be used to determine if each of the virtual machines have
different D-Bus Machine IDs?
__dbus-uuidgen --get__


###  Exploratorive Exercises

1. Run the following command to see if your system already has CPU extensions enabled to run a
virtual machine (your results may vary depending on your CPU): grep --color -E
"vmx|svm" /proc/cpuinfo. Depending on the output, you may have "vmx" highlighted (for
Intel VT-x enabled CPU’s) or "svm" highlighted (for AMD SVM enabled CPU’s). Should you get no
results, consult your BIOS or UEFI firmware instructions on how to enable virtualization for
your processor.

The results will vary depending on your CPU that you have. Here is example output from a
computer with an Intel CPU with virtualization extensions enabled in the UEFI firmware:

```bash
$ grep --color -E "vmx|svm" /proc/cpuinfo
flags	: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36
clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc
art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni
pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1
sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm
3dnowprefetch cpuid_fault epb invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi
flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm
mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat
pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear flush_l1d
```

2. If your processor supports virtualizations, seek out your distribution’s documentation for
running a KVM hypervisor.
◦ Install the necessary packages to run a KVM hypervisor.
This will vary depending on your distribution, but here are some starting points:
Ubuntu — https://help.ubuntu.com/lts/serverguide/libvirt.html
Fedora — https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-virtualization/
Arch Linux — https://wiki.archlinux.org/index.php/KVM
◦ If you are using a graphical desktop environment, it is recommended to also install the
virt-manager application which is a graphical front-end that can be used on a KVM
installation. This will aid in virtual machine installations and management.
Again, this will vary by distribution. An example using Ubuntu looks like this:
```bash
$ sudo apt install virt-manager
```
◦ Download a Linux distribution ISO image of your choice, and following your distribution’s
documentation create a new virtual machine using this ISO.
This task is easily handled by the virt-manager package. However a virtual machine can
be created from the command-line using the virt-install command. Try both methods to
get an understanding of how virtual machines are deployed.
