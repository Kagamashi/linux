#!/bin/bash

# Running a command in the background using &
# This starts the sleep command in the background
echo "Starting a background process..."
sleep 10 &
echo "Background process started with PID: $!"

# Process IDs and job control
# Listing all background jobs
jobs

# Bringing the background job to the foreground using fg
# (Uncomment the line below to bring the background job to the foreground)
# fg %1  # %1 refers to the first job in the list (job number may vary)

# Sending a process back to the background using bg
# (Uncomment the line below to send the process back to the background)
# bg %1  # Sends job number 1 to the background

# Process substitution using <(command)
# This allows the output of a command to be used as if it were a file
echo "Comparing two commands using process substitution:"
diff <(ls /bin) <(ls /usr/bin)

# Additional examples
# Run multiple commands in the background
echo "Running multiple background processes..."
sleep 5 &
sleep 6 &
sleep 7 &

# Checking running jobs
jobs
