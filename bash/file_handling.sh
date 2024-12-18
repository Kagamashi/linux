
while   # reading a file line by line using 'while' read'

echo "Reading file line by line:"
while IFS= read -r line; do
    echo "Line: $line"
done < sample.txt

# working with file descriptors
#   file descriptor 0: stdin
#   file descriptor 1: stdout
#   file descriptor 2: stderr

# redirecting stdout and stderr to a file
exec 1>output.log 2>error.log


## CUSTOM FILE DESCRIPTORS
# opening a file descriptor for a specific file
exec 3>custom_output.txt                                    # open file descriptor 3 for writing to custom_output.txt
echo "This message is written using file descriptor 3" >&3
exec 3>&-                                                   # close file descriptor 3

# check if file descriptor is closed
if ! [ -e /proc/self/fd/3 ]; then
    echo "File descriptor 3 is closed."
fi
