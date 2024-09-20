#!/bin/bash

chmod                                   # Change file access permissions
chown                                   # Change file owner and group
chgrp                                   # Change group ownership

# chmod – Change file access permissions
chmod 755 file.txt                      # Set permissions to rwxr-xr-x for file.txt
chmod +x script.sh                      # Add execute permission to script.sh
chmod -R 644 /path/to/directory         # Set permissions recursively to rw-r--r-- for all files in a directory

# chown – Change file owner and group
chown user:group file.txt               # Change the owner to "user" and group to "group" for file.txt
chown -R user:group /path/to/directory  # Change ownership recursively for all files in a directory

# chgrp – Change group ownership
chgrp groupname file.txt                 # Change the group ownership of file.txt to "groupname"
chgrp -R groupname /path/to/directory    # Change group ownership recursively for all files in a directory
