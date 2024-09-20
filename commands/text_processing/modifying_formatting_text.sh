#!/bin/bash

cut                                     # Remove sections from each line of files
sort                                    # Sort lines of text files
uniq                                    # Report or omit repeated lines
tr                                      # Translate or delete characters
wc                                      # Print newline, word, and byte counts
paste                                   # Merge lines of files
fmt                                     # Simple text formatter

# cut – Remove sections from each line of files
cut -d ':' -f 1 /etc/passwd             # Extract the first field from each line of /etc/passwd
cut -c 1-5 filename.txt                 # Cut characters from 1 to 5 in each line of a file

# sort – Sort lines of text files
sort filename.txt                        # Sort the lines in a file
sort -r filename.txt                     # Sort in reverse order

# uniq – Report or omit repeated lines
uniq filename.txt                        # Remove adjacent duplicate lines from a file
sort filename.txt | uniq                 # Remove all duplicate lines (requires sorting first)

# tr – Translate or delete characters
echo "hello 123" | tr ' ' '_'           # Replace spaces with underscores
echo "hello" | tr 'a-z' 'A-Z'           # Convert lowercase letters to uppercase

# wc – Print newline, word, and byte counts
wc filename.txt                          # Count lines, words, and bytes in a file
wc -l filename.txt                       # Count only lines in a file

# paste – Merge lines of files
paste file1.txt file2.txt                # Merge lines from two files
paste -d ',' file1.txt file2.txt         # Merge lines with a comma delimiter

# fmt – Simple text formatter
fmt filename.txt                         # Reformat text in a file to fit a specified width
fmt -w 50 filename.txt                   # Format to a maximum width of 50 characters
