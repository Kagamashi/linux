#!/bin/bash

# Using regular expressions with grep
# Searching for lines that match the pattern 'error'
echo -e "info: this is info\nerror: something went wrong\nwarning: check this" > logfile.txt
echo "Lines containing 'error':"
grep "error" logfile.txt

# Using regular expressions with sed
# Substituting the word 'error' with 'ERROR'
echo "Replacing 'error' with 'ERROR':"
sed 's/error/ERROR/g' logfile.txt

# Using regular expressions with awk
# Printing lines that contain 'error' and showing the second field
echo "Lines with 'error' and displaying second field:"
awk '/error/ { print $2 }' logfile.txt

# Pattern matching with case statements
# Syntax:
# case $variable in
#     pattern1) commands ;;
#     pattern2) commands ;;
# esac

status="warning"

case $status in
    "info")
        echo "This is just information."
        ;;
    "warning")
        echo "This is a warning!"
        ;;
    "error")
        echo "An error occurred!"
        ;;
    *)
        echo "Unknown status."
        ;;
esac

# Globbing patterns
# * matches any number of characters
# ? matches any single character
# [] matches any character in the brackets

# Example files
touch file1.txt file2.txt fileA.txt fileB.txt fileZ.txt

echo "Using * pattern:"
ls file*.txt  # Matches any file starting with "file" and ending with ".txt"

echo "Using ? pattern:"
ls file?.txt  # Matches any file starting with "file", followed by any single character, and ending with ".txt"

echo "Using [] pattern:"
ls file[AB].txt  # Matches files named "fileA.txt" or "fileB.txt"

# Cleanup example files
rm logfile.txt file1.txt file2.txt fileA.txt fileB.txt fileZ.txt
