#!/bin/bash

# PACKAGE MANAGEMENT
# yum, dnf, apt, .deb, .rpm


# Using Package Managers
# yum – Package manager for RPM-based distributions (e.g., CentOS, RHEL)
# List installed packages
yum list installed                   # List all installed packages

# Install a package
yum install <package_name>           # Install a package (e.g., yum install httpd)

# Remove a package
yum remove <package_name>            # Remove a package (e.g., yum remove httpd)

# Update all packages
yum update                           # Update all packages to the latest version

# dnf – Package manager for RPM-based distributions (e.g., Fedora, CentOS 8, RHEL 8)
# List installed packages
dnf list installed                   # List all installed packages

# Install a package
dnf install <package_name>           # Install a package (e.g., dnf install httpd)

# Remove a package
dnf remove <package_name>            # Remove a package (e.g., dnf remove httpd)

# Update all packages
dnf update                           # Update all packages to the latest version

# apt – Package manager for Debian-based distributions (e.g., Ubuntu)
# List installed packages
apt list --installed                 # List all installed packages

# Install a package
apt install <package_name>           # Install a package (e.g., apt install apache2)

# Remove a package
apt remove <package_name>            # Remove a package (e.g., apt remove apache2)

# Update all packages
apt update                           # Update package lists from repositories
apt upgrade                           # Upgrade all packages to the latest version


# Adding Repositories
# Adding a repository for yum/dnf (e.g., EPEL for CentOS/RHEL)
# Create a new repository file in /etc/yum.repos.d/
echo -e "[epel]\nname=Extra Packages for Enterprise Linux 7 - $basearch\nbaseurl=https://mirror.example.com/epel/7/$basearch/\nenabled=1\ngpgcheck=1\ngpgkey=https://mirror.example.com/epel/RPM-GPG-KEY-EPEL-7" > /etc/yum.repos.d/epel.repo

# Adding a repository for apt (e.g., PPA for Ubuntu)
# Add a PPA repository
add-apt-repository ppa:<ppa_name>   # Example: add-apt-repository ppa:deadsnakes/ppa

# Update package lists
apt update                           # Update package lists to include new repository


# Working with .deb or .rpm Files
# For .deb files (Debian-based systems)
# Install a .deb package
dpkg -i <package_name>.deb           # Install a .deb package
apt-get install -f                   # Fix missing dependencies

# Remove a .deb package
dpkg -r <package_name>               # Remove a .deb package

# For .rpm files (RPM-based systems)
# Install an .rpm package
rpm -i <package_name>.rpm            # Install an .rpm package

# Remove an .rpm package
rpm -e <package_name>                # Remove an .rpm package

# Verify an .rpm package
rpm -V <package_name>                # Verify an .rpm package for integrity

