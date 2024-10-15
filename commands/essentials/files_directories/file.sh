#!/bin/bash

# ----------------------
touch             # Change file timestamps or create empty files
cp                # Copy files or directories
mv                # Move or rename files
rm                # Remove files or directories
ln                # Create hard and symbolic links
# ----------------------

touch newfile.txt                        # Create an empty file named newfile.txt
touch -m existingfile.txt                # Update the modification time of an existing file

cp source.txt destination.txt            # Copy source.txt to destination.txt
cp -r /path/to/source /path/to/destination # Copy a directory and its contents
cp -i source.txt destination.txt         # Prompt before overwriting destination file
cp /path/source /path/destination new_name # Copy and change name

mv oldname.txt newname.txt               # Rename oldname.txt to newname.txt
mv /path/to/file /new/path/to/file       # Move file to a new location

rm file.txt                              # Remove a file
rm -r /path/to/directory                 # Remove a directory and its contents
rm -i file.txt                           # Prompt before deleting the file

ln file.txt hardlink.txt                 # Create a hard link to file.txt
ln -s file.txt symlink.txt               # Create a symbolic link to file.txt

# Soft Link (symbolic link) is a shortcut - it creates a new file that points to another file or directory
# If original file is deleted the soft link breaks
# Can link to directories and crosses filesystems

# Hard Link - points directly to a data of the original file
# If original file is deleted the hard link still works because it points to the same data

# ---------INFO---------
ls              # List directory contents
stat            # Display detailed file or file system status
file            # Determine file type
du              # Disk usage of files and directories
df              # Report file system disk space usage
# ----------------------

ls                                       # List files and directories in the current directory
ls -l                                    # List files and directories with detailed information
ls -a                                    # List all files, including hidden files
ls -lh                                   # List files in human-readable format
ls -R                                    # Recursively list all files and directories

stat filename.txt                        # Display detailed information about a file
stat /dev/sda                            # Display status of a file system or device

file filename.txt                        # Determine the type of a file
file /path/to/somefile                   # Identify file type for a specific file

du -h                                    # Show disk usage of the current directory in human-readable format
du -sh /path/to/dir                      # Show total disk usage of a specific directory
du -ah                                   # Show disk usage for all files and directories, including hidden ones

df                                       # Show disk space usage for all mounted file systems
df -h                                    # Show disk space usage in human-readable format
df -i                                    # Show inode usage for all file systems
