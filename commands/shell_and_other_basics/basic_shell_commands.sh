#!/bin/bash

echo                                    # Display a line of text
date                                    # Display or set the system date and time
history                                 # Show command history
alias                                   # Create a shortcut to another command
clear                                   # Clear the terminal screen

# echo – Display a line of text
echo "Hello, World!"                   # Print "Hello, World!" to the terminal
echo "Current date and time: $(date)"  # Print current date and time

# date – Display or set the system date and time
date                                    # Show the current date and time
date "+%Y-%m-%d %H:%M:%S"              # Display date in a custom format
date -s "2024-01-01 12:00:00"          # Set the system date and time (requires sudo)

# history – Show command history
history                                 # Show the command history list
history | grep <search_term>            # Search the command history for a specific term
history -c                              # Clear the command history

# alias – Create a shortcut to another command
alias ll='ls -la'                      # Create an alias for 'ls -la'
alias rm='rm -i'                       # Create an alias for 'rm' to prompt before deleting

# clear – Clear the terminal screen
clear                                   # Clear the terminal screen
