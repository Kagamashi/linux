kill # Send a signal to a process
killall # Kill processes by name
nice # Run a command with modified scheduling priority
renice # Alter priority of running processes


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
