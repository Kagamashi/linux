#!/bin/bash

# FILE MANAGEMENT
# ls, cp, mv, rm, find, locate, file, stat, pwd, cd, tree, touch, mkdir, rmdir

# ls – List Directory Contents
ls -lh /var/log          # List files in long format with human-readable sizes
ls -a                    # List all files including hidden ones
ls -R /var/log           # List files recursively in a directory

# cp – Copy Files or Directories
cp -r /source/directory /destination/directory   # Copy a directory recursively
cp -v file.txt /destination/                     # Copy a file in verbose mode
cp -i file.txt /destination/                     # Copy with prompt before overwriting

# mv – Move or Rename Files
mv file.txt /new/location/      # Move a file to another directory
mv oldname.txt newname.txt      # Rename a file
mv -i file.txt /new/location/   # Move a file with prompt before overwriting

# rm – Remove Files or Directories
rm -rf /path/to/directory       # Remove a directory and all its contents recursively
rm -f file.txt                  # Force remove a file without prompting
rm -i file.txt                  # Prompt before removing a file

# find – Search for Files
find /path -name "filename"     # Find files by name
find /path -type d              # Find directories only
find /path -mtime -7            # Find files modified in the last 7 days
find /path -size +10M           # Find files larger than 10 MB
find /path -name "*.log" -exec rm {} \;   # Find files and execute a command on them (delete)

# locate – Quickly Find Files
locate example.txt              # Locate a file by name
locate -i example.txt           # Case-insensitive locate
locate -r ".*\.log$"            # Locate files matching a regex (e.g., .log files)
locate -n 5 example.txt         # Limit locate results to 5 entries

# file – Determine File Type
file example.txt                # Display the type of the file

# stat – Display Detailed File Information
stat /path/to/file              # Display detailed information about a file

# pwd – Print Working Directory
pwd                             # Print the current working directory

# cd – Change Directory
cd /path/to/directory           # Change to a specific directory
cd ~                            # Change to the home directory

# tree – Display Directory Structure
tree -L 2 /path/to/directory    # Display the directory structure up to 2 levels deep
tree -a                         # Display all files including hidden ones
tree -d /path/to/directory      # Display directories only

# touch – Create an Empty File or Update File Timestamps
touch newfile.txt                 # Create an empty file or update the timestamp of existing file
touch -c newfile.txt              # Do not create the file if it doesn’t exist, only update the timestamp
touch -t 202309151230.00 file.txt # Set a specific timestamp (e.g., Sep 15, 2023 12:30)

# mkdir – Create Directories
mkdir new_directory               # Create a new directory
mkdir -p /path/to/parent/new_dir   # Create parent directories as needed (no error if they already exist)
mkdir -v new_directory            # Verbosely create directories, showing a message for each created

# rmdir – Remove Empty Directories
rmdir empty_directory             # Remove an empty directory
rmdir -p /path/to/empty_dir        # Remove a directory and its parent directories if they are also empty
