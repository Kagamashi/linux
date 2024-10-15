#!/bin/bash

yum                                      # Package manager for RPM-based distributions (now mostly dnf)
dnf                                      # Newer package manager for RPM-based distributions
rpm                                      # RPM package manager

# For RedHat/CentOS 7 and older, use YUM. For newer versions, use DNF (YUM is still available as a wrapper).

# yum – Package manager for RPM-based distributions (deprecated)
yum check-update                         # Check for available package updates
yum install <package_name>               # Install a package
yum remove <package_name>                # Remove a package
yum search <search_term>                 # Search for a package
yum info <package_name>                  # Display information about a package

# dnf – Newer package manager for RPM-based distributions
dnf check-update                         # Check for available package updates
dnf install <package_name>               # Install a package
dnf remove <package_name>                # Remove a package
dnf search <search_term>                 # Search for a package
dnf info <package_name>                  # Display information about a package
dnf upgrade                               # Upgrade all installed packages

# rpm – RPM package manager
rpm -ivh <package_file.rpm>              # Install an RPM package
rpm -e <package_name>                    # Remove an installed package
rpm -q <package_name>                    # Query if a package is installed
rpm -qa                                   # List all installed packages
rpm -qpi <package_file.rpm>              # Display package information without installing
