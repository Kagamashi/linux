#!/bin/bash

df                                      # Report file system disk space usage
du                                      # Estimate file space usage
iostat                                   # Report CPU and I/O statistics
tune2fs                                  # Adjust tunable file system parameters on ext2/ext3/ext4

# df – Report file system disk space usage
df -h                                   # Show disk space usage in human-readable format
df -i                                   # Show inode usage for all file systems

# du – Estimate file space usage
du -h                                   # Show disk usage of the current directory in human-readable format
du -sh /path/to/dir                     # Show total disk usage of a specific directory
du -h --max-depth=1                     # Show disk usage for directories up to a depth of 1
du -a /path/to/dir                      # Show disk usage for all files and directories

# iostat – Report CPU and I/O statistics
iostat                                   # Display CPU and I/O statistics for all devices
iostat -x 1                              # Continuously report extended I/O statistics every second

# tune2fs – Adjust tunable file system parameters on ext2/ext3/ext4
tune2fs -l /dev/sda1                    # Show the superblock information of the specified filesystem
tune2fs -o journal_data /dev/sda1       # Set the journaling mode of the filesystem
