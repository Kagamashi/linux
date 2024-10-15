# Grant temporary superuser privileges
sudo command                               # Run a command with superuser (root) privileges.
sudo su                                    # Switch to the root user (superuser).

# Show which privileges a user has
sudo -l                                    # List the sudo privileges for the current user.
sudo -l -U username                        # List the sudo privileges for a specific user.

# Add a user to the sudoers list
sudo usermod -aG sudo username             # Add a user to the "sudo" group, granting them sudo privileges.

# Open the sudoers file for editing:
sudo visudo