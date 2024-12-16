---
tags: hardware linux device detect verify
date: 09-04-2024
---

# Detecting your hardware

-  Detecting your hardware on linux
	- Linux hardware layaer.
	- Linux kernel is using dbus to detect the systems hardware.
	- lspci in the cli will show you a list of hardware in the system.
		- good way to make sure all of your hardware is being detected.
		- Hardware that's missing from the lspci should be concerning.
		- these should always be present
	The following output of command lspci, for example, shows a few identified devices:
```bash
$ lspci 
01:00.0 VGA compatible controller: NVIDIA Corporation GM107 [Geforce GTX 750 Ti] (rev a2)
04:02.0 Network controller: Ralink corp. RT2561/RT61 802.11g PCI
04:04.0 Multimedia audio controller: VIA Technologies Inc. ICE1712 [Envy24] PCI Multi- Channel I/O Controller (rev 02)
04:0b.0 FireWire (IEEE 1394): LSI Corporation FW322/323 [TrueFire] 1394a Controller (rev 70)
```

-  The hexadecimal numbers at the start of each line are the unique address of the PCI Device
	- lspci shows more details about a specific device if the address is given with option 
		- -s then followed by -v:
```bash
$ lspci -s 04:02.0 -v
04:02.0 Network controller: Ralink corp. RT2561/RT61 802.11g PCI
Subsystem: Linksys WMP54G v4.1
Flags: bus master, slow devsel, latency 32, IRQ 21
Memory at e3100000 (32-bit, non-prefetchable) [size=32K]
Capabilities: [40] Power Management version 2
kernel driver in use: rt61pci
```

- Now we receive more details
	- device @ address 04:02.0. is a network controller
	- Internal name is Ralink corp.  RT2561/RT61 802.11g PCI
	- Subsystem is associated with the device brand and model : Linksys WMP54g v4.1
	- Kernel module can be identified on the lline
		- kernel driver in use : rt61pci
- From the gathered information, one can infer that
	1. Device was identified
	2. Matching kernel module was loaded
	3. Device should be ready for use

- Another way to verify which kernel module is used for a specific device is by using the option -k

```bash
$ lspci -s 01:00.0 -k
01:00.0 VGA compatible controller: NVIDIA Corporation GM107 [GeForce GTX 750 Ti] (rev a2)
kernel driver in use: nvidia
kernel modules: nouveau, nvidia_drm, nvidia
```

-  All corresponding kernel modules are listed on the line
	- kernel modules: nouveau, nvidia_drm, nvidia.

- lsusb similar to lspci but for usb information

```bash
$ lsusb
Bus 001 Device 029: ID 1781:0c9f Multiple Vendors USBtiny
Bus 001 Device 028: ID 093a:2521 Pixart Imaging, Inc. Optical Mouse
Bus 001 Device 020: ID 1131:1001 Integrated System Solution Corp. KY-BT100 Bluetooth Adapter
Bus 001 Device 011: ID 04f2:0402 Chicony Electronics Co., Ltd Genius LuxeMate i200 Keyboard
Bus 001 Device 007: ID 0424:7800 Standard Microsystems Corp.
Bus 001 Device 003: ID 0424:2514 Standard Microsystems Corp. USB 2.0 Hub
Bus 001 Device 002: ID 0424:2514 Standard Microsystems Corp. USB 2.0 Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

- lsusb shows available USB channels and devices connected to them.
	- option -v displays more details.
	- specified device can be selected by providing the ID to the option -d

```bash
$ lsusb -v -d 1781:0c9f
Bus 001 Device 029: ID 1781:0c9f Multiple Vendors USBtiny
Device Descriptor:
  bLength 18
  bDescriptorType 1
  bcdUSB 1.01
  bDeviceClass 255 Vendor Specific Class
  bDeviceSubClass 0
  bDeviceProtocol 0
  bMaxPacketSize0 8
  idVendor 0x1781 Multiple Vendors
  idProduct 0x0c9f USBtiny
  bcdDevice 1.04
  iManufacturer 0
  iProduct 2 USBtiny
  iSerial 0 bNumConfigurations 1
  bNumConfigurations 1
