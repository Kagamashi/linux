#!/bin/bash
grub-install
grub-mkconfig
update-grub

# GRUB (GRand Unified Bootloader) is a bootloader package that allows users to choose among multiple operating systems on startup.

# grub-install – Install GRUB to a device
grub-install /dev/sda                  # Install GRUB to the specified disk (e.g., /dev/sda)
grub-install --boot-directory=/boot /dev/sda1  # Install GRUB to a specific partition
grub-install --target=x86_64-efi --efi-directory=/boot/efi /dev/sda  # Install for UEFI systems

# grub-mkconfig – Generate a GRUB configuration file
grub-mkconfig -o /boot/grub/grub.cfg   # Generate a GRUB configuration file at the specified location
grub-mkconfig -o /boot/grub/grub.cfg --no-floppy  # Generate config file without floppy support
grub-mkconfig -o /boot/grub/grub.cfg -v  # Generate config file with verbose output

# update-grub – Update GRUB configuration
update-grub                             # Update the GRUB configuration based on current operating systems
update-grub --debug                     # Run update-grub with debug information
update-grub --force                     # Force the detection of operating systems

# Backup current configuration
cp /boot/grub/grub.cfg /boot/grub/grub.cfg.bak  # Backup existing GRUB configuration

# Reboot into GRUB menu
# sudo reboot                             # Reboot to access the GRUB menu
