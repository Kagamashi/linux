#!/bin/bash

# Using pipes and redirection
# |, >, >>, <, 2>, /dev/null

# | – Pipe: Pass the output of one command as input to another
ls -l /var/log | grep "syslog"          # List the contents of /var/log and search for "syslog" using grep
cat file.txt | wc -l                    # Count the number of lines in file.txt

# > – Redirect: Overwrite the output of a command to a file
echo "Hello, World!" > hello.txt        # Write "Hello, World!" to hello.txt (overwrite if it exists)
ls -l /var/log > logfiles.txt           # Save the output of ls to logfiles.txt (overwrite the file)

# >> – Redirect: Append the output of a command to a file
echo "Another line" >> hello.txt        # Append "Another line" to hello.txt without overwriting
ls -l >> directory_listing.txt          # Append the directory listing to directory_listing.txt

# < – Input Redirection: Use a file as input to a command
sort < unsorted.txt                     # Sort the contents of unsorted.txt and display the sorted output
grep "pattern" < file.txt               # Use file.txt as input to grep to search for "pattern"

# 2> – Redirect Standard Error: Redirect error output to a file
ls non_existent_file 2> error_log.txt   # Redirect error messages from ls to error_log.txt

# /dev/null – Discard Output: Suppress unwanted output
ls non_existent_file 2> /dev/null       # Suppress error messages by redirecting them to /dev/null
find / -name "*.log" > /dev/null        # Discard the output of find command (useful for long-running commands)
