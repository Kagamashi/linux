#!/bin/bash

# PROCESS is an instance of a running program, for example:
# When we for example run ls command - a short lived process is created that displays a directories content
# Every process in Linux is assigned a unique Process ID (PID).

# Viewing Processes
ps                                   # List currently running processes in the current terminal session.
ps aux                               # List all processes running on the system.
top                                  # Display dynamic real-time information about running processes.
htop                                 # More user-friendly, interactive process viewer (needs to be installed).

# Basic Process Information with ps
# PS command columns:
# 	- USER - under which user 
# 	- PID - process ID (identification)
# 	- %CPU - how much % of CPU is used by this process
# 	- %MEM 
# 	- START - when the process was started
# COMMAND - exact command including options to start the process; processess in [ ] brackets are kernel processess
ps -e                                # Display all processes.
ps -u username                       # Show processes owned by a specific user.
ps -ef | grep process_name           # Find a specific process by name.
ps -U USER      # Shows process started by exact USER
ps PID      # Shows process with exact PID
ps aux  # List all processess in user oriented format

# Process Hierarchy and Parent-Child Relationship
pstree                               # Display processes in a tree-like format showing parent-child relationships.

# Managing Processes
kill <PID>                           # Terminate a process by its PID (graceful termination, sends SIGTERM).
kill -9 <PID>                        # Forcefully kill a process (SIGKILL).
killall process_name                 # Terminate all processes by name.
pkill process_name                   # Kill processes matching a pattern (by name or attribute).
nice                                     # Run a command with modified scheduling priority
renice                                   # Alter priority of running processes

# kill – Send a signal to a process
kill <pid>                               # Terminate a process with the specified PID
kill -9 <pid>                            # Forcefully kill a process with the specified PID

# killall – Kill processes by name
killall <process_name>                   # Terminate all processes with the specified name
killall -9 <process_name>                # Forcefully kill all processes with the specified name

# Process niceness - how nice a process is to other processes
# Values between -20 to 19 - the lower the number the less nice the process is.
nice -n 10 command                        # Run a command with a nice value of 10 (lower priority)

# renice – Alter priority of running processes
renice 15 -p <pid>                       # Change the priority of a process with the specified PID to 15
renice -n -5 -p <pid>                    # Increase the priority of a process (lowering the nice value)


# Monitoring Processes
top                                  # Monitor processes in real-time (press "q" to exit).
htop                                 # Similar to top, but more interactive and detailed.
iotop                                # Monitor disk I/O usage by processes.
strace -p <PID>                      # Trace system calls and signals of a specific process.
lsof -p <PID>                        # List open files associated with a process.

# Background and Foreground Processes
command &                            # Run a command in the background.
jobs                                 # List background jobs running in the current shell.
fg %job_id                           # Bring a background job to the foreground.
bg %job_id                           # Move a stopped job to the background.
kill %job_id                         # Kill a background job using its job number.

# Process Prioritization (Nice and Renice)
nice -n 10 command                   # Run a command with a lower priority (default is 0, higher values reduce priority).
renice 15 -p <PID>                   # Change the priority of an existing process.

# ----------------------
# PROCESS STATES
# ----------------------

# Common Process States:
# R  - Running: Process is actively running or ready to run.
# S  - Sleeping: Process is waiting for an event (e.g., waiting for user input).
# D  - Uninterruptible Sleep: Process is waiting for I/O operations (cannot be interrupted).
# Z  - Zombie: Process has completed but is waiting for its parent process to acknowledge termination.
# T  - Stopped: Process has been stopped, usually by a signal or from a terminal (e.g., using Ctrl+Z).

# Checking Process State
ps -eo pid,stat,comm                 # List all processes with their PID, state, and command.

# ----------------------
# SYSTEM LOAD & PERFORMANCE
# ----------------------

uptime                               # Check how long the system has been running and the load averages.
top                                  # Check CPU and memory usage by processes.
free -h                              # Display available memory and swap usage.
df -h                                # Display disk usage.

# pidof – Find the process ID of a running program
pidof <process_name>                     # Get the PID of a specified running process
