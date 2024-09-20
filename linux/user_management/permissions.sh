#!/bin/bash

# Managing file and directory permissions
# chmod, chown, chgrp, unmask

# chmod – Change File Modes or Access Control Lists
chmod 755 file.txt                     # Set read, write, execute permissions for owner, and read, execute for group and others
chmod u+x script.sh                    # Add execute permission for the user (owner)
chmod g-w file.txt                     # Remove write permission for the group
chmod -R 644 /path/to/dir              # Recursively set permissions to read and write for owner, and read-only for group and others

# chown – Change File Owner and Group
chown username:groupname file.txt      # Change the owner to username and the group to groupname
chown -R username /path/to/dir         # Recursively change the owner of all files and directories
chown :groupname file.txt              # Change the group of file.txt to groupname (keep the owner unchanged)

# chgrp – Change Group Ownership
chgrp groupname file.txt               # Change the group of file.txt to groupname
chgrp -R groupname /path/to/dir        # Recursively change the group of all files and directories

# umask – Set Default File Creation Permissions
umask 022                              # Set default permissions to 755 (rwxr-xr-x) for new files and directories
umask 0777                             # Set default permissions to 000 (no permissions) for new files and directories
umask 002                              # Set default permissions to 775 (rwxrwxr-x) for new files and directories
