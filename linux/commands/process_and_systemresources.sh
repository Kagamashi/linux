#!/bin/bash

# Viewing processes and system resources
# ps, top, htop, nice, renice, kill

# ps – Report a Snapshot of Current Processes
ps aux                                # Show all running processes in detail (user, CPU, memory usage, etc.)
ps -ef                                # Display processes in full format (UID, PID, PPID, etc.)
ps -u username                        # Show processes for a specific user
ps -p PID                             # Display detailed information about a specific process by PID

# top – Display Real-Time System Process Information
top                                   # Start the top utility to monitor processes in real-time
top -u username                       # Show only processes for a specific user
top -n 1                              # Display only one iteration of process list (useful in scripts)

# htop – Interactive Process Viewer (Improved top)
htop                                  # Start htop (must be installed) for an enhanced real-time view of system processes
htop -u username                      # Show processes for a specific user in htop
htop -p PID                           # Show details for a specific process by PID

# nice – Run a Program with a Modified Scheduling Priority
nice -n 10 command                    # Run a command with a nice value of 10 (lower priority)
nice -n -5 command                    # Run a command with a higher priority (negative nice value)

# renice – Change the Priority of a Running Process
renice 10 -p PID                      # Change the nice value of a process to 10 by specifying its PID
renice -5 -u username                 # Change the nice value of all processes for a specific user to -5

# kill – Terminate Processes by PID
kill PID                              # Send the default SIGTERM (15) signal to a process by PID
kill -9 PID                           # Forcefully terminate a process using SIGKILL (9)
killall process_name                  # Kill all processes with a specific name
kill -HUP PID                         # Send the SIGHUP signal to restart a process without terminating it
