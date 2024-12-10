
# PROCESS is an instance of a running program
#   * when we run ls command - a short lived process is created that displays a directories content
#   * every process in Linux is assigned a unique Process ID (PID).

ps                                   # list currently running processes in the current terminal session
ps aux                               # list all processes running on the system
top                                  # display dynamic real-time information about running processes
htop                                 # more user-friendly, interactive process viewer (needs to be installed)
pstree                               # display processes in a tree-like format showing parent-child relationships
nice                                 # run command with modified scheduling priority
renice                               # alter priority of running processes
kill                                 # terminate a process by its PID (graceful termination, sends SIGTERM)
killall                              # terminate all processes by name
pkill                                # kill processes matching a pattern (by name or attribute)
iotop                                # monitor disk I/O usage by processes
strace -p [PID]                      # trace system calls and signals of a specific process
lsof -p [PID]                        # list open files associated with a process
free -h                              # display available memory and swap usage
df -h                                # display disk usage
pidof [process_name]                 # find process ID of running process


ps                                   # list processes i am owner of
ps -e                                # all processes (same as 'ps aux')
ps -o                                # choose columns to output
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu # output chosen columns and sort the processes by cpu
ps -u username                       # processes owned by a specific user
ps -ef | grep process_name           # find a specific process by name
ps PID                               # shows process with specific PID
ps -e -o pid, args --forest          # show graphical view of processes tree
ps aux                               # list all processess in user oriented format
#   - USER - owner of the process
# 	- PID - process ID (identification)
# 	- CMD - exact command including options to start the process; processess in [ ] brackets are kernel processess
# /proc/[PID] - numerical subdirectory for each running process
# /proc/[PID]/fd - contains one entry for each file that the process have open

# values between -20 to 90 - the lower the number the higher priority
# only root can assign negative values
nice -n 10 command                       # run a command with a nice value of 10 (lower priority)

renice 15 -p [pid]                       # change the priority of a process with the specified PID to 15
renice -n -5 -p [pid]                    # increase the priority of a process

kill [pid]                               # terminate a process with specified PID
kill -9 [pid]                            # forcefully kill a process with the specified PID

killall [process_name]                   # terminate all processes with the specified name
killall -9 [process_name]                # forcefully kill a process (SIGKILL)

# background processes
command &                           # run a command in the background.
jobs                                # list processes running in the background
fg [pid]                            # bring a background job to the foreground
bg [pid]                            # move a stopped job to the background
kill [pid]                          # kill a background job using its job number

# process states:
# R  - Running: process is actively running or ready to run
# S  - Sleeping: process is waiting for an event (e.g., waiting for user input)
# D  - Uninterruptible Sleep: process is waiting for I/O operations (cannot be interrupted).
# Z  - Zombie: process has completed but is waiting for its parent process to acknowledge termination.
# T  - Stopped: process has been stopped, usually by a signal or from a terminal (e.g., using Ctrl+Z)
