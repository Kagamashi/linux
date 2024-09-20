#!/bin/bash

# ADDING OR REMOVING USERS AND GROUPS
# useradd, usermod, userdel, groupadd, groupmod, groupdel

# useradd – Create a New User
useradd username                         # Create a new user with the default settings
useradd -m -s /bin/bash newuser          # Create a new user with a home directory and specific shell
useradd -u 1001 -g users -c "New User" newuser  # Create a new user with a specific UID, GID, and comment

# usermod – Modify User Account
usermod -aG groupname username           # Add a user to a supplementary group
usermod -s /bin/zsh username             # Change the user's default shell to zsh
usermod -d /new/home/directory username # Change the user's home directory

# userdel – Delete a User Account
userdel username                         # Delete a user account (user's files are kept)
userdel -r username                      # Delete a user account and remove their home directory

# groupadd – Create a New Group
groupadd groupname                       # Create a new group
groupadd -g 1001 newgroup                # Create a new group with a specific GID

# groupmod – Modify a Group
groupmod -n newgroupname oldgroupname   # Rename a group from oldgroupname to newgroupname
groupmod -g 1002 groupname               # Change the GID of an existing group

# groupdel – Delete a Group
groupdel groupname                       # Delete a group (group must be empty)
