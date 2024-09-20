#!/bin/bash

# PERFORMANCE MONITORING
# top, htop, vmstat, iotop, iostat, iftop, nload


# CPU, Memory, and Disk Usage Monitoring
# top – Display dynamic real-time information about system processes
top                                  # Show real-time system information including CPU, memory usage, and running processes

# htop – An interactive process viewer (requires installation)
# htop provides a more user-friendly interface compared to top
htop                                  # Show an interactive view of system processes and resource usage

# vmstat – Report virtual memory statistics
# Provides information about system memory, swap, I/O, and CPU usage
vmstat 1                              # Display system performance statistics every 1 second

# iotop – Display I/O usage by processes (requires installation)
# Show which processes are performing the most I/O operations
iotop -o                              # Display processes with ongoing I/O operations


# Disk I/O Performance
# iostat – Report CPU and I/O statistics
# Display I/O statistics for devices
iostat                                 # Show average I/O statistics for all devices
iostat -x 1                            # Show extended I/O statistics every 1 second


# Network Performance
# iftop – Display bandwidth usage on an interface (requires installation)
# Monitor network traffic in real-time and display bandwidth usage
iftop -ni <interface>                 # Replace <interface> with the network interface (e.g., eth0)

# nload – Monitor network traffic and bandwidth usage (requires installation)
# Provide a visual representation of incoming and outgoing traffic
nload                                  # Show network traffic and bandwidth usage for all interfaces
