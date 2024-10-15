#!/bin/bash

# ----------------------
# CPU USAGE
# ----------------------

# Check CPU load and uptime
uptime                                      # Displays how long the system has been running and CPU load averages.
# Example output:
# 12:34:56 up 1:23,  3 users,  load average: 0.15, 0.30, 0.25
# - 0.15: Load average for the last 1 minute.
# - 0.30: Load average for the last 5 minutes.
# - 0.25: Load average for the last 15 minutes.

lscpu                                       # Shows detailed information about the CPU, including architecture, cores, threads, and more.

# Monitor CPU usage in real-time
top                                         # Displays real-time system information, including CPU usage by processes.
htop                                        # An interactive version of 'top' (requires installation).

# ----------------------
# MEMORY USAGE
# ----------------------

# Check memory usage
free -h                                     # Displays memory usage in a human-readable format (MB, GB).
# Example output:
#               total        used        free      shared  buff/cache   available
# Mem:           7.8G        1.2G        5.0G        120M        1.6G        6.2G
# Swap:          2.0G          0B        2.0G

# Explanation:
# - "Mem" shows total, used, and available RAM.
# - "Swap" shows total, used, and free swap memory.

# ----------------------
# DISK USAGE & FILESYSTEMS
# ----------------------

# Check total and available space on file systems
df                                           # Displays disk space usage for all mounted file systems.
df -h                                        # Displays disk usage in a human-readable format (MB, GB).

# Example:
df -h
# Output:
# Filesystem      Size  Used Avail Use% Mounted on
# /dev/sda1        50G   20G   28G  42% /

# Check disk usage for a specific directory
du -sh /bin/                                 # Displays disk usage of the "/bin/" directory in a summarized, human-readable format.

# tmpfs (Temporary File System)
# tmpfs is a temporary file system that stores files in volatile memory (RAM). It’s faster but does not persist after reboot.
df -h | grep tmpfs                           # View information about tmpfs file systems.

# ----------------------
# SYSTEM MONITORING
# ----------------------

# Check hardware information (PCI devices)
lspci                                        # Lists all PCI devices, such as network cards and GPUs.

# Check process resource usage in real-time
top                                          # Displays real-time resource usage by processes (CPU, memory, etc.).

# View the dependency tree for services
systemctl list-dependencies service_name     # Lists the dependencies of a service.
systemctl list-dependencies --reverse service_name  # Lists which services depend on the given service.

# Service Status Lights:
# - Green: The service is running.
# - White: The service is stopped.

# ----------------------
# FILESYSTEM INTEGRITY & REPAIRS
# ----------------------

# Repair an XFS file system (XFS is a high-performance journaling file system in Linux)
sudo xfs_repair -v /dev/vdb1                 # Repairs an XFS filesystem on the device `/dev/vdb1`.
# -v = Verbose mode (more detailed output).

# Repair an EXT4 file system (EXT4 is a commonly used Linux file system)
sudo fsck.ext4 -v -f -p /dev/vdb2            # Repairs an EXT4 filesystem on the device `/dev/vdb2`.
# -v = Verbose mode for detailed output.
# -f = Force a check, even if the filesystem is reported as healthy.
# -p = Preen mode, automatically fixes some simple problems.

# ----------------------
# SUMMARY OF KEY COMMANDS
# ----------------------

# CPU
uptime                                       # Shows how long the system has been running and CPU load averages.
lscpu                                        # Displays detailed CPU information.

# Memory
free -h                                      # Displays memory (RAM) usage in a human-readable format.
top                                          # Real-time resource monitoring (CPU, memory, and more).

# Disk Usage
df -h                                        # Displays total and available disk space on file systems in human-readable format.
du -sh /path/to/dir                          # Shows disk usage of a specific directory in summarized format.

# Filesystem Integrity
sudo xfs_repair -v /dev/vdb1                 # Repair an XFS filesystem.
sudo fsck.ext4 -v -f -p /dev/vdb2            # Repair an EXT4 filesystem.

# Service Dependencies
systemctl list-dependencies service_name     # Lists dependencies of a specific service.
systemctl list-dependencies --reverse service_name  # Lists services that depend on the given service.
