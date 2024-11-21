#!/bin/bash

# ----------------------
# Kernel Information
# ----------------------

# Display kernel information
uname -r                              # Show the kernel release version
uname -a                              # Show all system and kernel information

# Show kernel and OS information
hostnamectl                           # Display kernel version, hostname, architecture, etc.

# Kernel ring buffer messages (for debugging hardware or drivers)
dmesg | less                          # View kernel log messages
dmesg | grep -i error                 # Search for errors in kernel messages

# Display kernel version
cat /proc/version                     # Show the running kernel version

# ----------------------
# Kernel Modules
# ----------------------

# List loaded kernel modules
lsmod                                 # List all currently loaded kernel modules

# Load and unload kernel modules
sudo modprobe modulename              # Load a kernel module
sudo modprobe -r modulename           # Unload a kernel module

# Insert a kernel module
sudo insmod /path/to/module.ko        # Insert a specific kernel module (.ko file)

# Remove a kernel module
sudo rmmod modulename                 # Unload/remove a kernel module

# Recalculate module dependencies
sudo depmod -a                        # Update module dependency list

# Show module information
modinfo modulename                    # Display detailed information about a kernel module

# ----------------------
# Kernel Configuration and Management
# ----------------------

# View and configure kernel parameters
sysctl -a                             # Display all kernel parameters
sudo sysctl parameter=value           # Set a kernel parameter temporarily
sudo sysctl -w parameter=value        # Write kernel parameter values
echo "parameter=value" | sudo tee -a /etc/sysctl.conf  # Make parameter changes permanent

# Rebuild initramfs (initial RAM disk)
sudo mkinitramfs -o /boot/initrd.img-$(uname -r) $(uname -r)  # Rebuild initramfs for current kernel

# Update GRUB to include new kernels
sudo update-grub                      # Rebuild GRUB configuration after kernel updates

# ----------------------
# Kernel Logs and Debugging
# ----------------------

# View kernel logs using systemd journal
journalctl -k                         # Display kernel log messages
journalctl -k -b                      # Show kernel logs from the current boot

# View kernel parameters from /proc/sys
cat /proc/sys/kernel/hostname         # Read kernel parameter (example: system hostname)

# ----------------------
# Kernel Compilation and Upgrades
# ----------------------

# Open kernel configuration menu before compilation
make menuconfig                       # Open the terminal-based kernel configuration menu

# Compile the kernel and modules
make                                  # Compile the kernel after configuration

# Install kernel modules after compilation
make modules_install

# Install the compiled kernel
make install

# ----------------------
# Kernel Upgrades and Management (Package Managers)
# ----------------------

# Ubuntu/Debian Kernel Management
sudo apt install linux-image-<version>   # Install a new kernel version
sudo apt autoremove --purge              # Remove old kernel versions

# RHEL/CentOS Kernel Management
sudo yum install kernel-<version>        # Install a new kernel
sudo yum remove kernel-<version>         # Remove old kernel versions
