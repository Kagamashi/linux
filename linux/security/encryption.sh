#!/bin/bash

# ENCRYPTION AND DATA SECURITY
# LUKS, gpg


# Disk Encryption with LUKS
# Overview: LUKS (Linux Unified Key Setup) is a standard for disk encryption on Linux.

# Encrypt a partition with LUKS
# Replace /dev/sdX1 with the partition to be encrypted
cryptsetup luksFormat /dev/sdX1        # Initialize the LUKS partition with encryption

# Open the LUKS encrypted partition
# Replace luks_name with a name for the mapped device
cryptsetup open /dev/sdX1 luks_name    # Open the encrypted partition and map it to /dev/mapper/luks_name

# Create a filesystem on the encrypted partition
mkfs.ext4 /dev/mapper/luks_name        # Format the encrypted partition with ext4 filesystem

# Mount the encrypted partition
# Create a mount point
mkdir /mnt/encrypted
# Mount the encrypted partition
mount /dev/mapper/luks_name /mnt/encrypted

# Close the LUKS encrypted partition
umount /mnt/encrypted                  # Unmount the encrypted partition
cryptsetup close luks_name             # Close the LUKS mapping

# Backup LUKS header (important for recovery)
cryptsetup luksHeaderBackup /dev/sdX1 --header-backup-file /root/luks-header-backup.img

# Restore LUKS header from backup (if needed)
cryptsetup luksHeaderRestore /dev/sdX1 --header-backup-file /root/luks-header-backup.img


# File Encryption with GPG
# Overview: GPG (GNU Privacy Guard) is a tool for encrypting and signing files and communications.

# Encrypt a file with GPG
# Replace file.txt with the file to encrypt and recipient_email with the recipient's email address
gpg --encrypt --recipient recipient_email file.txt   # Encrypt the file for the specified recipient

# Decrypt a file with GPG
# Replace file.txt.gpg with the encrypted file
gpg --decrypt file.txt.gpg > file.txt       # Decrypt the file and output to the original filename

# Sign a file with GPG
# Replace file.txt with the file to sign
gpg --sign file.txt                        # Create a digital signature for the file

# Verify a signed file with GPG
# Replace file.txt.gpg with the signed file
gpg --verify file.txt.gpg                  # Verify the signature on the signed file

# Generate a new GPG key pair
gpg --gen-key                             # Generate a new GPG key pair for encryption and signing

# List GPG keys
gpg --list-keys                           # List all GPG keys in your keyring

# Import a GPG key
# Replace keyfile.asc with the file containing the GPG key
gpg --import keyfile.asc                  # Import a GPG key from a file

# Export a GPG key
# Replace recipient_email with the email of the key you want to export
gpg --export --armor recipient_email > public_key.asc   # Export the public key of a recipient
