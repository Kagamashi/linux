
cat              # concatenate and display file content
tac              # view content of the file in reverse
less             # view file content interactively
more             # view file content interactively (line by line)
head             # display the first part of files
tail             # display the last part of files
diff             # compare files
cut              # remove sections from each line of files
sort             # sort lines of text files
uniq             # report or omit repeated lines
tr               # translate or delete characters
wc               # print newline, word, and byte counts
paste            # merge lines of files
fmt              # simple text formatter
touch            # change file timestamps or create empty files
cp               # copy files or directories
mv               # move or rename files
rm               # remove files or directories
ln               # create hard and symbolic links
ls               # list directory contents
stat             # display detailed file or file system status
file             # determine file type
du               # disk usage of files and directories
df               # report file system disk space usage


cat filename.txt                        
cat file1.txt file2.txt > combined.txt  # concatenate two files into one

less filename.txt               # view a file with scrolling capabilities
less +F /var/logs/syslog        # real time

more filename.txt               # view a file with line-by-line scrolling

head filename.txt               # first 10 lines of a file
head -n 5 filename.txt          # first 5 lines of a file

tail filename.txt               # display the last 10 lines of a file
tail -n 5 filename.txt          # display the last 5 lines of a file
tail -f filename.txt            # follow the end of a file in real-time (useful for logs)

diff file1 file2          # compare files - differences
diff -c file1 file2       # compare files - contet
diff -y file1 file2       # side-by-side diff
sdiff file1 file2         # side-by-side
diff -l file1 file2       # ignore case sensitivities
diff ../dir/ ../data/dir/ # shows differences between directories in files

comm # compare sorted files (must be sorted)

cmp  # compare byte by byte and return first difference line number

# -d delimeter
# -f fields we want to extract
cut -d ':' -f 1 /etc/passwd             # Extract the first field from each line of /etc/passwd
cut -c 1-5 filename.txt                 # Cut characters from 1 to 5 in each line of a file

sort filename.txt                        # Sort the lines in a file
sort -r filename.txt                     # Sort in reverse order

uniq filename.txt                        # Remove adjacent duplicate lines from a file
sort filename.txt | uniq                 # Remove all duplicate lines (requires sorting first)

echo "hello 123" | tr ' ' '_'           # Replace spaces with underscores
echo "hello" | tr 'a-z' 'A-Z'           # Convert lowercase letters to uppercase

wc filename.txt                          # Count lines, words, and bytes in a file
wc -l filename.txt                       # Count only lines in a file

paste file1.txt file2.txt                # Merge lines from two files
paste -d ',' file1.txt file2.txt         # Merge lines with a comma delimiter

fmt filename.txt                         # Reformat text in a file to fit a specified width
fmt -w 50 filename.txt                   # Format to a maximum width of 50 characters

touch newfile.txt                        # Create an empty file named newfile.txt
touch -m existingfile.txt                # Update the modification time of an existing file

cp source.txt destination.txt            # Copy source.txt to destination.txt
cp -r /path/to/source /path/to/destination # Copy a directory and its contents
cp -i source.txt destination.txt         # Prompt before overwriting destination file
cp /path/source /path/destination new_name # Copy and change name

mv oldname.txt newname.txt               # Rename oldname.txt to newname.txt
mv /path/to/file /new/path/to/file       # Move file to a new location

rm file.txt                              # Remove a file
rm -r /path/to/directory                 # Remove a directory and its contents
rm -i file.txt                           # Prompt before deleting the file

ln file.txt hardlink.txt                 # Create a hard link to file.txt
ln -s file.txt symlink.txt               # Create a symbolic link to file.txt

# Soft Link (symbolic link) is a shortcut - it creates a new file that points to another file or directory
# If original file is deleted the soft link breaks
# Can link to directories and crosses filesystems

# Hard Link - points directly to a data of the original file
# If original file is deleted the hard link still works because it points to the same data

ls                                       # List files and directories in the current directory
ls -l                                    # List files and directories with detailed information
ls -a                                    # List all files, including hidden files
ls -lh                                   # List files in human-readable format
ls -R                                    # Recursively list all files and directories

stat filename.txt                        # Display detailed information about a file
stat /dev/sda                            # Display status of a file system or device

file filename.txt                        # Determine the type of a file
file /path/to/somefile                   # Identify file type for a specific file

du -h                                    # Show disk usage of the current directory in human-readable format
du -sh /path/to/dir                      # Show total disk usage of a specific directory
du -ah                                   # Show disk usage for all files and directories, including hidden ones

df                                       # Show disk space usage for all mounted file systems
df -h                                    # Show disk space usage in human-readable format
df -i                                    # Show inode usage for all file systems
