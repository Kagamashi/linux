#!/bin/bash

# TEXT PROCESSING AND MANIPULATION
# cut, paste, head, tail, join, sort, tr, split, pipe, tee, nl, wc, expand, unexpand, uniq, grep, awk

# cut – Remove sections from each line of files
cut -d':' -f1 /etc/passwd             # Display the first field of /etc/passwd, using ':' as the delimiter
cut -c1-5 file.txt                    # Display characters 1 to 5 of each line in file.txt

# paste – Merge lines of files
paste file1.txt file2.txt             # Merge corresponding lines from file1.txt and file2.txt

# head – Output the first part of files
head -n 10 file.txt                   # Display the first 10 lines of file.txt

# tail – Output the last part of files
tail -n 10 file.txt                   # Display the last 10 lines of file.txt
tail -f /var/log/syslog               # Continuously monitor the last lines of a log file (useful for logs)

# join – Join lines of two files on a common field
join file1.txt file2.txt              # Join two files on a common field (by default, the first field)

# sort – Sort lines of text files
sort file.txt                         # Sort lines alphabetically in file.txt
sort -n file.txt                      # Sort lines numerically
sort -r file.txt                      # Reverse sort

# tr – Translate or delete characters
tr 'a-z' 'A-Z' < file.txt             # Convert lowercase letters to uppercase in file.txt
tr -d '\n' < file.txt                 # Remove all newline characters from file.txt

# split – Split a file into pieces
split -l 100 file.txt part            # Split file.txt into parts with 100 lines each, prefix filenames with "part"

# Pipe (|) – Pass the output of one command as input to another
ls | grep '.txt'                      # List only .txt files in the current directory

# tee – Read from standard input and write to standard output and files
echo "Sample Text" | tee file.txt     # Write "Sample Text" to both stdout and file.txt

# nl – Number lines of files
nl file.txt                           # Number the lines in file.txt

# wc – Print newline, word, and byte counts for each file
wc file.txt                           # Print the number of lines, words, and characters in file.txt
wc -l file.txt                        # Display only the number of lines in file.txt

# expand – Convert tabs to spaces
expand file.txt                       # Convert all tabs to spaces in file.txt

# unexpand – Convert spaces to tabs
unexpand file.txt                     # Convert spaces back to tabs in file.txt

# uniq – Report or omit repeated lines
sort file.txt | uniq                  # Remove duplicate lines (requires sorted input)

# grep – Print lines that match a pattern
grep "pattern" file.txt               # Search for lines containing "pattern" in file.txt
grep -i "pattern" file.txt            # Case-insensitive search
grep -r "pattern" /path               # Search recursively for "pattern" in the directory /path

# awk – Pattern scanning and processing language
awk '{print $1}' file.txt             # Print the first field of each line in file.txt
awk -F',' '{print $2}' file.csv       # Print the second field from a comma-separated file

# Pre-defined automatic variables
RS (Record Separator): Defines how records are split.
NR (Number of Records): Holds the current record (line) number.
FS (Field Separator): Defines how fields are split in the input.
OFS (Output Field Separator): Defines how fields are separated in the output.
NF (Number of Fields): Contains the number of fields in the current record