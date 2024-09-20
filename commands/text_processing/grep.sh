grep # Search text using patterns


# grep – Search for Patterns in Files
grep "pattern" file.txt              # Search for a pattern in a file
grep -i "pattern" file.txt           # Case-insensitive search for a pattern
grep -r "pattern" /path/to/dir       # Recursively search for a pattern in a directory
grep -n "pattern" file.txt           # Show line numbers for matches
grep -v "pattern" file.txt           # Invert match, showing lines that don't contain the pattern
