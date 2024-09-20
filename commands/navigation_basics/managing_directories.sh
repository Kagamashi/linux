mkdir # Create directories
rmdir # Remove empty directories


# mkdir – Create Directories
mkdir new_directory               # Create a new directory
mkdir -p /path/to/parent/new_dir   # Create parent directories as needed (no error if they already exist)
mkdir -v new_directory            # Verbosely create directories, showing a message for each created

# rmdir – Remove Empty Directories
rmdir empty_directory             # Remove an empty directory
rmdir -p /path/to/empty_dir        # Remove a directory and its parent directories if they are also empty
