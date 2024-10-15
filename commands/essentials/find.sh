#!/bin/bash

# ----------------------
find     # Search for files and directories in a directory hierarchy
# ----------------------

# Basic Usage
find /path/to/search                       # Find all files and directories in the specified path

# Search by Name
find /path/to/search -name "file.txt"      # Find files named "file.txt"
find /path/to/search -iname "file.txt"     # Find files named "file.txt", case-insensitive
find /path -name "*.jpg"


# Search by Type
find /path/to/search -type f               # Find all regular files
find /path/to/search -type d               # Find all directories
find /path/to/search -type l               # Find all symbolic links

# Search by Size
find /path/to/search -size +10M            # Find files larger than 10 MB
find /path/to/search -size -500k           # Find files smaller than 500 KB
find /path/to/search -size 100k            # Find files exactly 100 KB in size

# Search by Permission
find /path/to/search -perm 644             # Find files with permissions 644
find /path/to/search -perm /u+x            # Find files that are executable by the user
find /path/to/search -perm -u=rwx          # Find files with at least rwx permissions for the user

# Search by Last Modified Time
find /path/to/search -mtime -7             # Find files modified in the last 7 days
find /path/to/search -mtime +30            # Find files modified more than 30 days ago
find /path/to/search -mmin -1              # Files modief in the last minute
find /path/to/search -mtime 0     # In last 24 Hours
find /path/to/search -cmin 5   # Files that have their metadata changed exactly 5 minutes ago

# Search by Last Access Time
find /path/to/search -atime -5             # Find files accessed in the last 5 days
find /path/to/search -atime +10            # Find files accessed more than 10 days ago

# Search by Last Changed Time (Metadata)
find /path/to/search -ctime -3             # Find files where metadata changed in the last 3 days
find /path/to/search -ctime +15            # Find files where metadata changed more than 15 days ago

# Search and Execute a Command
find /path/to/search -name "*.log" -exec rm {} \;    # Find and delete all .log files
find /path/to/search -type f -exec chmod 644 {} \;   # Find all files and change permissions to 644
find /path/to/search -type d -exec chmod 755 {} \;   # Find all directories and change permissions to 755

# Search and Print File Details
find /path/to/search -name "*.txt" -ls              # Find .txt files and display detailed information

# Search by User or Group
find /path/to/search -user username                 # Find files owned by a specific user
find /path/to/search -group groupname               # Find files belonging to a specific group

# AND / OR
find /path/to/search -type f -name "*.txt" -size +1M  # Find .txt files larger than 1 MB
find /path/to/search -type f \( -name "*.jpg" -o -name "*.png" \)  # Find files with .jpg or .png extensions

# Use -delete to remove files directly (be careful!)
find /path/to/search -name "*.tmp" -delete          # Find and delete all .tmp files

# Search for Empty Files or Directories
find /path/to/search -type f -empty                 # Find empty files
find /path/to/search -type d -empty                 # Find empty directories

# Limit Depth of Search
find /path/to/search -maxdepth 1                    # Only search in the specified directory (no recursion)
find /path/to/search -mindepth 2                    # Skip the first level and start searching from subdirectories

# Find by File Inode Number
find /path/to/search -inum 123456                   # Find files by their inode number

# Example: Find files and print their full path
find /path/to/search -name "*.sh" -exec echo {} \;  # Find .sh files and print their full path
