
chmod            # change file access permissions
chown            # change file owner and group
chgrp            # change group ownership
sudo             # grants temporary elevated privileges to run command
su               # changes to root account until logout

# [rwx][rwx][rwx]
# owner group others
# permissions are evaluated in linear fashion from left to right: OWNER -> GROUP -> OTHER

r read    4
w write   2
x execute 1
s suid    4000
s sguid   2000
t sticky  1000

chmod 755 file.txt                      # set permissions to rwxr-xr-x for file.txt
chmod +x script.sh                      # add execute permission to script.sh
chmod -R 644 /path/to/directory         # set permissions recursively to rw-r--r-- for all files in a directory
chmod u+rwx script.sh                   # add permissions to users on script.sh file
chmod g-rw script.sh                    # remove read and write permissions from group
chmod o=w scripth,sh

chown user:group file.txt               # change the owner to "user" and group to "group" for file.txt
chown -R user:group /path/to/directory  # change ownership recursively for all files in a directory

chgrp groupname file.txt                 # change the group ownership of file.txt to "groupname"
chgrp -R groupname /path/to/directory    # change group ownership recursively for all files in a directory

# SUID : runs file with the file owner’s permissions.
chmod u+s file.txt                       # -rwsr-xr-x
chmod 4755 file.txt

# SGID : files inherit the group of the directory.
chmod g+s /files                         # drwxr-sr-x
chmod 2755 /directory                    # files created inside inherit its group

# Sticky Bit : only the owner can delete their files in the directory.
chmod +t files/                          # drwxrwxrwt