```

- lsusb with the option -t will show the current USB device mappings as a hierarchical tree
```bash
$lsusb -t
/: Bus 01.Port 1: Dev 1, Class=root_hub, Driver=dwc_otg/1p, 480M
   |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
       |__ Port 1: Dev 3, If 0, Class=Hub, Driver=hub/3p, 480M
           |__ Port 2: Dev 11, If 1, Class=Human Interface Device, Driver=usbhid, 1.5M
           |__ Port 2: Dev 11, If 0, Class=Human Interface Device, Driver=usbhid, 1.5M
           |__ Port 3: Dev 20, If 0, Class=Wireless, Driver=btusb, 12M
           |__ Port 3: Dev 20, If 1, Class=Wireless, Driver=btusb, 12M
           |__ Port 3: Dev 20, If 2, Class=Application Specific Interface, Driver=, 12M
           |__ Port 1: Dev 7, If 0, Class=Vendor Specific Class, Driver=lan78xx, 480M
           |__ Port 2: Dev 28, If 0, Class=Human Interface Device, Driver=usbhid, 1.5M 
           |__ Port 3: Dev 29, If 0, Class=Vendor Specific Class, Driver=, 1.5M
```

- It is possible devices don't have corresponding modules associated with them
	- communication with a certain device can be hanled by the application directly without the intermediation provided by a module.  
	- Signifigant information can be provided py the output of lsusb -t.  
		- When a matching module exists, its name appears at the end of the line for the device, as in Driver=btusb.
		- Class identifies teh general category
			- ie. Human Interface Device, Wireless, Vendor Specific Class, Mass Storage, among others.  
- To verify which device is using module btusb, in the previous listings, both Bud and Dev numbers shouold be given to the -s option of lsusb.
```bash
$ lsusb -s 01:20
Bus 001 Device 020: ID 1131:1001 Integrated System Solution Corp. KY-BT100 Bluetooth Adapter
```

- It's common to have a large set of loaded kernel modules at any time.
	- Preferable way to interact with them is to use commands from the kmod package.
	- kmod is a set of tools to handle common tasks with Linux kernel modules
		- insert, remove, list, check properties, resolve dependencies and aliases.
	- lsmod command, shows all currently loaded modules:
```bash
$ lsmod
Module Size Used by 
kvm_intel 138528 0
kvm 421021 1 kvm_intel
iTCO_wdt 13480 0
iTCO_vendor_support 13419 1 iTCO_wdt
snd_usb_audio 149112 2
snd_hda_codec_realtek 51465 1
snd_ice1712 75006 3
snd_hda_intel 44075 7
arc4 12608 2
snd_cs8427 13978 1 snd_ice1712
snd_i2c 13828 2 snd_ice1712,snd_cs8427
snd_ice17xx_ak4xxx 13128 1 snd_ice1712
snd_ak4xxx_adda 18487 2 snd_ice1712,snd_ice17xx_ak4xxx
microcode 23527 0
snd_usbmidi_lib 24845 1 snd_usb_audio
gspca_pac7302 17481 0
gspca_main 36226 1 gspca_pac7302
videodev 132348 2 gspca_main,gspca_pac7302
rt61pci 32326 0
rt2x00pci 13083 1 rt61pci
media 20840 1 videodev
rt2x00mmio 13322 1 rt61pci
hid_dr 12776 0
snd_mpu401_uart 13992 1 snd_ice1712
rt2x00lib 67108 3 rt61pci,rt2x00pci,rt2x00mmio
snd_rawmidi 29394 2 snd_usbmidi_lib,snd_mpu401_uart
```

- The output of lsmod is divided into 3 columns
	- Module : Module name
	- Size : Amount of RAM occupied by the module, in bytes
	- Used by : Depending modules

- Some modules require other modules to work properly
```bash
$ lsmod | fgrep -i snd_hda_intel
snd_hda_intel 42658 5
snd_hda_codec 155748 3
snd_hda_codec_hdmi,snd_hda_codec_via,snd_hda_intel
snd_pcm 81999 3 snd_hda_codec_hdmi,snd_hda_codec,snd_hda_intel 
snd_page_alloc 13852 2 snd_pcm,snd_hda_intel 
snd 59132 19 snd_hwdep,snd_timer,snd_hda_codec_hdmi,snd_hda_codec_via,snd_pcm,snd_seq,snd_hda_codec,snd_h da_intel,snd_seq_device
```

- The third Column Used by shows
	- Modules that require the module in the first colunm to properly work.

- Command modprobe can be used to both load and unload kernel modules
	- to unload a module and its related modules, (as long as they are not being used by a runing process)
	- comman modprobe -r should be used.  
	- To unload module snd-hda-intel
```bash
# modprobe -r snd-hda-intel
```

It is possible to change module parameters when the kernel is being loaded, not so different from passing options to commands. Each module accepts specific parameters, but most times the default values are recommended and extra parameters are not needed. However, in some cases it is necessary to use parameters to change the behaviour of a module to work as expected.

- Using the module name as the only argument with the command modinfo.
	- Shows a description, the file, the author, the license, the identification, the dependencies and the available parameters for the given module.
	- Customized parameters for a module can be made persistent by including them in /etc/modprobe.conf
		- Or in individual files with the extension .conf in the directory /etc/modprobe.d/.
		- Option -p with command modinfo will display all available parameters and ignore the other information

```bassh
# modinfo -p nouveau
vram_pushbuf:Create DMA push buffers in VRAM (int)
tv_norm:Default TV norm.
				Supported: PAL, PAL-M, PAL-N, PAL-Nc, NTSC-M, NTSC-J, hd480i, hd480p, hd576i, hd576p, hd720p, hd1080i.
				Default: PAL
				NOTE Ignored for cards with external TV encoders. (charp)
