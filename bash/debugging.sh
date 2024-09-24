#!/bin/bash

# Debugging with set -x and set +x
# set -x enables debugging (prints each command before executing it)
# set +x disables debugging

echo "Starting script..."

set -x  # Enable debugging
num1=5
num2=10
sum=$((num1 + num2))
echo "Sum: $sum"

set +x  # Disable debugging
echo "Script execution continues without debugging..."

# Error handling using $? for exit status
# $? contains the exit status of the last command executed (0 = success, non-zero = error)

ls non_existing_file
if [ $? -ne 0 ]; then
    echo "The last command failed with a non-zero exit status."
fi

# Example of checking a successful command
ls .
if [ $? -eq 0 ]; then
    echo "The last command was successful."
fi

# Trap command for catching signals
# trap 'commands' SIGNAL
# Common signals:
# - SIGINT (2): Interrupt (Ctrl+C)
# - SIGTERM (15): Termination
# - EXIT: Triggered when the script exits

trap 'echo "Caught SIGINT (Ctrl+C). Exiting..."; exit' SIGINT
trap 'echo "Script terminated"; exit' SIGTERM

echo "Press Ctrl+C to trigger SIGINT, or wait for 10 seconds to exit..."
sleep 10  # Waiting for 10 seconds to allow signal catching

echo "Script completed successfully."
