---
tags: linux run-levels boot-targets boot configuring systmd SysV upstart systemctl runlevel units service target
date: 09-18-2024
---

A common feature of OS systems following Unix design principles is the employment of separate processes to control distinct functions of the system.  These are called *daemons*(or, more generally, services), are also responsible for extended features underlying the OS.  Networking application services (HTTP server, file sharing, email, etc), databases, on-demand configs, etc.  Linux utilizes a monolithic kernel, many low level aspects of the OS are affected by daemons, like load balancing and firewall config.

Which daemons should be active depends on the purpose of the system.  The set of active daemons should be modifiable at runtime, so services can be started and stopped without having to reboot.  To address this issue, every major Linux distro offers some type of service management utility.

Services can be controlled by shell scripts or by a program and its supporting config files.  The first method is implemented by the SysVinit standard (SystemV or just SysV).  The second methos is implemented by systemd and Upstart.  Historically SysV based service managers were the most used by Linux distros.  Today, systemd based service managers are more often found in most Linux distros.  The service manager is the first program launched by the kernel during the boot process, so its PID (Process Identification Number) is always 1.

# SysVinit

Service Managers based on the SysVinit standard will provide predefined sets of system states called *runlevels*, and their corresponding service script files to be executed.  Runlevels are numbered 0 to 6, being generally assigned the following purposes:

- Runlevel 0
	- system shutdown.
- Runlevel 1, s or single
	- Single user mode, without network and other non-essential capabilities (maintenance mode).
- Runlevel 2, 3 or 4
	- Multi-user mode.  Users can log in by console or network.  Runlevels 2 and 4 are not often used
- Runlevel 5
	- Multi-user mode.  It is equivalent to 3, plus the graphical mode login.
- Runlevel 6
	- System restart.

> [!important] 
> The program responsible for managing runlevels and associated daemons/resources is /sbin/init.  During system initialization, the init program identifies the requested runlevel, defined by the kernel parameter or in the /etc/inittab file, and loads the associated scripts listed there for the given runlevel.  Every runlevel may have many associateed service files, usually scripts in the /etc/init.d/ directory.  As not all runlevels are equivalent through different Linux distributions, a short description of the runlevel's purpose can also be found in SysV based distributions.

- The syntax of the /etc/inittab file uses this format:
```bash
id:runlevels:action:process
```

- The id is a generic name up to four characters used to identify the entry.  
- The runlevels entry isa  list of runlevel numbers for which a specified action should be executed
- The action term defines how init will execute the process indicated by the term process
- Available actions are
	- boot
		- The process will be executed during system initialization.  field runlevels is ignored
	- bootwait
		- The process will be executed during system initialization and init will wait until it finishes to continue.  Field runlevels is ignored.
	- sysinit
		- The process will be executed after system initialization, regardless of runlevel.  Field runlevels is ignored
	- wait
		- The process will be executed for the given runlevels and init will wait until it finishes to continue.
	- respawn
		- The process will be restarted if it is terminated.
	- ctrlaltdel
		- The process will be executed when the init process receives the SIGINT signal, triggered when the key sequence of Ctrl+Alt+Del is pressed.

> [!important] 
> The default runlevel — the one that will be chosen if no other is given as a kernel parameter — is also defined in /etc/inittab, in the entry id:x:initdefault. The x is the number of the default runlevel. This number should never be 0 or 6, given that it would cause the system to shutdown or restart as soon as it finishes the boot process. A typical /etc/inittab file is shown below:

