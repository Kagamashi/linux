ps # Report process status
top # Display Linux tasks
htop # Interactive process viewer
pidof # Find the process ID of a running program


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