#!/bin/bash

# ----------------------
mkdir  # Create directories
rmdir  # Remove empty directories
rm -rf # Remove non-empty directories
cd     # Change directory
pwd    # Print working directory
ls     # List directory contents
# ----------------------

# Linux directories tree is reversed, the root is at the top

mkdir my_directory                      # Create a single directory named "my_directory"
mkdir -p /path/to/my_directory          # Create a nested directory structure (if it doesn't exist)
mkdir -m 755 my_directory               # Create a directory with specific permissions

rmdir my_directory                      # Remove an empty directory named "my_directory"
rmdir -p /path/to/empty_directory       # Remove a directory and its parent directories if they are empty

cd /path/to/directory                   # Change to a specified directory
cd ..                                   # Go one levep up
cd -                                    # Go to previous directory
cd /                                    # Go to root directory
cd                                      # Go to home directory

pwd                                      # Print the current working directory

ls                                       # List files and directories in the current directory
ls -l                                    # List files and directories with detailed information
ls -a                                    # List all files, including hidden files
ls -lh                                   # List files in human-readable format
ls -R                                    # Recursively list all files and directories

# Absolute path - always start with root directory represented by slash
/home/user/Documents/invoice.pdf
/home/user/Documents 

# Relative path - path as seen from our pwd
../invoice.pdf
../..