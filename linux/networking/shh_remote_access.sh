#!/bin/bash

# SSH AND REMOTE ACCESS
# /etc/ssh/sshd_config, systemctl restart sshd, ssh-keygen, ssh-copy-id


# Configuring SSH
# /etc/ssh/sshd_config – Configuration file for the SSH daemon
# Example configuration changes:
# PermitRootLogin no              # Disable root login via SSH
# PasswordAuthentication yes     # Allow password authentication
# Port 22                        # Set the SSH port to 22 (default)

# To edit the SSH configuration file
# Use your preferred text editor, e.g.,
# nano /etc/ssh/sshd_config
# vim /etc/ssh/sshd_config

# Restart SSH Service
systemctl restart sshd             # Restart the SSH service to apply changes


# Managing SSH Keys
# ssh-keygen – Generate a new SSH key pair
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"  # Generate a new RSA key pair with 4096 bits

# The default location for SSH keys is ~/.ssh/id_rsa (private key) and ~/.ssh/id_rsa.pub (public key)
# You can specify a different location using the -f option, e.g.,
# ssh-keygen -t rsa -b 4096 -C "your_email@example.com" -f ~/.ssh/my_key

# ssh-copy-id – Copy the SSH public key to a remote host
ssh-copy-id user@remote_host     # Install your public key on the remote host for passwordless SSH

# To test the SSH connection
ssh user@remote_host             # Connect to the remote host using SSH
