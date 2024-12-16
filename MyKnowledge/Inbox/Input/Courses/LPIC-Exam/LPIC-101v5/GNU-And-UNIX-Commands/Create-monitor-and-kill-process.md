---
tags:
  - linux
  - monitor
  - processes
  - kill
  - manage
  - jobs
  - create
date: "09-27-2024"
---

# Key Knowledge Areas

    Run jobs in the foreground and background
        You can start processes in the foreground or background using commands like &, fg, and bg.

    Signal a program to continue running after logout
        This can be done using nohup or terminal multiplexers like screen and tmux.

    Monitor active processes
        Commands such as ps and top are invaluable for monitoring processes.

    Select and sort processes for display
        Utilize options within ps, top, and other process management commands to filter and sort processes.

    Send signals to processes
        Signals can be sent using kill, pkill, killall, and other related commands.

# Essential Commands and Concepts
## Starting Jobs and Job Control

    Foreground: By default, commands execute in the foreground.
    Background: Append & to a command to run it in the background:

$ sleep 60 &

## Suspending Jobs: Press Ctrl + Z to suspend a running foreground job.
## List Jobs: Use the jobs command to list all background and suspended jobs:

$ jobs
[1]+  Stopped                 sleep 60

Foreground (fg) and Background (bg): Bring a job to foreground or send it to the background:

    $ fg %1
    $ bg %1

Monitoring Processes

    ps Command: Reports snapshot information about active processes. Examples include:

$ ps aux
$ ps -ef

top Command: Provides a dynamic real-time view of the system's processes:

    $ top

        Customize display with keys: M (sort by memory), T (sort by time), P (sort by CPU).

Filtering and Sorting Processes

    Use ps options like --sort to sort based on different criteria:

    $ ps aux --sort=-%mem

    top interactive commands help in sorting as required:
        M for memory, P for CPU, etc.

Sending Signals to Processes

    kill Command: Sends a signal to a process:

$ kill -SIGTERM <pid>

pkill Command: Sends a signal to processes based on name and attributes:

$ pkill <name>

killall Command: Sends a signal to all processes with a specific name:

    $ killall <name>

Terminal Multiplexers

    screen and tmux are powerful tools to manage multiple terminal sessions.
        Sessions can be detached and kept running, allowing you to reattach later.
        GNU Screen:

$ screen
# To detach: Ctrl + A, then D
# To resume: screen -r

tmux:

        $ tmux
        # To detach: Ctrl + B, then D
        # To resume: tmux attach

Utilities for Process Management

    nohup: Run a command ignoring hangup signals, ensuring it continues to run after you log out:

    $ nohup <command> &

Summary and Practical Exercises

    Job Control:
        Start programs in the background using &.
        Suspend processes using Ctrl + Z.
        Manage jobs with jobs, fg, and bg.

    Process Monitoring:
        Regularly use ps and top to check active processes.
        Familiarize yourself with htop for a more interactive process viewer.

    Sending Signals:
        Learn the various signals (kill -l) and use kill, pkill, and killall to stop or control processes.

Mock Exercises

    Start a background job and monitor it:

$ sleep 300 &
$ jobs

Send a job to the foreground and then suspend it:

$ fg %1
# Press Ctrl + Z

Terminate a process by its name using pkill:

$ pkill sleep

Monitor system processes and resource usage:

$ top

Use screen or tmux to start a session, detach, and reattach:

    $ screen      # or tmux
    # Ctrl + A, then D (for screen) / Ctrl + B, then D (for tmux) to detach
    $ screen -r   # or tmux attach to reattach

By focusing on the commands and concepts highlighted and practicing the exercises provided, you will build competence in managing processes in Linux, which is crucial for passing the LPIC-1 certification exam.


# Introduction

In this lesson, we will explore the features of terminal multiplexers, specifically GNU Screen and tmux. Terminal multiplexers allow you to manage multiple terminal sessions from a single window and keep running processes active even if you disconnect.
Features of Terminal Multiplexers

## Terminal multiplexers provide numerous features, including:

    Multiple Sessions: Create and navigate between multiple terminal sessions within a single window.
    Session Persistence: Detach from a session while leaving processes running, allowing reattachment later.
    Window Management: Split terminals into multiple windows/panes.
    Multi-user Support: Share sessions among multiple users for collaborative work.

GNU Screen

GNU Screen is a terminal multiplexer that allows you to manage multiple terminal sessions. Here's how to use some of its features:
Starting a Screen Session

To start a new screen session:

$ screen

Detaching from a Session

You can detach from the session and leave it running in the background by pressing Ctrl + A, then D.
Reattaching to a Session

To list all available screen sessions:

$ screen -ls

To reattach to a session:

$ screen -r <session_id>

## tmux (Terminal Multiplexer)

tmux is another terminal multiplexer that offers similar features to GNU Screen but with more flexibility. Here are some commands to get you started:
Starting a tmux Session

To start a new tmux session:

$ tmux

Detaching from a Session

Detach from the session by pressing Ctrl + B, then D.
Managing Windows and Panes

    Create New Window: Press Ctrl + B, then C.
    Split Window Vertically: Press Ctrl + B, then %.
    Split Window Horizontally: Press Ctrl + B, then ".

Reattaching to a Session

To list all available tmux sessions:

$ tmux list-sessions

To reattach to a session:

$ tmux attach-session -t <session_name>

Guided Exercises

    Start a tmux session and create multiple windows and panes. Experiment with navigating between them.

    Detach from the session using Ctrl + B, then D. List the available sessions using tmux list-sessions.

    Reattach to the session using tmux attach-session -t <session_name> and check if your windows and panes are intact.

    Start a screen session, detach using Ctrl + A, then D. List available sessions using screen -ls.

    Reattach to the screen session using screen -r <session_id>.

Explorational Exercises

    Collaborative Session: Use tmux to create a session and share it with another user. Experiment with collaborative editing and session management.

    Custom Configurations: Modify the ~/.tmux.conf file to customize the tmux settings, such as key bindings and default behavior.

Summary

    GNU Screen and tmux are terminal multiplexers that help manage multiple terminal sessions and ensure session persistence.
    Detach and reattach sessions using simple commands to maintain long-running processes.
    Explore features like window management and multi-user support for enhanced productivity.

Answers to Guided Exercises

    Session Commands: You should be able to start, detach, and reattach sessions using the given commands.

