#!/bin/bash

ls                                      # List directory contents
stat                                    # Display detailed file or file system status
file                                    # Determine file type
du                                      # Disk usage of files and directories
df                                      # Report file system disk space usage

# ls – List directory contents
ls                                       # List files and directories in the current directory
ls -l                                    # List files with detailed information
ls -a                                    # List all files, including hidden ones
ls -lh                                   # List files in human-readable format

# stat – Display detailed file or file system status
stat filename.txt                        # Display detailed information about a file
stat /dev/sda                            # Display status of a file system or device

# file – Determine file type
file filename.txt                        # Determine the type of a file
file /path/to/somefile                   # Identify file type for a specific file

# du – Disk usage of files and directories
du -h                                    # Show disk usage of the current directory in human-readable format
du -sh /path/to/dir                      # Show total disk usage of a specific directory
du -ah                                   # Show disk usage for all files and directories, including hidden ones

# df – Report file system disk space usage
df                                       # Show disk space usage for all mounted file systems
df -h                                    # Show disk space usage in human-readable format
df -i                                    # Show inode usage for all file systems
