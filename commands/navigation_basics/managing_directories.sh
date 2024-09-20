#!/bin/bash

mkdir                                   # Create directories
rmdir                                   # Remove empty directories

# mkdir – Create directories
mkdir my_directory                      # Create a single directory named "my_directory"
mkdir -p /path/to/my_directory          # Create a nested directory structure (if it doesn't exist)
mkdir -m 755 my_directory               # Create a directory with specific permissions

# rmdir – Remove empty directories
rmdir my_directory                      # Remove an empty directory named "my_directory"
rmdir -p /path/to/empty_directory       # Remove a directory and its parent directories if they are empty