nofbaccel:Disable fbcon acceleration (int) 
fbcon_bpp:fbcon bits-per-pixel (default: auto) (int)
mst:Enable DisplayPort multi-stream (default: enabled) (int)
tv_disable:Disable TV-out detection (int)
ignorelid:Ignore ACPI lid status (int)
duallink:Allow dual-link TMDS (default: enabled) (int)
hdmimhz:Force a maximum HDMI pixel clock (in MHz) (int) config:option string to pass to driver core (charp)
debug:debug string to pass to driver core (charp)
noaccel:disable kernel/abi16 acceleration (int)
dmodeset:enable driver (default: auto, 0 = disabled, 1 = enabled, 2 = headless) (int)
atomic:Expose atomic ioctl (default: disabled) (int)
runpm:disable (0), force enable (1), optimus only default (-1) (int)
```

- The sample output shows all the parameters available for the module nouveau
	- Option modeset, for example allowws to control whether display resolution and depth will be set in the kernel space rather than user space.
		- Adding options nouveau modeset=0 to the file /etc/modeprobe.d/nouveau.conf will disable the modeset kernel feature.

- If a module is causing problems, the file /etc/modprobe.d/blacklist.conf can be used to block the loading of the module. For example, to prevent the automatic loading of the module nouveau, the line blacklist nouveau must be added to the file /etc/modprobe.d/blacklist.conf. This action is required when the proprietary module nvidia is installed and the default module nouveau should be set aside.

> [!important] LISTEN
> You can modify the /etc/modprobe.d/blacklist.conf file that already exists on the system by default. However, the preferred method is to create a separate configuration file, /etc/modprobe.d/<module_name>.conf, that will contain settings specific only to the given kernel module

## Information Files and Device Files

The commands lspci, lsusb and lsmod act as front-ends to read hardware information stored by the operating system.

- This kind of information is kept in special files in the directories /proc and 
- These directories are mount points to filesystems not present in a device partition
	- Only in RAM space used by the kernel to store runtime configuration and information on running processes
		-  Such filesystems are not intended for conventional file storage, so they are called pseudo-filesystems and only exist while the system is running.
- The /proc directory contains files with information regarding running processes and hardware resources.
	- Some of the important files in /proc for inspecting hardware are:
		- /proc/cpuinfo
			- Detailed information about the CPU(s) found by the operating system
		- /proc/interrupts
			- Numbers of the interrupts per IO device for each CPU
		- /proc/ioports
			- Currently registered Input/Output port regions in use
		- /proc/dma
			- Lists the registered DMA(direct memory access) channels i nuse.
- Files inside the /sys directory have similar roles to those in /proc. 
	- /sys directory has the specific purpose of storing device information and kernel data related to hardware
	- /proc also contains information about various kernel data structures, including running processes and configuration
- /dev 
	- Every file inside /dev is associated with a system device, particularly storage devices.
	- A legacy IDE hard drive, for example, when connected to the motherboard’s first IDE channel, is represented by the file /dev/hda. 
	- Every partition in this disk will be identified by /dev/hda1, /dev/hda2 up to the last partition found
- Removable devices are handled by the udev subsystem
- which creates the corresponding devices in /dev.
- The Linux kernel captures the hardware detection event and passes it to the udev process, which then identifies the device and dynamically creates corresponding files in /dev, using pre-defined rules.
- In current Linux distributions, udev is responsible for the identification and configuration of the devices already present during machine power-up (coldplug detection)
- devices identified while the system is running (hotplug detection). Udev relies on SysFS, the pseudo filesystem for hardware related information mounted in /sys.

> [!important] HOTPLUG
> Hotplug is the term used to refer to the detection and configuration of a device while the system is running, such as when a USB device is inserted. The Linux kernel has supported hotplug features since version 2.6, allowing most system buses (PCI, USB, etc.) to trigger hotplug events when a device is connected or disconnected

- As new devices are detected, udev searches for a matching rule in the pre-defined rules stored in the directory /etc/udev/rules.d/.
- The most important rules are provided by the distribution, but new ones can be added for specific cases.

## Storage Devices

Linux storage devices are generically referred as block devices
 - Data is read to an from these devices in blocks of buffered data withe different sizes and positions
 - Every block device is identified by a file in the /dev directory
 - Name of the file depending on the device type (IDE, Sata, SCI, NVMe, etc.) and it's partitions.
 - CD and floppy device for example,
	 - a CD drive connected to the second IDE channel will be named as /dev/hdc.
	 - A Floppy drive will be name /dev/fd0, /dev/fd1, etc.
From Linux kernel version 2.4 onwards, most storage devices are now identified as if they were SCSI devices, regardless of their hardware type. IDE, SSD and USB block devices will be prefixed by sd
 - For IDE  disks, the sd prefix will be used, but the third letter will be chosen depending on whether the drive is a master or a slave (in the first IDE channel, master will be sda and slave will be sdb).
 - Partitions are listed numerically.
	 - Paths /dev/sda1, /dev/sda2, etc. are used for the first and second partitions of the block device identified first and /dev/sdb1, /dev/sbd2, etc. used to identify the first and second partitions of the block device identified second.
- The exception to this pattern occurs with memory cards (SD cards) and NVMe devices (SSD connected to the PCI Express bus).
	- SD cards the paths /dev/mmcblk0p1, /dev/mmcblk0p2, etc. are used for the first and second partitions of the device identified first and /dev/mmcblk1p1, /dev/mmcblk1p2, etc. used to identify the first and second partition of the device identified second.
	- NVMe receive the prefix nvme, as in /dev/nvme0n1p1 and /dev/nvme0n1p2.

### Guided Exercises
1. Suppose an operating system is unable to boot after adding a second SATA disk to the system. Knowing that all parts are not defective, what could be the possible cause for this error?  __The boot device order should be configured in the BIOS setup utility, otherwise the BIOS may not able to run the bootloader.__
2. Suppose you want to make sure the external video card connected to the PCI bus of your newly acquired desktop computer really is the one advertised by the manufacturer, but opening the computer case will void the warranty. What command could be used to list the details of the video card, as they were detected by the operating system? __Command lspci will list detailed information about all devices currently connected to the PCI bus.__ 
3. The following line is part of the output generated by command 
```Bash
$ lspci
03:00.0 RAID bus controller: LSI Logic / Symbios Logic MegaRAID SAS 2208 [Thunderbolt] (rev 05) 
```

\
	What command should you execute to identify the kernel module in use for this specific device? __The command lspci -s 03:00.0 -v or lspci -s 03:00.0 -k__ 
4. A system administrator wants to try different parameters for the bluetooth kernel module without rebooting the system. However, any attempt to unload the module with modprobe -r bluetooth results in the following error:
	```bash
	modprobe: FATAL: Module bluetooth is in use. 