```bash
# Default runlevel
id:3:initdefault:

# Configuration script executed during boot si::sysinit:/etc/init.d/rcS

# Action taken on runlevel S (single user)
~:S:wait:/sbin/sulogin 

# Configuration for each execution level 
l0:0:wait:/etc/init.d/rc 0 
l1:1:wait:/etc/init.d/rc 1 
l2:2:wait:/etc/init.d/rc 2
l3:3:wait:/etc/init.d/rc 3 
l4:4:wait:/etc/init.d/rc 4 
l5:5:wait:/etc/init.d/rc 5 
l6:6:wait:/etc/init.d/rc 6 

# Action taken upon ctrl+alt+del keystroke
ca::ctrlaltdel:/sbin/shutdown -r now 

# Enable consoles for runlevels 2 and 3
1:23:respawn:/sbin/getty tty1 VC linux
2:23:respawn:/sbin/getty tty2 VC linux
3:23:respawn:/sbin/getty tty3 VC linux
4:23:respawn:/sbin/getty tty4 VC linux 

# For runlevel 3, also enable serial 
# terminals ttyS0 and ttyS1 (modem) consoles
S0:3:respawn:/sbin/getty -L 9600 ttyS0 vt320 S1:3:respawn:/sbin/mgetty -x0 -D ttyS1

```

- The telinit q command should be executed every time after the /etc/inittab file is modified.
	- the argument q (or Q) tells init to reload its config.
	- This is important to avoid a system halt due to an incorrect config in /etc/inittab.
- The scripts used by init to setup each runlevel are stored in the directory /etc/init.d/
- Every runlevel has its own directory in /etc/, named
	- /etc/rc0.d/
	- /etc/rc1.d/
	- /etc/rc2.d/
	- and so on
		- That has scripts that should be executed when the corresponding runlevel starts
		- The same script can be used by different runlevels, the files in those directories are just symbolic links to the actual scripts in /etc/init.d/
		- A links file name in a runlevel directory will start with a
			- K which determines it will be killed when entering the runlevel
			- S which determines it will be started when entering the runlevel.
- The directory /etc/rc1.d/, for example, will have many links to network scripts beginning with letter K.
	- Because runlevel 1 is the single user runlevel, without network connectivity.

- The command runlevel shows the current runlevel for the system
	- The runlevel command shows two values, first the previous run level and the second is the current run level

```bash
$runlevel
N 3
```

- The letter N in the output shows the runlevel has not changed since the last boot.
- the current runlevel is runlevel 3

- The init program can be used to alternate between runlevels on a running system, without the need to reboot.
	- telinit can also be used to alternate between runlevels
		- telinit 1, telinit s or telinit S will change the system to runlevel 1

# Systemd

Systemd is the most widely used set of tools to manage system resources and services, which are referred to as units by systemd.  A unit has a name, type, and corresponding config file.
- The unit for httpd server process (like the Apache web server)
	- will be httpd.service on Red Hat based distributions
	- The config file will also be called httpd.service(on Debian based distributions this unit is named apach2.service).

- There are Seven distinct types of units:
	1. service
		- The most common unit type, for active system resources that can be initiated, interrupted and reloaded.
	2. socket
		- The socket unit type can be a filesystem socket or a network socket
		- All socket units have a corresponding service unit, loaded when the socket receives a request
	3. device
		- A device unit is associated with a hardware device, identified by the kernel
		- A device will only be taken as a systemd unit if a udev rule for this purpose exists.
		- A device unit can be used to resolve config dependencies when certain hardware is detected, given that properties from the udev rule can be used as parameters for the device unit.
	4. mount
		- A mount unit is a mount point definition in the filesystem, similar to an entry in /etc/fstab
	5. automount
		- An automount unit is also to a mount point definition in the filesystem
		- It is mounted automatically
		- Every automount unit has a corresponding mount unit, which is initiated when the automount mount point is accessed.
	6. target
		- A target unit is a grouping of other units, managed as a single unit.
	7. snapshot
		- A snapshot unit is a saved state of the systemd manager (not available on every Linux distrobution)

- The main command for controlling systemd units is systemctl.
- systemctl is used to execute all tasks regarding unit activation, deactivation, execution, interruption, monitoring, etc.
- For example if we had a unit called unit.service the most common systemctl actions would be:
	- systemctl start unit.service
		- Starts unit
	- systemctl stop unit.service
		- Stops unit
	- systemctl restart unit.service
		- Restarts unit
	- systemctl status unit.service
		- Shows the state of the unit, including if it is running or not
	- systemctl is-active unit.service
		- Shows active if unit is running or inactive otherwise
	- systemctl enable unit.service
		- Enables unit, that is, unit will load during system initialization
	- systemctl disable unit.service
		- unit will not start with system
	- systemctl is-enabled unit.service
		- Verifies if unit starts with the system. The answer is stored in the variable $?. The value 0 indicates that unit starts with the system and the value 1 indicates that unit does not starts with the system.

