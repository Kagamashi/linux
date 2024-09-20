#!/bin/bash

ps                                       # Report process status
top                                      # Display Linux tasks
htop                                     # Interactive process viewer
pidof                                    # Find the process ID of a running program

# ps – Report process status
ps                                        # Display current processes for the user
ps aux                                    # Display detailed information about all running processes
ps -ef                                     # Show all processes in full format

# top – Display Linux tasks
top                                       # Display real-time system processes
top -u <username>                         # Show processes for a specific user

# htop – Interactive process viewer
# To use htop, simply run the command:
# htop
# (You may need to install htop using your package manager if it's not already installed.)

# pidof – Find the process ID of a running program
pidof <process_name>                     # Get the PID of a specified running process
