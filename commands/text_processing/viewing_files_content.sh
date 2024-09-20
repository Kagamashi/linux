#!/bin/bash

cat                                     # Concatenate and display file content
less                                    # View file content interactively
more                                    # View file content interactively (line by line)
head                                    # Display the first part of files
tail                                    # Display the last part of files

# cat – Concatenate and display file content
cat filename.txt                        # Display the content of a file
cat file1.txt file2.txt > combined.txt  # Concatenate two files into one

# less – View file content interactively
less filename.txt                       # View a file with scrolling capabilities
# Use `q` to quit less

# more – View file content interactively (line by line)
more filename.txt                       # View a file with line-by-line scrolling
# Use `q` to quit more

# head – Display the first part of files
head filename.txt                       # Display the first 10 lines of a file
head -n 5 filename.txt                  # Display the first 5 lines of a file

# tail – Display the last part of files
tail filename.txt                       # Display the last 10 lines of a file
tail -n 5 filename.txt                  # Display the last 5 lines of a file
tail -f filename.txt                    # Follow the end of a file in real-time (useful for logs)
