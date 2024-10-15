#!/bin/bash

grep # Search for patterns in files

# grep – Search for patterns in files
# grep [options] 'search_pattern' file
# -i   – Ignore case distinctions in both the pattern and the input files.
# -v   – Invert the match, showing lines that do not match the pattern.
# -r   – Recursively search directories for the pattern.
# -n   – Show line numbers with output lines.
# -l   – Print only the names of files with matching lines, once for each file.

grep 'pattern' file.txt                         # Search for 'pattern' in file.txt
grep -i 'pattern' file.txt                      # Case-insensitive search for 'pattern'
grep -v 'pattern' file.txt                      # Show lines that do not contain 'pattern'
grep -r 'pattern' /path/to/directory            # Recursively search for 'pattern' in a directory
grep -n 'pattern' file.txt                      # Show line numbers along with matching lines
grep -l 'pattern' *.txt                         # List files in the current directory containing 'pattern'
grep -o 'pattern' file.txt                      # Show only the matched parts of a line
grep -c 'pattern' file.txt                      # Count the number of matching lines
grep -wi 'pattern' file.txt # Match only word 'pattern', not bigger words with 'pattern' in them
grep -oi 'pattern' file.txt  # Only words --only-matching

grep -E 'pattern1|pattern2' file.txt            # Use extended regex to search for multiple patterns
egrep -w '[A-Z][a-z]{2}'



# REGEX : regular expressions

^	#The line begins with
$	#The line ends with
.	#Match any ONE character
\	#Escaping for special characters
*	#Match the previous element 0 or more times
+	#Match the previous element 1 or more time
{}	#Previous element can exist "this many" times
?	#Make the previous element optional
|	#Match one thing or the other
[]	#Ranges or sets
()	#Subexpressions
[^]	#Negated ranges or sets

grep -Er == egrep -r


^ The line begins with
# Lists only lines that are not comments
grep -v '^#' file
# Lists only PASS lines
grep '^PASS' /etc/login.defs 


$ The line ends with
grep '7$' file
grep 'mail$' file


. Match any ONE character
# Will match cat, cut etc...
grep -r 'c.t' /etc/


\ Escaping for special characters
# Will look for dots .
grep '\.' file


* Match the previous elements 0 or more times 
# Begins with /; has 0 or more characters between; ends with /
grep -r '/.*/' /etc/


+ Match previous elements 1 or more times

grep -r '0+' /etc/


{} Previous element can exist 'this many' times 
# Will show 3+ '0' next to each other
egrep -r '0{3,}' /etc/

# 1 + 0to3 occurences of '0'
egrep -r '10{,3}' /etc/

# Exactly 3 occurences of 0
egrep -r '0{3}' /etc/


? Make previous element optional 
# Will show disable, disabled, disables etc...
egrep -r 'disabled?' /etc/


| Match one thing or the other
egrep -ir 'enabled?|disabled?' /etc/


[] Ranger or sets 
[a-z][0-9][abz954]

egrep -r 'c[au]t' /etc/

egrep -r '/dev/[a-z]*' /etc/

# ? at the end to match entries ending not only with numbers
egrep -r '/dev/[a-z]*[0-9]?' /etc/


() Subexpressions
egrep -r '/dev/([a-z]*[0-9]?)*'

egrep -r '/dev/(([a-z]|[A-Z])*[0-9]?)*' /etc/



[^] Negates ranges or sets 

egrep -r 'http[^s]' /etc/

# Not lowercase letters
egrep -r '/[^a-z]' /etc/

