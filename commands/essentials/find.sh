
find     # search for files and directories in a directory hierarchy

find /path/to/search -name "file.txt"      # find files named "file.txt"
find /path/to/search -iname "file.txt"     # find files named "file.txt", case-insensitive
find /path -name "*.jpg"

find /path/to/search -type f               # find all regular files
find /path/to/search -type d               # directories
find /path/to/search -type l               # symbolic links

find /path/to/search -size +10M            # files larger than 10 MB
find /path/to/search -size -500k           # smaller than 500 KB
find /path/to/search -size 100k            # exactly 100 KB in size

find /path/to/search -perm 644             # with permissions 644
find /path/to/search -perm /u+x            # executable by the user
find /path/to/search -perm -u=rwx          # at least rwx permissions for the user

find /path/to/search -mtime -7             # find files modified in the last 7 days
find /path/to/search -mtime +30            # modified more than 30 days ago
find /path/to/search -mmin -1              # modified in the last minute
find /path/to/search -mtime 0              # in last 24 Hours
find /path/to/search -cmin 5               # files that have their metadata changed exactly 5 minutes ago

find /path/to/search -atime -5             # find files accessed in the last 5 days
find /path/to/search -atime +10            # find files accessed more than 10 days ago

find /path/to/search -ctime -3             # find files where metadata changed in the last 3 days
find /path/to/search -ctime +15            # find files where metadata changed more than 15 days ago

find /path/to/search -name "*.log" -exec rm {} \;    # find and delete all .log files
find /path/to/search -type f -exec chmod 644 {} \;   # find all files and change permissions to 644
find /path/to/search -type d -exec chmod 755 {} \;   # find all directories and change permissions to 755

# Search and Print file Details
find /path/to/search -name "*.txt" -ls              # find .txt files and display detailed information

# Search by User or Group
find /path/to/search -user username                 # find files owned by a specific user
find /path/to/search -group groupname               # find files belonging to a specific group

# AND / OR
find /path/to/search -type f -name "*.txt" -size +1M               # find .txt files larger than 1 MB
find /path/to/search -type f \( -name "*.jpg" -o -name "*.png" \)  # find files with .jpg or .png extensions

find /path/to/search -name "*.tmp" -delete          # find and delete all .tmp files

find /path/to/search -type f -empty                 # find empty files
find /path/to/search -type d -empty                 # find empty directories

find /path/to/search -maxdepth 1                    # Only search in the specified directory (no recursion)
find /path/to/search -mindepth 2                    # Skip the first level and start searching from subdirectories

find /path/to/search -inum 123456                   # find files by their inode number

find /path/to/search -name "*.sh" -exec echo {} \;  # find .sh files and print their full path
