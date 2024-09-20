#!/bin/bash

# Understanding the Boot Process and Boot Loaders

# GRUB – GRand Unified Bootloader
echo "GRUB – GRand Unified Bootloader"
echo "grub-install /dev/sda                   # Install GRUB bootloader to the MBR of /dev/sda"
echo "update-grub                            # Update GRUB configuration file (Debian/Ubuntu)"
echo "grub2-mkconfig -o /boot/grub2/grub.cfg # Generate a new GRUB configuration file (RHEL/CentOS)"
echo "grub-editenv list                      # List GRUB environment variables"
echo "grub2-reboot 0                         # Set GRUB to boot the first menu entry on next reboot"

# Troubleshooting Boot Issues

# dracut – Generate an initramfs Image
echo "dracut – Generate an initramfs Image"
echo "dracut --force                         # Regenerate the initramfs image (default location /boot/initramfs-$(uname -r).img)"
echo "dracut -f /boot/initramfs-$(uname -r).img $(uname -r) # Forcefully create an initramfs image for the current kernel version"

# initramfs – Initial RAM Filesystem
echo "initramfs – Initial RAM Filesystem"
echo "ls /boot/initramfs-$(uname -r).img     # List the initramfs image for the current kernel version"
echo "zcat /boot/initramfs-$(uname -r).img | less # View the contents of the initramfs image (compressed filesystem)"

# Single-User Mode – Boot into Single-User Mode for Maintenance
echo "Single-User Mode – Boot into Single-User Mode for Maintenance"
echo "1. Reboot the system."
echo "2. At the GRUB menu, press 'e' to edit the boot parameters."
echo "3. Add 'single' or '1' to the end of the kernel line (e.g., 'linux /vmlinuz-... ro quiet splash single')"
echo "4. Press Ctrl+X or F10 to boot."
echo "5. Perform maintenance tasks (e.g., filesystem checks, password resets)."

