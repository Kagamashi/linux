#!/bin/bash

# USER ACCOUNT MANAGEMENT
# passwd, chage, /etc/passwd, /etc/shadow

# Managing Passwords and Password Policies

# passwd – Change User Password
echo "passwd – Change User Password"
echo "passwd                                # Change the current user's password"
echo "passwd username                       # Change the password for the specified user"
echo "passwd -l username                    # Lock the specified user's account"
echo "passwd -u username                    # Unlock the specified user's account"

# chage – Change User Password Expiry Information
echo "chage – Change User Password Expiry Information"
echo "chage -l username                     # List password expiration details for the specified user"
echo "chage -M 90 username                  # Set the maximum number of days between password changes to 90 for the specified user"
echo "chage -E 2024-12-31 username          # Set an expiration date for the user's account"

# /etc/passwd – User Account Information
echo "/etc/passwd – User Account Information"
echo "cat /etc/passwd                       # View the user account information file"
echo "grep username /etc/passwd             # Search for the specific user's entry in /etc/passwd"

# /etc/shadow – Secure User Passwords
echo "/etc/shadow – Secure User Passwords"
echo "cat /etc/shadow                       # View the secure user password information file"
echo "grep username /etc/shadow             # Search for the specific user's entry in /etc/shadow"

# Creating and Deleting Users and Groups

# useradd – Create a New User
echo "useradd – Create a New User"
echo "useradd username                     # Create a new user with default settings"
echo "useradd -m -s /bin/bash username     # Create a new user with a home directory and default shell"
echo "useradd -u 1500 -g 1000 -s /bin/bash username # Create a new user with a specific UID and GID"

# userdel – Delete a User
echo "userdel – Delete a User"
echo "userdel username                     # Delete the specified user account"
echo "userdel -r username                  # Delete the specified user account and their home directory"

# groupadd – Create a New Group
echo "groupadd – Create a New Group"
echo "groupadd groupname                  # Create a new group with the specified name"
echo "groupadd -g 1500 groupname           # Create a new group with a specific GID"

# groupdel – Delete a Group
echo "groupdel – Delete a Group"
echo "groupdel groupname                  # Delete the specified group"

# Assigning Users to Groups

# usermod – Modify User Accounts
echo "usermod – Modify User Accounts"
echo "usermod -aG groupname username       # Add the specified user to the specified group (append to existing groups)"
echo "usermod -G group1,group2 username    # Replace all groups for the specified user with group1 and group2"

# groups – List User's Groups
echo "groups – List User's Groups"
echo "groups username                       # List all groups that the specified user is a member of"

