#!/bin/bash

# ----------------------
# Creating and Managing Encrypted Volumes with LUKS
# ----------------------

# Install cryptsetup (if not already installed)
sudo apt install cryptsetup -y             # Ubuntu/Debian
sudo yum install cryptsetup -y             # CentOS/RHEL

# Create a LUKS encrypted volume on a partition
sudo cryptsetup luksFormat /dev/sda1       # Initialize LUKS on /dev/sda1 (careful: this wipes data).

# Open and map the LUKS volume
sudo cryptsetup open /dev/sda1 secure_vol  # Decrypt /dev/sda1 and map it to /dev/mapper/secure_vol.

# Create a filesystem inside the encrypted volume
sudo mkfs.ext4 /dev/mapper/secure_vol      # Format the decrypted volume with ext4.

# Mount the encrypted volume
sudo mount /dev/mapper/secure_vol /mnt     # Mount the volume to /mnt.

# ----------------------
# Unlocking and Mounting Encrypted Disks
# ----------------------

# To unlock and open the encrypted volume on system boot or manually
sudo cryptsetup open /dev/sda1 secure_vol  # Open the encrypted volume as secure_vol.

# Manually mount the decrypted volume
sudo mount /dev/mapper/secure_vol /mnt     # Mount the decrypted volume to /mnt.

# Unmount the encrypted volume and close it
sudo umount /mnt                           # Unmount the volume.
sudo cryptsetup close secure_vol           # Close the encrypted volume.

# ----------------------
# Managing Passphrases for Encrypted Disks
# ----------------------

# Add a new passphrase to the encrypted volume
sudo cryptsetup luksAddKey /dev/sda1       # Add an additional passphrase to the LUKS volume.

# Remove a passphrase from the encrypted volume
sudo cryptsetup luksRemoveKey /dev/sda1    # Remove a passphrase from the LUKS volume.

# View LUKS header information
sudo cryptsetup luksDump /dev/sda1         # Display the LUKS header information for the encrypted volume.
