#!/bin/bash

# Man pages and info
# man, info, apropos

# man – Display Manual Pages
man ls                                  # Display the manual page for the ls command
man 5 passwd                            # Display the manual page for the passwd file format (section 5)
man -k "network"                        # Search for manual pages related to "network"
man -f grep                             # Show a short description of the grep command from the manual

# info – Display Info Documentation
info coreutils                           # Display the info documentation for coreutils
info gzip                                # Display the info documentation for gzip
info --index-search "compression"       # Search for "compression" in the info index
info --apropos "directory"              # Search for entries related to "directory" in info

# apropos – Search the Manual Page Names and Descriptions
apropos "file"                           # Search for manual pages related to "file"
apropos -s 1 "command"                  # Search for manual pages in section 1 related to "command"
apropos -r "pattern"                    # Use a regular expression to search for manual pages related to "pattern"
