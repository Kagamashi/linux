
mkdir   # create directories
rmdir   # remove empty directories
rm -rf  # remove non-empty directories
cd      # change directory
pwd     # print working directory
ls      # list directory contents

# Linux directories tree is reversed, the root is at the top

mkdir my_directory
mkdir -p /path/to/my_directory          # create a nested directory structure (if it doesn't exist)
mkdir -m 755 my_directory               # create a directory with specific permissions

rmdir my_directory
rmdir -p /path/to/empty_directory       # remove a directory and its parent directories if they are empty

cd /path/to/directory
cd ..                                   # go one level up
cd -                                    # go to previous directory
cd /                                    # go to root directory
cd                                      # go to home directory

ls
ls -l                                    # list files and directories with detailed information
ls -a                                    # includes hidden files
ls -lh                                   # human-readable format
ls -R                                    # recursively list files/directories


# Absolute path - always start with root directory represented by slash
/home/user/Documents/invoice.pdf
/home/user/Documents 

# Relative path - path as seen from our pwd
../invoice.pdf
../..
