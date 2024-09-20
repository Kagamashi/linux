#!/bin/bash

# KERNEL MODULE MANAGEMENT
# lsmod, modprobe, insmod, rmod, /etc/modprobe.d/

# Listing and Loading Kernel Modules
# lsmod – List Loaded Kernel Modules
echo "lsmod – List Loaded Kernel Modules"
echo "lsmod                                # Display all currently loaded kernel modules"
echo "lsmod | grep <module_name>           # Search for a specific module in the list"

# modprobe – Load/Unload Modules with Dependencies
echo "modprobe – Load/Unload Modules with Dependencies"
echo "modprobe <module_name>               # Load a kernel module and its dependencies"
echo "modprobe -r <module_name>            # Unload a kernel module and its dependencies"

# insmod – Insert Module into the Kernel
echo "insmod – Insert Module into the Kernel"
echo "insmod /path/to/module.ko            # Insert a kernel module manually (without dependencies)"
echo "dmesg | tail -n 10                  # View the latest kernel messages for module insertion errors"

# rmmod – Remove Module from the Kernel
echo "rmmod – Remove Module from the Kernel"
echo "rmmod <module_name>                  # Remove a kernel module (fails if the module is in use)"
echo "dmesg | tail -n 10                  # View the latest kernel messages for module removal errors"


# Configuring Kernel Module Options
# /etc/modprobe.d/ – Directory for Module Configuration Files
echo "/etc/modprobe.d/ – Directory for Module Configuration Files"
echo "ls /etc/modprobe.d/                  # List configuration files for kernel modules"
echo "cat /etc/modprobe.d/blacklist.conf   # View the blacklist configuration (modules to be excluded)"
echo "echo 'options <module_name> <option=value>' > /etc/modprobe.d/<module_name>.conf  # Add module options"
echo "update-initramfs -u                  # Update the initramfs after modifying module configurations"

