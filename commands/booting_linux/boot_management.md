grub-install # Install GRUB to a device
grub-mkconfig # Generate a GRUB configuration file
update-grub # Update GRUB configuration

# GRUB – GRand Unified Bootloader
grub-install /dev/sda                   # Install GRUB bootloader to the MBR of /dev/sda
update-grub                             # Update GRUB configuration file (Debian/Ubuntu)
grub2-mkconfig -o /boot/grub2/grub.cfg  # Generate a new GRUB configuration file (RHEL/CentOS)
grub-editenv list                       # List GRUB environment variables
grub2-reboot 0                          # Set GRUB to boot the first menu entry on next reboot


# Linux Command Documentation
## GRUB Commands Overview
### grub-install
**Description:** Installs the GRUB bootloader to a specified device.  
**Usage:** `grub-install [options] <device>`
**Examples:** 1. Install GRUB to `/dev/sda`: ```bash sudo grub-install /dev/sda ``` 2. Install GRUB to a specific partition: ```bash sudo grub-install /dev/sda1 ```
**Options:** - `--boot-directory=<dir>`: Specify a boot directory. - `--no-floppy`: Ignore floppy devices.
---
### grub-mkconfig
**Description:** Generates a GRUB configuration file based on scripts found in `/etc/grub.d`.  
**Usage:** `grub-mkconfig [options] -o <output_file>`
**Examples:** 1. Generate the GRUB configuration file: ```bash sudo grub-mkconfig -o /boot/grub/grub.cfg ``` 2. Generate config for a specific architecture: ```bash sudo grub-mkconfig -o /boot/grub/grub.cfg --target=x86_64-efi ```
**Options:** - `--output=<file>`: Specify the output file for the configuration.
---
### update-grub
**Description:** A convenience script that invokes `grub-mkconfig` to update the GRUB configuration file.  
**Usage:** `update-grub [options]`
**Examples:** 1. Update the GRUB configuration: ```bash sudo update-grub ``` 2. Force a re-check of all OS installations: ```bash sudo update-grub --force ```
---
### End of Documentation
