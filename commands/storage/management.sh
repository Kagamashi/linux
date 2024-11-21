#!/bin/bash

# ----------------------
# Partitioning and Filesystems
# ----------------------

# View existing partitions
sudo fdisk -l                 # Display disk partition table (MBR and GPT).
sudo parted -l                # Display partition layout using parted.

# Create and modify partitions with fdisk (MBR)
sudo fdisk /dev/sda           # Open fdisk for /dev/sda.
# Inside fdisk: 'n' to create new partition, 'd' to delete, 'w' to write changes.

# Create and modify partitions with parted (GPT)
sudo parted /dev/sda          # Open parted for /dev/sda.
# Inside parted: mklabel gpt, mkpart primary ext4 1MiB 100%, print, quit.

# Create filesystem (ext4)
sudo mkfs.ext4 /dev/sda1      # Format the partition /dev/sda1 with ext4 filesystem.

# Create filesystem (XFS)
sudo mkfs.xfs /dev/sda1       # Format the partition /dev/sda1 with XFS filesystem.

# Create filesystem (Btrfs)
sudo mkfs.btrfs /dev/sda1     # Format the partition /dev/sda1 with Btrfs filesystem.

# ----------------------
# Mounting Filesystems and fstab
# ----------------------

# Manually mount a filesystem
sudo mount /dev/sda1 /mnt      # Mount the partition /dev/sda1 to /mnt.

# Unmount a filesystem
sudo umount /mnt               # Unmount the /mnt directory.

# Display mounted filesystems
mount | column -t              # Display currently mounted filesystems.

# Add entry to /etc/fstab for automatic mounting
echo "/dev/sda1 /mnt ext4 defaults 0 2" | sudo tee -a /etc/fstab  # Auto-mount ext4 filesystem.

# ----------------------
# Filesystem Labels and UUIDs
# ----------------------

# Display filesystem UUIDs and labels
sudo blkid                     # Display block device attributes (UUID, type, label).
sudo lsblk -f                  # Display filesystems and UUIDs.

# Label a filesystem
sudo e2label /dev/sda1 new_label  # Set label "new_label" for ext4 partition.
sudo xfs_admin -L new_label /dev/sda1  # Set label for XFS partition.

# ----------------------
# Filesystem Management
# ----------------------

# Check filesystem integrity (ext4)
sudo fsck /dev/sda1            # Check and repair ext4 filesystem.

# Check filesystem integrity (XFS)
sudo xfs_repair /dev/sda1      # Check and repair XFS filesystem.

# Resize ext4 filesystem
sudo resize2fs /dev/sda1       # Resize ext4 filesystem after resizing the partition.

# Resize XFS filesystem
sudo xfs_growfs /dev/sda1      # Resize XFS filesystem while it is mounted.

