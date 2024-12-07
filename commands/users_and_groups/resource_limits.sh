
ulimit    # built-in shell command to display and set resource limits for the current shell session

ulimit -a                    # display all resource limits for the current user session
ulimit -n                    # maximum number of open file descriptors
ulimit -u                    # maximum number of processes a user can create
ulimit -n 2048               # set the soft limit for the maximum number of open files (2048)
ulimit -u 100                # set the soft limit for the maximum number of processes (100)
ulimit -Hn 4096              # set the hard limit for open files to 4096
ulimit -Hu 200               # set the hard limit for the number of processes to 200
