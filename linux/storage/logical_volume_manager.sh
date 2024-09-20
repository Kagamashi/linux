#!/bin/bash

# LOGICAL VOLUME MANAGER (LVM)
# pvcreate, vgcreate, lvcreate, lvextend, lvreduce, vgextend, pvs, vgs, lvs


# Creating and Managing Physical Volumes, Volume Groups, and Logical Volumes
# pvcreate – Create a Physical Volume
pvcreate /dev/sdX1                    # Initialize /dev/sdX1 as a physical volume for LVM
pvcreate /dev/sdX2                    # Initialize /dev/sdX2 as a physical volume for LVM

# vgcreate – Create a Volume Group
vgcreate vgname /dev/sdX1 /dev/sdX2  # Create a volume group named vgname with physical volumes /dev/sdX1 and /dev/sdX2

# lvcreate – Create a Logical Volume
lvcreate -n lvname -L 10G vgname      # Create a logical volume named lvname of size 10GB in volume group vgname
lvcreate -n lvname -l 100%FREE vgname # Create a logical volume using all free space in volume group vgname

# lvextend – Extend a Logical Volume
lvextend -L +5G /dev/vgname/lvname   # Extend the logical volume by 5GB
lvextend -l +100%FREE /dev/vgname/lvname # Extend the logical volume to use all free space in the volume group

# lvreduce – Reduce the Size of a Logical Volume
lvreduce -L -5G /dev/vgname/lvname    # Reduce the logical volume size by 5GB
lvreduce -L 10G /dev/vgname/lvname    # Reduce the logical volume size to 10GB

# vgextend – Extend a Volume Group
vgextend vgname /dev/sdX3             # Add a new physical volume /dev/sdX3 to the volume group vgname


# Monitoring LVM Space Usage
# pvs – Display Physical Volumes
pvs                                   # List all physical volumes and their details
pvs -o +pv_free                       # Show the amount of free space on physical volumes

# vgs – Display Volume Groups
vgs                                   # List all volume groups and their details
vgs -o +vg_free                       # Show the amount of free space in volume groups

# lvs – Display Logical Volumes
lvs                                   # List all logical volumes and their details
lvs -o +lv_size                       # Show the size of logical volumes
