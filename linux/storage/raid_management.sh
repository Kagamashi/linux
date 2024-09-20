#!/bin/bash

# RAID (REDUNDANT ARRAY OF INDEPENDENT DISKS)
# mdadm, RAID 0, RAID 1, RAID 5, RAID 6, RAID 10


# Configuring RAID with mdadm
# mdadm – Manage MD (multiple devices) RAID Arrays

# Create a RAID 0 array (striping)
mdadm --create /dev/md0 --level=0 --raid-devices=2 /dev/sdX1 /dev/sdX2  # Create RAID 0 array with 2 devices

# Create a RAID 1 array (mirroring)
mdadm --create /dev/md1 --level=1 --raid-devices=2 /dev/sdX3 /dev/sdX4  # Create RAID 1 array with 2 devices

# Create a RAID 5 array (striping with parity)
mdadm --create /dev/md2 --level=5 --raid-devices=3 /dev/sdX5 /dev/sdX6 /dev/sdX7  # Create RAID 5 array with 3 devices

# Create a RAID 6 array (striping with double parity)
mdadm --create /dev/md3 --level=6 --raid-devices=4 /dev/sdX8 /dev/sdX9 /dev/sdX10 /dev/sdX11  # Create RAID 6 array with 4 devices

# Create a RAID 10 array (striping and mirroring)
mdadm --create /dev/md4 --level=10 --raid-devices=4 /dev/sdX12 /dev/sdX13 /dev/sdX14 /dev/sdX15  # Create RAID 10 array with 4 devices

# Verify RAID Arrays
mdadm --detail /dev/md0                 # Show detailed information about RAID 0 array
mdadm --detail /dev/md1                 # Show detailed information about RAID 1 array
mdadm --detail /dev/md2                 # Show detailed information about RAID 5 array
mdadm --detail /dev/md3                 # Show detailed information about RAID 6 array
mdadm --detail /dev/md4                 # Show detailed information about RAID 10 array

# Adding a New Disk to an Existing RAID Array
mdadm --add /dev/md0 /dev/sdX16         # Add a new disk to the RAID 0 array

# Removing a Disk from a RAID Array
mdadm --fail /dev/md0 /dev/sdX1         # Mark /dev/sdX1 as failed in the RAID 0 array
mdadm --remove /dev/md0 /dev/sdX1       # Remove /dev/sdX1 from the RAID 0 array


# RAID Levels and Use Cases
# RAID 0 (Striping) – Increased performance but no redundancy
# Use case: High-performance applications where data redundancy is not a concern

# RAID 1 (Mirroring) – Redundancy through duplication of data
# Use case: Applications requiring high availability and redundancy

# RAID 5 (Striping with Parity) – Balance of performance, redundancy, and storage efficiency
# Use case: General-purpose storage with a balance of speed and data protection

# RAID 6 (Striping with Double Parity) – Increased redundancy with protection against two disk failures
# Use case: High-availability systems where data integrity is crucial

# RAID 10 (Mirroring and Striping) – Combines RAID 1 and RAID 0, providing both redundancy and performance
# Use case: High-performance applications requiring both speed and redundancy

