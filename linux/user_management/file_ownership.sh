#!/bin/bash

# FILE OWNERSHIP AND PERMISSIONS
# umask, getfacl, setfacl, SGID, SUID

# Default File Permissions and Inheritance
# umask – Default File Creation Permissions
umask                                # Show the current umask value
umask 022                            # Set default permissions to 755 for directories and 644 for files
umask 077                            # Restrict permissions to owner only (0700 for directories and 0600 for files)
umask 002                            # Set default permissions to 775 for directories and 664 for files (useful for collaborative work)


# Special Permissions
# SUID – Set User ID on Execution
chmod u+s /path/to/executable         # Set SUID bit on an executable file
ls -l /path/to/executable             # Check if SUID bit is set (look for 's' in the owner's execute position)
find / -perm -4000 -type f           # Find all files with SUID bit set

# SGID – Set Group ID on Execution
chmod g+s /path/to/executable         # Set SGID bit on an executable file
chmod g+s /path/to/directory          # Set SGID bit on a directory (files created in the directory inherit the group)
ls -l /path/to/executable             # Check if SGID bit is set (look for 's' in the group's execute position)
find / -perm -2000 -type f           # Find all files with SGID bit set

# Sticky Bit – Ensure Only File Owners Can Delete Files
chmod +t /path/to/directory           # Set the sticky bit on a directory
ls -ld /path/to/directory             # Check if sticky bit is set (look for 't' in the others' execute position)
find / -perm -1000 -type d           # Find all directories with sticky bit set


# Understanding ACLs (Access Control Lists)
# getfacl – Get File Access Control List
getfacl /path/to/file                 # Display ACLs for the specified file
getfacl -R /path/to/directory         # Recursively display ACLs for all files in a directory

# setfacl – Set File Access Control List
setfacl -m u:username:rwx /path/to/file # Grant read, write, and execute permissions to a specific user
setfacl -m g:groupname:rx /path/to/file # Grant read and execute permissions to a specific group
setfacl -x u:username /path/to/file    # Remove ACL entry for a specific user
setfacl -b /path/to/file               # Remove all ACL entries and revert to default permissions
