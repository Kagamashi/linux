#!/bin/bash

sed # Stream editor for filtering and transforming text

# sed – Stream Editor for Filtering and Transforming Text
# -e   – Allows the execution of multiple editing commands.
# -i   – Edit files in place (modify the original file).
# s    – Substitute command; used for search and replace.
# g    – Global flag; apply the substitution to all matches in a line.
# p    – Print the result of the command.

# Basic Commands
sed 's/pattern/replacement/' file.txt                     # Replace the first occurrence of 'pattern' with 'replacement'
sed 's/pattern/replacement/g' file.txt                    # Replace all occurrences of 'pattern' with 'replacement'
sed -i 's/old/new/g' file.txt                              # Replace all occurrences in place, modifying the original file
sed -n 's/pattern/replacement/p' file.txt                 # Replace and print only lines where substitution occurred
sedc-i 's/pattern/replacement/gi' file.txt                # /gi ignores case sensitivity
sed -i '500,2000s/pattern/replacement/gi'             # Changes only in lines from 500 to 2000

# Using Regular Expressions
sed -E 's/[0-9]+/NUMBER/g' file.txt                        # Replace all sequences of digits with 'NUMBER'
sed '2s/pattern/replacement/' file.txt                     # Replace 'pattern' with 'replacement' only on line 2

# Deleting Lines
sed '3d' file.txt                                         # Delete the third line of the file
sed '/pattern/d' file.txt                                  # Delete all lines containing 'pattern'

# Inserting and Appending Lines
sed '2i\Inserted line' file.txt                            # Insert a line before line 2
sed '2a\Appended line' file.txt                            # Append a line after line 2

# Printing Specific Lines
sed -n '1,5p' file.txt                                     # Print lines 1 to 5 of the file
sed -n '/pattern/p' file.txt                               # Print lines containing 'pattern'
