---
tags:
  - Linux
  - lpic
  - process
  - execution
  - priorities
  - modify
date: "09-25-2024"
---

# Processes

- OS able to run more than 1 process at the same time are called multi-processing systems
- Simultaneity only happens when more than one processing unit is available
- Even single processor systems can mimic simultaneity by switching between processses very quickly
- this technique is known as symmetric multi-processor(SMP) systems
- The number of potential concurrent processes greatly exceeds the number of available processor units

- Only one process at a time can control the CPU
  - most process activities are system calls
    - rujning process transfers CPU control and OS processes so it performs the requested operation
      - System calls are in charge of all inter divece communication
        - memory allocations, reading and writing on the filesystems, printing text on the scree, user interaction, network transfers, etc.
  - Transfering CPU control during a system call allows the OS to decide whether to return CPU control to the previous process or to hand it to another process
    - As modern CPUs can execute instructions much faster than most external hardware can communicate with each other, a new controlling process can do a lot of CPU work while previously requested hardware responses are still unavailable
    - To ensure maximum CPU harnessing, multi-processing operating systems keep a dynamic queue of active processes waiting for a CPU time slot.

- Although they allow to significantly improve CPU time utiliazation
  - Relying solely on system calls ot switch between processes is not enough to achieve satisfactory multi-tasking performance
  -  A process that makes no system calls could control the CPU indefininently.
  - This is why modern OS are also preemptive
    - a running process can be put back in the queue so a more important process can take control the CPU
      - Even if the unning process has not made a system call

## The Linux Scheduler

- Linux is a preemptive multi-processing OS
  - Implements a scheduler that organizes the process queue
  - The scheduler also decides which queued thread will be executed
    - a process can branch out many independent threads
  - Process and thread are interchangeable terms in this context
  - Every process has two predicates that intervene on its scheduling
  - The scheduling policy and the scheduling priority.
- Two main types of scheduling policies:
  - Real time policies
  - Normal policies
- Processes under a real-time opolicy are scheduled by their priority values directly
  - If a more important process becomes ready to run, a less important running process is preempted and the high priority process takes control of the CPU.
  - A lower priority process will gai nCPU control only if higher priority processes are idle or waiting for hardware respons.

- Any real-time process has higher priority than a normal process.
  - As a general purpose OS Linux runs just a few real-time processes.
  - Most processes, including system and user programs, run under normal scheduling policies
  -Normal processes usually have the same priority value, but the normal policies can define execution priority rules using another process predicate:
    - The nice value
  - to avoid confusion with the dynamic priorities derived from nice values scheduling priorities are usually called static scheduling priorities.

- Linux scheduler can be configured in many different ways and even more intricate ways of establishing priorites exists
  - These general concepts always apply
    - When inspecting and tuning process scheduling it is important to keep in mind that only processes under normal scheduling policy will be affected

## Reading Priorities

- Linux reserves static priorities ranging from 0 to 99 for real-time processes and normal processes are assigned to a static priorities ranging from 100 to 139
  - Meaning that there are 39 different priority levels for normal propcesses
    - Lower values mean higher priority
    - Static priority of an active process can be found in the sched file, located in its prespective directory inside the /proc filesystem
```bash
$ grep ^prio /proc/1/sched
prio          :       120
```

- As shown i nthe example the line beginning with prio gives the priority value to the process (the PID 1  process is the init or the systemd process, the first process the kernel starts during system initialization).
  - The standard priority for a normal processes is 120
  - That it can be decreased to 100 or increased to 139.
  - The priorities of all running process can be verified with the command ps -Al or ps -el:

![2024-09-25-at-08-46-39.png](2024-09-25-at-08-46-39.png)

- The PRI column indicates static priority assigned by the kernel
  - The priority value displayed by ps differs from that obtained in the previous example
    - Due to historical reasons, priorities displayed by ps range from -40 to 99 by default
      - so the actual priority is obtained by adding 40 to it (in patiular, 80+40=120)

- It is possible to continously monitor processes currently being managed by the Linux kernel with program top
  - As with ps, top also displays the priority value differently.
    - To make it easier to identify real-time processes, top subtracts the priority value by 100
      - Making all real-time priorities negative with a negative number or rt identifying them
      -  Normal priorities displayed by top range from 0 to 39

> [!note]
>To get more details from the ps command, additional options can be used.
>Compare the output from this command to the one from our previous example:

```bash
$ ps -e -o user,uid,comm,tty,pid,ppid,pri,pmem,pcpu --sort=-pcpu | head
```

## Process Niceness

- Every normal process begins with a default nice value of 0(priority 120)
  - The nice name comes from the idea that "nicer" processes allow other processes to run before them in paticular execution queue
  - Nice numbers range from -20 (less nice, high priority) to 19 (more nice, low priority.)
    - Linux also allows the ability to assign different nice vaolues to threads within the same process.
      - The NI column in ps output indicates the nice number.

- Only the root user can decrease the niceness of a process below zero.
  - It's possible to start a process with a non standard priority with the command nice.
    - By default nice changes the niceness to 10, but it can be specified with option -n:
```bash
$ nice -n 15 tar czf home_backup.tar.gz /home
```

- In this example, command tar is executed with a niceness of 15.
  - The command renice can be used to change the priority of a running process
    - the option -p indicates the PID number of the target process
```bash
# renice -10 -p 2164
2164 (process ID) old priority 0, new priority -10
```

- The options -g and -u are used to modify all the processes of a specific group or user
  - Renice +5 -g users the niceness of processes owned by users of the group users will be raised five

- The priority of a process can be modified with other programs, like the program top
  - On the top main screen, the niceness of a process can be modified by pressing r and then the PID number of the process:

![2024-09-25-at-08-56-10.png](2024-09-25-at-08-56-10.png)

![2024-09-25-at-08-56-28.png](2024-09-25-at-08-56-28.png)


- The message PID to renice [default pid = 1] appears with the first listed process selected.
  - To change the priority of another process
  - Type its PID and press enter
  - Then the message Renice PID 1 to value will appear (with the requested PID number) and a new nice value can be assigned

### Guided Exercises

1. In a preemptive multi-tasking system, what happens when a lower priority process is
occupying the processor and a higher priority process is queued to be executed?
__The lower priority process pauses and the higher priority process is executed instead.__

2. Consider the following top screen:

![2024-09-25-at-08-58-21.png](2024-09-25-at-08-58-21.png)

What PIDs have real-time priorities?
__PIDs 12 and 16.__

3. Consider the following ps -el listing:

![2024-09-25-at-08-59-01.png](2024-09-25-at-08-59-01.png)

![2024-09-25-at-08-59-15.png](2024-09-25-at-08-59-15.png)

Which PID has higher priority?
__PID 12.__

4. After trying to renice a process with renice, the following error happens:
```bash
$ renice -10 21704
renice: failed to set priority for 21704 (process ID): Permission denied
```
What is the probable cause for the error?
__Only user root can decrease nice numbers below zero.__


### Explorational Exercises

1. Changing process priorities is usually required when a process is occupying too much CPU
time. Using ps with standard options for printing all system processes in long format, what
--sort flag will sort processes by CPU utilization, increasing order?
```bash
$ ps -el --sort=pcpu
```

2. Command schedtool can set all CPU scheduling parameters Linux is capable of or display
information for given processes. How can it be used to display the scheduling parameters of
process 1750? Also, how can schedtool be used to change process 1750 to real-time with
priority -90 (as displayed by top)?

```bash
$ schedtool 1750

$ schedtool -R -p 89 1750
```


