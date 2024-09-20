#!/bin/bash

grep # Search for patterns in files

# grep – Search for patterns in files
# -i   – Ignore case distinctions in both the pattern and the input files.
# -v   – Invert the match, showing lines that do not match the pattern.
# -r   – Recursively search directories for the pattern.
# -n   – Show line numbers with output lines.
# -l   – Print only the names of files with matching lines, once for each file.

grep 'pattern' file.txt                         # Search for 'pattern' in file.txt
grep -i 'pattern' file.txt                      # Case-insensitive search for 'pattern'
grep -v 'pattern' file.txt                      # Show lines that do not contain 'pattern'
grep -r 'pattern' /path/to/directory            # Recursively search for 'pattern' in a directory
grep -n 'pattern' file.txt                      # Show line numbers along with matching lines
grep -l 'pattern' *.txt                         # List files in the current directory containing 'pattern'
grep -E 'pattern1|pattern2' file.txt            # Use extended regex to search for multiple patterns
grep -o 'pattern' file.txt                      # Show only the matched parts of a line
grep -c 'pattern' file.txt                      # Count the number of matching lines
