cp # Copy files or directories
mv # Move or rename files
rm # Remove files or directories
ln # Create hard and symbolic links
touch # Change file timestamps or create empty files

# cp – Copy Files or Directories
cp -r /source/directory /destination/directory   # Copy a directory recursively
cp -v file.txt /destination/                     # Copy a file in verbose mode
cp -i file.txt /destination/                     # Copy with prompt before overwriting

# mv – Move or Rename Files
mv file.txt /new/location/      # Move a file to another directory
mv oldname.txt newname.txt      # Rename a file
mv -i file.txt /new/location/   # Move a file with prompt before overwriting

# rm – Remove Files or Directories
rm -rf /path/to/directory       # Remove a directory and all its contents recursively
rm -f file.txt                  # Force remove a file without prompting
rm -i file.txt                  # Prompt before removing a file


# touch – Create an Empty File or Update File Timestamps
touch newfile.txt                 # Create an empty file or update the timestamp of existing file
touch -c newfile.txt              # Do not create the file if it doesn’t exist, only update the timestamp
touch -t 202309151230.00 file.txt # Set a specific timestamp (e.g., Sep 15, 2023 12:30)
