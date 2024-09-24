#!/bin/bash

# Reading a file line by line using while read
# Assume "sample.txt" contains a few lines of text

echo "Reading file line by line:"
while IFS= read -r line; do
    echo "Line: $line"
done < sample.txt

# Working with file descriptors
# File descriptor 0: stdin
# File descriptor 1: stdout
# File descriptor 2: stderr

# Redirecting stdout and stderr to a file
exec 1>output.log 2>error.log

echo "This message will be written to output.log"
ls non_existing_file  # This will write an error to error.log

# Opening and closing file descriptors
# Opening a file descriptor for a specific file

exec 3>custom_output.txt  # Open file descriptor 3 for writing to custom_output.txt

echo "This message is written using file descriptor 3" >&3

exec 3>&-  # Close file descriptor 3

# Checking if the file descriptor is closed
if ! [ -e /proc/self/fd/3 ]; then
    echo "File descriptor 3 is closed."
fi

# Reverting stdout and stderr to the terminal
exec 1>&2
echo "Output and errors are now directed back to the terminal."
