#!/bin/bash

# MOUNTING AND MANAGING FILE SYSTEMS
# mount, umount, /etc/fstab, mkswap, swapon, swapoff


# Mounting Filesystems
# mount – Mount a Filesystem
mount /dev/sdX1 /mnt/my_mount_point  # Mount the filesystem on /dev/sdX1 to /mnt/my_mount_point
mount -t ext4 /dev/sdX1 /mnt/my_mount_point # Specify the filesystem type (e.g., ext4)
mount -o loop /path/to/image.iso /mnt/my_mount_point # Mount an ISO image as a loop device

# umount – Unmount a Filesystem
umount /mnt/my_mount_point            # Unmount the filesystem from /mnt/my_mount_point
umount -l /mnt/my_mount_point          # Lazy unmount (detach immediately, clean up later)


# Understanding /etc/fstab
# /etc/fstab – File System Table
# This file contains information about disk partitions and filesystems to be mounted at boot.
# Example entry:
# /dev/sdX1    /mnt/my_mount_point    ext4    defaults    0    2
# /dev/sdX2    /mnt/another_mount     xfs     defaults    0    2


# Managing Swap Space
# mkswap – Create a Swap Space
mkswap /dev/sdX1                      # Initialize /dev/sdX1 as swap space

# swapon – Enable Swap Space
swapon /dev/sdX1                      # Activate the swap space on /dev/sdX1
swapon -a                            # Activate all swap spaces defined in /etc/fstab

# swapoff – Disable Swap Space
swapoff /dev/sdX1                    # Deactivate the swap space on /dev/sdX1
swapoff -a                          # Deactivate all swap spaces
