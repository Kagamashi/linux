#!/bin/bash

# TEXT MANIPULATION
# cat, cut, grep, awk, sed, tr, sort, uniq

# cat – Concatenate and Display Files
cat file.txt                         # Display the content of a file
cat file1.txt file2.txt > merged.txt  # Concatenate two files and redirect the output to a new file
cat -n file.txt                      # Display content with line numbers

# cut – Remove Sections from Each Line of Files
cut -d':' -f1 /etc/passwd            # Extract the first field (before colon) from a colon-separated file
cut -c1-5 file.txt                   # Extract the first 5 characters from each line
cut -d',' -f2 file.csv               # Extract the second field from a comma-separated file

# grep – Search for Patterns in Files
grep "pattern" file.txt              # Search for a pattern in a file
grep -i "pattern" file.txt           # Case-insensitive search for a pattern
grep -r "pattern" /path/to/dir       # Recursively search for a pattern in a directory
grep -n "pattern" file.txt           # Show line numbers for matches
grep -v "pattern" file.txt           # Invert match, showing lines that don't contain the pattern

# awk – Pattern Scanning and Processing Language
awk '{print $1}' file.txt            # Print the first field (column) of each line
awk -F':' '{print $1, $3}' /etc/passwd  # Print the first and third fields of a colon-separated file
awk '/pattern/ {print $0}' file.txt  # Print lines matching a pattern
awk '{sum += $1} END {print sum}' file.txt  # Sum the values in the first field and print the total

# sed – Stream Editor for Filtering and Transforming Text
sed 's/old/new/' file.txt            # Replace the first occurrence of 'old' with 'new' in each line
sed 's/old/new/g' file.txt           # Replace all occurrences of 'old' with 'new' in each line
sed -n '5,10p' file.txt              # Print lines 5 to 10 from a file
sed '/pattern/d' file.txt            # Delete lines matching a pattern

# tr – Translate or Delete Characters
tr 'a-z' 'A-Z' < file.txt            # Convert lowercase letters to uppercase
tr -d '0-9' < file.txt               # Delete all digits from the input
tr ':' ',' < file.txt                # Replace all colons with commas

# sort – Sort Lines of Text Files
sort file.txt                        # Sort the lines of a file alphabetically
sort -n file.txt                     # Sort numerically
sort -r file.txt                     # Sort in reverse order
sort -u file.txt                     # Sort and remove duplicate lines

# uniq – Report or Omit Repeated Lines
uniq file.txt                        # Remove consecutive duplicate lines from a file
uniq -c file.txt                     # Count and display the number of occurrences of each line
uniq -d file.txt                     # Show only duplicate lines
