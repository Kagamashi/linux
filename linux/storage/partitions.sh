#!/bin/bash

# PARTITIONING
# fdisk, parted


# Creating Partitions
# fdisk – Partitioning Tool for MBR Disks
fdisk /dev/sdX                         # Start fdisk for device /dev/sdX (e.g., /dev/sda)
# In fdisk prompt:
#   n – Create a new partition
#   p – Primary partition
#   1 – Partition number
#   <default> – Accept default start and end sectors
#   w – Write changes and exit

# parted – Partitioning Tool for GPT and MBR Disks
parted /dev/sdX                       # Start parted for device /dev/sdX
# In parted prompt:
#   mklabel gpt – Create a new GPT partition table
#   mkpart primary ext4 0% 100% – Create a new partition spanning the entire disk
#   print – Display partition table
#   quit – Exit parted
