#!/bin/bash

# ----------------------
# Redirection & Overwrite
# ----------------------
> file                              # Create or empty a file.
1> file                             # Redirect standard output (stdout) to "file" (overwrite).

# ----------------------
# Redirection & Append
# ----------------------
>> file                             # Append to a file instead of overwriting.
1>> file                            # Redirect stdout and append to "file".

# ----------------------
# Standard Input, Output, and Error
# ----------------------
stdin  # Standard input: receives input (usually from the keyboard or a file).
stdout # Standard output: sends normal output (usually to the screen).
stderr # Standard error: sends error messages (usually to the screen).

# Standard Input < (reads input from a file)
< file                              # Redirect input from "file".

# Standard Output > and 1> (writes output to a file)
> file                              # Redirect output to "file" (overwrite).
1> file                             # Same as >, explicitly redirects stdout.

# Standard Error 2> (writes error messages to a file)
2> errors.txt                       # Redirects stderr to "errors.txt".

# ----------------------
# REDIRECTING OUTPUT
# ----------------------
# Discard output using /dev/null
# /dev/null is often used to get rid of unnecessary output.

# Suppress errors only (stderr)
grep -r 'pattern' /etc/ 2>/dev/null  # Suppresses only error messages, displaying normal output.

# Suppress normal output only (stdout)
grep -r 'pattern' /etc/ > /dev/null  # Suppresses normal output, but errors will still appear.

# Discard all output (both stdout and stderr)
grep -r 'pattern' /etc/ &> /dev/null # Suppresses both normal output and error messages.

# ----------------------
# REDIRECTING INPUT
# ----------------------

# From file (using <)
sendemail someone@example.com < emailcontent.txt  # Sends the content of "emailcontent.txt" as input.

# From a Here Document (Heredoc)
# Allows input of multiple lines.
sort <<EOF
apple
banana
cherry
EOF

# Using Heredoc with a command:
cat <<EOF > message.txt
This is a message
that spans multiple lines.
EOF

# ----------------------
# Combining Input and Output
# ----------------------

# Whole output is going to one file (mix of normal and error messages)
grep -r 'The' /etc/ > output.txt 2>&1  # Redirects both stdout and stderr to "output.txt".
grep -r 'The' /etc/ 1> output.txt 2>&1 # Equivalent to the above.

# Separate normal output and errors into different files
grep -r 'pattern' /etc/ 1> results.txt 2> errors.txt

# Redirecting output to multiple places using 'tee'
ls | tee file_list.txt                 # Writes the output of "ls" to the screen and "file_list.txt".
ls | tee -a file_list.txt              # Appends to "file_list.txt" instead of overwriting.

# ----------------------
# Advanced Redirection
# ----------------------

# Redirecting using custom file descriptors
exec 3> custom_log.txt                 # Opens a custom file descriptor 3 for writing.
echo "Logging this" >&3                # Writes to file descriptor 3.
exec 3>&-                              # Closes file descriptor 3.

# Using Here String (<<<)
# Provides a string as input.
grep "word" <<< "This is a string input."

# Example: Filter specific lines and redirect to a file
grep -r 'The' /etc/ | sort | uniq > sorted_unique.txt
