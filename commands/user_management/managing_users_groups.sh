#!/bin/bash

useradd                                 # Add new users
usermod                                 # Modify user accounts
userdel                                 # Delete a user account
groupadd                                # Add a new group
groupmod                                # Modify group attributes
groupdel                                # Delete a group

# useradd – Add new users
useradd newuser                         # Add a new user named "newuser"
useradd -m newuser                      # Add a new user and create a home directory
useradd -s /bin/bash newuser            # Add a user with a specific shell

# usermod – Modify user accounts
usermod -aG groupname newuser           # Add "newuser" to an existing group
usermod -d /home/newuser newuser        # Change the home directory of "newuser"
usermod -l newusername oldusername      # Change the username from "oldusername" to "newusername"

# userdel – Delete a user account
userdel newuser                         # Delete the user "newuser"
userdel -r newuser                      # Delete the user and their home directory

# groupadd – Add a new group
groupadd newgroup                       # Create a new group named "newgroup"

# groupmod – Modify group attributes
groupmod -n newgroupname oldgroupname  # Rename a group from "oldgroupname" to "newgroupname"

# groupdel – Delete a group
groupdel oldgroupname                   # Delete the group "oldgroupname"
