#!/bin/bash

chmod                                   # Change file access permissions
chown                                   # Change file owner and group
chgrp                                   # Change group ownership

# [rwx][rwx][rwx]
# owner group others
# permissions are evaluated in linear fashion from left to right: OWNER -> GROUP -> OTHER

# chmod – Change file access permissions
chmod 755 file.txt                      # Set permissions to rwxr-xr-x for file.txt
chmod +x script.sh                      # Add execute permission to script.sh
chmod -R 644 /path/to/directory         # Set permissions recursively to rw-r--r-- for all files in a directory
chmod u+rwx script.sh                   # Add permissions to users on script.sh file
chmod g-rw script.sh                    # Remove read and write permissions from group
chmod o=w scripth,sh

# chown – Change file owner and group
chown user:group file.txt               # Change the owner to "user" and group to "group" for file.txt
chown -R user:group /path/to/directory  # Change ownership recursively for all files in a directory

# chgrp – Change group ownership
chgrp groupname file.txt                 # Change the group ownership of file.txt to "groupname"
chgrp -R groupname /path/to/directory    # Change group ownership recursively for all files in a directory


# SUID : Runs file with the file owner’s permissions.
chmod u+s file.txt                       # -rwsr-xr-x
chmod 4755 file.txt

# SGID : Files inherit the group of the directory.
chmod g+s /files                         # drwxr-sr-x
chmo 2755 /directory                     # Files created inside inherit its group

# Sticky Bit : Only the owner can delete their files in the directory.
chmod +t files/                          # drwxrwxrwt