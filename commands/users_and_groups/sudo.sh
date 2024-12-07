
sudo command                               # run a command with superuser (root) privileges
sudo su                                    # switch to the root user (superuser)
sudo -l                                    # list the sudo privileges for the current user
sudo -l -U username                        # list the sudo privileges for a specific user

sudo usermod -aG sudo username             # add a user to sudoers group, granting them sudo privileges

sudo visudo                                # open sudo file for editing
