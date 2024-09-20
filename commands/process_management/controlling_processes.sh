#!/bin/bash

kill                                     # Send a signal to a process
killall                                  # Kill processes by name
nice                                     # Run a command with modified scheduling priority
renice                                   # Alter priority of running processes

# kill – Send a signal to a process
kill <pid>                               # Terminate a process with the specified PID
kill -9 <pid>                            # Forcefully kill a process with the specified PID

# killall – Kill processes by name
killall <process_name>                   # Terminate all processes with the specified name
killall -9 <process_name>                # Forcefully kill all processes with the specified name

# nice – Run a command with modified scheduling priority
nice -n 10 command                        # Run a command with a nice value of 10 (lower priority)

# renice – Alter priority of running processes
renice 15 -p <pid>                       # Change the priority of a process with the specified PID to 15
renice -n -5 -p <pid>                    # Increase the priority of a process (lowering the nice value)
