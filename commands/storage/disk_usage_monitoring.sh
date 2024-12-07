
df                                      # report file system disk space usage
du                                      # estimate file space usage
iostat                                  # report CPU and I/O statistics
tune2fs                                 # adjust tunable file system parameters on ext2/ext3/ext4

df -h                                   # show disk space usage in human-readable format
df -i                                   # show inode usage for all file systems

du -h                                   # show disk usage of the current directory in human-readable format
du -sh /path/to/dir                     # show total disk usage of a specific directory
du -h --max-depth=1                     # show disk usage for directories up to a depth of 1
du -a /path/to/dir                      # show disk usage for all files and directories

iostat                                  # display CPU and I/O statistics for all devices
iostat -x 1                             # continuously report extended I/O statistics every second

tune2fs -l /dev/sda1                    # show the superblock information of the specified filesystem
tune2fs -o journal_data /dev/sda1       # set the journaling mode of the filesystem