```

	What is the possible cause for this error? __Module bluetooth is being used by a running process.__

### Explorational Exercises

1. It is not uncommon to find legacy machines in production environments, like when some equipment uses an outdated connection to communicate with the controlling computer, making it necessary to pay special attention to some peculiarities of these older machines. Some x86 servers with older BIOS firmwares, for example, will not boot if a keyboard is not detected. How this particular issue can be avoided?
> [!answer] 
>1. **Access BIOS/UEFI Settings**:
    >Power on the server and press the appropriate key (often `DEL`, `F1`, `F2`, or `Esc`) ?>during the initial boot screen to enter the BIOS setup.
>2. **Find the Halt on Error Setting**:
  >  
>    - Navigate through the BIOS menu. Look for a setting like "Halt on Error" or "Halt on >Keyboard Error." This is often found under the "Boot" or "Advanced" section of the >BIOS settings.
>3. **Disable Keyboard Check**:
>    
>    - Change the "Halt on Error" setting to "No Errors" or specifically >disable the >keyboard check. This will allow the machine to boot even if no >keyboard is detected.
>4. **Save and Exit**:
  >  
> Save the changes and exit the BIOS. The server should now boot without requiring
>a keyboard.
>
>This adjustment is common when dealing with headless servers (servers that are run >without peripherals like monitors or keyboards) in data centers or remote environments. 
