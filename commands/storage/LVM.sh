#!/bin/bash

# ----------------------
# Basic LVM Concepts
# ----------------------

# Create a Physical Volume (PV)
sudo pvcreate /dev/sda1                    # Initialize /dev/sda1 as a physical volume.

# Create a Volume Group (VG)
sudo vgcreate vg_data /dev/sda1            # Create a volume group 'vg_data' on PV /dev/sda1.

# Create a Logical Volume (LV)
sudo lvcreate -L 10G -n lv_data vg_data    # Create a logical volume 'lv_data' of size 10G in 'vg_data'.

# ----------------------
# Displaying LVM Information
# ----------------------

# Display Physical Volumes
sudo pvdisplay                              # Show detailed information about physical volumes.

# Display Volume Groups
sudo vgdisplay                              # Show detailed information about volume groups.

# Display Logical Volumes
sudo lvdisplay                              # Show detailed information about logical volumes.

# ----------------------
# Extending or Reducing Logical Volumes
# ----------------------

# Extend a Logical Volume
sudo lvextend -L +5G /dev/vg_data/lv_data   # Increase the size of 'lv_data' by 5GB.

# Resize the filesystem after LV extension (ext4)
sudo resize2fs /dev/vg_data/lv_data         # Resize the filesystem after extending an ext4 LV.

# Reduce a Logical Volume (use with caution, ensure data safety)
sudo lvreduce -L -5G /dev/vg_data/lv_data   # Decrease the size of 'lv_data' by 5GB (data backup required).

# ----------------------
# Managing LVM Snapshots
# ----------------------

# Create an LVM snapshot
sudo lvcreate --size 1G --snapshot --name lv_snapshot /dev/vg_data/lv_data  # Create a 1G snapshot of 'lv_data'.

# Remove a snapshot
sudo lvremove /dev/vg_data/lv_snapshot      # Remove the snapshot.
