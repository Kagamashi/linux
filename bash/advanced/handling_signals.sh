#!/bin/bash

# Handling signals with trap
# Syntax: trap 'commands' SIGNAL

# Trap SIGINT (Ctrl+C) and SIGTERM (termination) signals
trap 'echo "Caught SIGINT (Ctrl+C). Exiting..."; exit' SIGINT
trap 'echo "Caught SIGTERM. Exiting..."; exit' SIGTERM

# Trap EXIT signal (this is called when the script exits)
trap 'echo "Script is exiting..."' EXIT

# Simulate a long-running process
echo "The script is running. Press Ctrl+C to stop or wait for 10 seconds."
sleep 10

# When the script completes, the EXIT trap will be triggered
echo "Script completed successfully."
