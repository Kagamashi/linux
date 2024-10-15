#!/bin/bash

groupadd                                # Add a new group
groupmod                                # Modify group attributes
groupdel                                # Delete a group
groups                                  # Shows the groups the current user belongs to.
gpasswd                                 # AddS OR Remove user to/from a group
newgrp                                  # Switch to a new group (in an active session)

# groupadd – Add a new group
groupadd newgroup                       # Create a new group named "newgroup"
groupadd -g 1001 newgroup # Creates group with specific GID (Group ID)

# groupmod – Modify group attributes
groupmod -n newgroupname oldgroupname  # Rename a group from "oldgroupname" to "newgroupname"
groupmod -g 2000 groupname

# groupdel – Delete a group
groupdel oldgroupname                   # Delete the group "oldgroupname"

# groups
groups $user # Shows groups the specified user is part

gpasswd -d username group_name          # Remove a user from a specified group.
gpasswd -a username group_name          # Add a user to a group using `gpasswd`.
gpasswd -d username group_name          # Remove a user from a group using `gpasswd`.

newgrp group_name                            # Temporarily switch to another group for the current session.
