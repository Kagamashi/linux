#!/bin/bash

# Standard Input (stdin), Output (stdout), and Error (stderr)
stdin  - File descriptor 0 (used for input)
stdout - File descriptor 1 (used for output)
stderr - File descriptor 2 (used for error messages)

# By default, stdin is the keyboard, stdout is the terminal, and stderr is also the terminal.
# We'll demonstrate redirection of these streams below.

# Redirection
>  - Redirect stdout to a file (overwrite)
>> - Redirect stdout to a file (append)
<  - Redirect stdin from a file
2> - Redirect stderr to a file
2>&1 - Redirect stderr to stdout (combine output and error streams)

echo "This will be written to a file" > output.txt
echo "This will be appended" >> output.txt

# Redirecting stderr
ls non_existing_file 2> error.log

# Combining stdout and stderr into one file
ls non_existing_file > all_output.log 2>&1

# Piping
# Pipes are used to send the output of one command as input to another.
echo "This is a list of files:" | cat -n

# Command Substitution
# Command substitution allows the output of a command to be used as a value in a script.
current_date=$(date)
echo "Current date and time: $current_date"

# Backticks `` can also be used for command substitution (older syntax):
current_user=`whoami`
echo "Current user: $current_user"

# Reading User Input
# The 'read' command is used to capture user input.

echo "Enter your name:"
read user_name
echo "Hello, $user_name!"
