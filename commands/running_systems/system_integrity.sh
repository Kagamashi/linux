
## CPU usage
uptime                                      # displays how long the system has been running and CPU load averages
# 12:34:56 up 1:23,  3 users,  load average: 0.15, 0.30, 0.25
# - 0.15: load average for the last 1 minute
# - 0.30: load average for the last 5 minutes
# - 0.25: load average for the last 15 minutes

lscpu                                       # shows detailed information about the CPU, including architecture, cores, threads, and more.
top                                         # displays real-time system information, including CPU usage by processes
htop                                        # interactive version of 'top' (requires installation)


## MEMORY usage
free -h                                     # displays memory usage in a human-readable format (MB, GB)
#               total        used        free      shared  buff/cache   available
# Mem:           7.8G        1.2G        5.0G        120M        1.6G        6.2G
# Swap:          2.0G          0B        2.0G

# - "Mem" shows total, used, and available RAM
# - "Swap" shows total, used, and free swap memory


## DISK USAGE/FILESYSTEMS
df                                           # displays disk space usage for all mounted file systems
df -h                                        # displays disk usage in a human-readable format (MB, GB)
# Filesystem      Size  Used Avail Use% Mounted on
# /dev/sda1        50G   20G   28G  42% /

du -sh /bin/                                 # displays disk usage of "/bin/" directory

# tmpfs (Temporary File System) is a temporary file system that stores files in volatile memory (RAM)
df -h | grep tmpfs                           # view information about tmpfs file systems


## SYSTEM MONITORING
lspci                                               # lists all PCI devices, such as network cards and GPUs
top                                                 # displays real-time resource usage by processes (CPU, memory, etc.)
systemctl list-dependencies service_name            # lists the dependencies of a service
systemctl list-dependencies --reverse service_name  # lists which services depend on the given service

# Service Status Lights:
#   * Green: service is running
#   * White: service is stopped


## FILESYSTEM INTEGRITY
sudo xfs_repair -v /dev/vdb1                 #rRepairs an XFS filesystem on the device `/dev/vdb1`.
# -v = verbose mode (more detailed output)

sudo fsck.ext4 -v -f -p /dev/vdb2            # repairs an EXT4 filesystem on the device `/dev/vdb2`
# -v = verbose mode for detailed output
# -f = force a check, even if the filesystem is reported as healthy
# -p = preen mode, automatically fixes some simple problems
