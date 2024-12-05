
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

diff file1 file2            # compare files - differences
diff -c file1 file2         # compare files - contet
diff -y file1 file2         # side-by-side diff
sdiff file1 file2           # side-by-side
diff -l file1 file2         # ignore case sensitivities
diff ../dir/ ../data/dir/   # shows differences between directories in files

comm # compare sorted files (must be sorted)

cmp  # compare byte by byte and return first difference line number

# -d delimeter
# -f fields we want to extract
cut -d ':' -f 1 /etc/passwd             # extract the first field from each line of /etc/passwd
cut -c 1-5 filename.txt                 # cut characters from 1 to 5 in each line of a file

sort filename.txt                       # sort the lines in a file
sort -r filename.txt                    # sort in reverse order

uniq filename.txt                       # remove adjacent duplicate lines from a file
sort filename.txt | uniq                # remove all duplicate lines (requires sorting first)

echo "hello 123" | tr ' ' '_'           # replace spaces with underscores
echo "hello" | tr 'a-z' 'A-Z'           # convert lowercase letters to uppercase

wc filename.txt                         # count lines, words, and bytes in a file
wc -l filename.txt                      # count only lines in a file

paste file1.txt file2.txt               # merge lines from two files
paste -d ',' file1.txt file2.txt        # merge lines with a comma delimiter

fmt filename.txt                        # reformat text in a file to fit a specified width
fmt -w 50 filename.txt                  # format to a maximum width of 50 characters

touch newfile.txt
touch -m existingfile.txt               # update the modification time of an existing file

cp source.txt destination.txt               # copy source.txt to destination.txt
cp -r /path/to/source /path/to/destination  # copy a directory and its contents
cp -i source.txt destination.txt            # prompt before overwriting destination file
cp /path/source /path/destination new_name  # copy and change name

mv oldname.txt newname.txt               # rename oldname.txt to newname.txt
mv /path/to/file /new/path/to/file       # move file to a new location

rm file.txt
rm -r /path/to/directory                 # remove a directory and its contents
rm -i file.txt                           # prompt before deleting the file

# Soft Link (symbolic link) is a shortcut - it creates a new file that points to another file or directory
#   * if original file is deleted the soft link breaks
#   * can link to directories and crosses filesystems
#   * shares the same inode as source
ln -s file.txt symlink.txt               # create a symbolic link to file.txt

# Hard Link - points directly to a data of the original file
#   * if original file is deleted the hard link still works because it points to the same data
#   * shares the same inode as source
ln file.txt hardlink.txt                 # create a hard link to file.txt

ls                                       # list files and directories 
ls -l                                    # with detailed information
ls -a                                    # including hidden files
ls -lh                                   # in human-readable format
ls -R                                    # recursive listing

stat filename.txt                        # display detailed information about a file
stat /dev/sda                            # display status of a file system or device

file filename.txt                        # determine the type of a file
file /path/to/somefile                   # identify file type for a specific file

du -sh /path/to/dir                      # show total disk usage of a specific directory
du -h                                    # in human-readable format
du -ah                                   # including hidden ones

df                                       # show disk space usage for all mounted file systems
df -h                                    # in human-readable format
df -i                                    # show inode usage for all file systems
