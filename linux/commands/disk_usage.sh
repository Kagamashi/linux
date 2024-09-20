#!/bin/bash

# Disk usage and space management
# df, du, lsblk

# df – Report File System Disk Space Usage
df -h                                   # Show disk space usage in human-readable format (GB, MB)
df -T                                   # Show file system types alongside disk usage
df -i                                   # Show inode usage instead of block usage
df /home                                # Show disk usage for the /home directory only

# du – Estimate File and Directory Disk Usage
du -h                                   # Show disk usage of the current directory in human-readable format
du -sh /path/to/dir                     # Show total disk usage of a specific directory in human-readable format
du -h --max-depth=1                     # Show disk usage for directories up to a depth of 1
du -a /path/to/dir                      # Show disk usage for all files and directories (not just directories)

# lsblk – List Information About Block Devices
lsblk                                   # Show a tree view of block devices (disks and partitions)
lsblk -f                                # Show file system information for each device
lsblk -d                                # List only block devices (without partitions)
lsblk -o NAME,SIZE,TYPE,MOUNTPOINT      # Show specific columns like name, size, type, and mount points