> [!note] 
> Newer installations of systemd will actually list a unit’s configuration for boot time. For example:
```bash
$ systemctl is-enabled apparmor.service
enabled
```

- If no other units with the same name exist in the system, then the suffix after the dot can be dropped. 
	- there is only one httpd unit of type service
	- then systemctl status httpd
		- Would work just fine
- The systemctl command can also control system targets
	- The multi-user.target unit, for example, combines all units required by the multi-user system environment
	- Similar to runlevel 3 in a system using SysV
- Command systemctl isolate alternates between different targets. So, to manually alternate to target multi-user:
```bash
# systemctl isolate multi-user.target
```

- In SysV there are corresponding targets to runlevels, starting with runlevel0.target up to runlevel6.target.
- systemd does not use the /etc/inittab file.
	- To change the default system target, the option systemd.unit can be added to the kernel parameters list.
		- To use multi-user.target as the standard target, the kernel parameter should be systemd.unit=multi-user.target.
		- All kernel parameters can be made persistent by changing the bootloader config
	- Another way to change the default target is to modify the symbolic link /etc/systemd/system/default.target so it points to the desired target.
	- The redefinition of the link can be done with systemctl command itself
```bash
# systemctl set-default multi-user.target
```

- You can determine what your system's default boot target is with the following command:
```bash
$ systemctl get-default
graphical.target
```

- Similar to systems using SysV, the default target should never point to shutdown.target

- Config files associated with every unit can be found in /lib/systemd/system/ directory
- Command systemctl list-unit-files lists all available units and shows if they are enabled to start when the system boots.
	- The option --type will select only the units for a given type
	- systemctl list-unit-files --type=service

- Acitve units or units that have been active during the current system session can be listed with
	- systemctl list-units
- systemctl list-units command can also use the --type=service option.

- systemd also triggers and responds to power related events.
- systemctl suspend command will put the system in a low power mode, keeping current data in memory.
- systemctl hibernate will copy all memory data to disk, so the current state of the system can be recovered after powering it off.
- The actions associated with such events are defined in the file /etc/systemd/logind.conf or in separate files inside the directory /etc/systemd/logind.conf.d/
	- This feature can only be used when there is no other power manager running in the system, like the acpid daemon.
	- the acpid daemon is the main power manager for Linux and llows finer adjustments to the actions following power related events, like closing the laptop lid, low battery or battery charging levels.

# Upstart

The initialization scripts used by Upstart are located in the directory /etc/init/.  System services can be listed with command initctl list, which also shows the current state of the services and, if available, their PID number.

```bash
# initctl list
avahi-cups-reload stop/waiting
avahi-daemon start/running, process 1123
mountall-net stop/waiting
mountnfs-bootclean.sh start/running
nmbd start/running, process 3085
passwd stop/waiting
rc stop/waiting
rsyslog start/running, process 1095
tty4 start/running, process 1761
udev start/running, process 1073
upstart-udev-bridge start/running, process 1066
console-setup stop/waiting
irqbalance start/running, process 1842
plymouth-log stop/waiting
smbd start/running, process 1457
tty5 start/running, process 1764
failsafe stop/waiting
```

- Every Upstart action has its own independent command
- Example, command start can be used to initiate a sixth virtual terminal:
```bash
# start tty6
```
- The current state of resource can be verified with the command status:
```bash
# status tty6 
tty6 start/running, process 3282
```
- And the interruption of a service is done with the command stop:
```bash
# stop tty6
```

- Upstart does not use the /etc/inittab file to define runlevels, but the legacy commands runlevel and telinit can still be used to verify and alternate between runlevels.

