#!/bin/bash

ulimit # built-in shell command to display and set resource limits for the current shell session.


ulimit -a                                 # Display all resource limits for the current user session.
ulimit -n                                 # Maximum number of open file descriptors.
ulimit -u                                 # Maximum number of processes a user can create.
ulimit -n 2048                            # Set the soft limit for the maximum number of open files (2048).
ulimit -u 100                             # Set the soft limit for the maximum number of processes (100).
ulimit -Hn 4096                           # Set the hard limit for open files to 4096.
ulimit -Hu 200                            # Set the hard limit for the number of processes to 200.
