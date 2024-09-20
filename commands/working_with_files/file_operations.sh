#!/bin/bash

cp                                       # Copy files or directories
mv                                       # Move or rename files
rm                                       # Remove files or directories
ln                                       # Create hard and symbolic links
touch                                    # Change file timestamps or create empty files

# cp – Copy files or directories
cp source.txt destination.txt            # Copy source.txt to destination.txt
cp -r /path/to/source /path/to/destination # Copy a directory and its contents
cp -i source.txt destination.txt         # Prompt before overwriting destination file

# mv – Move or rename files
mv oldname.txt newname.txt               # Rename oldname.txt to newname.txt
mv /path/to/file /new/path/to/file       # Move file to a new location

# rm – Remove files or directories
rm file.txt                              # Remove a file
rm -r /path/to/directory                 # Remove a directory and its contents
rm -i file.txt                           # Prompt before deleting the file

# ln – Create hard and symbolic links
ln file.txt hardlink.txt                 # Create a hard link to file.txt
ln -s file.txt symlink.txt               # Create a symbolic link to file.txt

# touch – Change file timestamps or create empty files
touch newfile.txt                        # Create an empty file named newfile.txt
touch -m existingfile.txt                # Update the modification time of an existing file