> [!note] 
> Upstart was developed for the Ubuntu Linux distribution to help facilitate parallel startup of processes. Ubuntu has stopped using Upstart since 2015 when it switched from Upstart to systemd.

## Shutdown and Restart

A very traditional command used to shutdown or restart the system is unsurprisingly called shutdown. The shutdown command adds extra functions to the power off process: it automatically notifies all logged-in users with a warning message in their shell sessions and new logins are prevented. Command shutdown acts as an intermediary to SysV or systemd procedures, that is, it executes the requested action by calling the corresponding action in the services manager adopted by the system.

After shutdown is executed, all processes receive the SIGTERM signal, followed by the SIGKILL signal, then the system shuts down or changes its runlevel. By default, when neither options -h or -r are used, the system alternates to runlevel 1, that is, the single user mode. To change the default options for shutdown, the command should be executed with the following syntax:

```bash
$ shutdown [option] time [message]
```

- Only the parameter time is required. The time parameter defines when the requested action will be executed, accepting the following formats
- hh:mm
	- This format specifies the execution time as hour and minutes.
- +m
	- This format specifies how many minutes to wait before execution.
- now or +0
	- This format determines immediate execution.
- The message parameter is the warning text sent to all terminal sessions of logged-in users.

- The SysV implementation allows for the limiting of users that will be able to restart the machine by pressing Ctrl + Alt + Del
	- This is possible by placing option -a for the shutdown command present at the line regarding ctrlaltdel in the /etc/inittab file
	- By doing this, only users whose usernames are in the /etc/shutdown.allow file will be able to restart the system
- The systemctl command can also be used to turn off or to restart the machine in systems employing systemd
	-  To restart the system, the command systemctl reboot should be used.
	- To turn off the system, the command systemctl poweroff should be used.
	- Both commands require root privileges to run, as ordinary users can not perform such procedures.
- Some Linux distributions will link poweroff and reboot to systemctl as individual commands. For example:

> [!note] 
> ```bash
> $ sudo which poweroff
> /usr/sbin/poweroff 
> $ sudo ls -l /usr/sbin/poweroff
>  lrwxrwxrwx 1 root root 14 Aug 20 07:50 /usr/sbin/poweroff -> /bin/systemctl
> ```

- Not all maintenance activities require the system to be turned off or restarted
- When it is necessary to change the system's state to single-user mode, it is important to warn logged-in users so that they are not harmed by an abrupt termination of their activities.

- Similar to what the shutdown command does when powering off or restarting the system, the wall command is able to send a message to terminal sessions of all logged-in users. To do so, the system administrator only needs to provide a file or directly write the message as a parameter to command wall.

### Guided Exercises

1. How could the telinit command be used to reboot the system? __The command telinit 6 will alternate to runlevel 6, that is, reboot the system.__
2. What will happen to the services related to the file /etc/rc1.d/K90network when the system enters runlevel 1? __Due to the letter K in the beginning of the file name, the related services will be stopped.__ 
3. Using command systemctl, how could a user verify if the unit sshd.service is running? __With the command systemctl status sshd.service or systemctl is-active sshd.service.__
4. In a systemd based system, what command must be executed to enable activation of the unit sshd.service during system initialization? __Command systemctl enable sshd.service, executed by root.__
### Explorational Exercises

1. In a SysV based system, suppose the default runlevel defined in /etc/inittab is 3, but the system always starts in runlevel 1. What is the probable cause for that? __The parameters 1 or S may be present in the kernel’s parameter list.__
2. Although file /sbin/init can be found in systemd based systems, it is only a symbolic link to another executable file. In such systems, what is the file pointed by /sbin/init? __The main systemd binary: /lib/systemd/systemd.__ 
3. How can the default system target be verified in a systemd based system? __The symbolic link /etc/systemd/system/default.target will point to the unit file defined as the default target. Command systemctl get-default can also be used.__
4. How can a system reboot scheduled with the shutdown command be canceled? __The command shutdown -c should be used.__
