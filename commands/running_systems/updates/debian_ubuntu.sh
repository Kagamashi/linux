
apt                                      # High-level package manager
apt-get                                  # Low-level package handling utility
dpkg                                     # Debian package manager

apt update                               # Update the package list
apt upgrade                              # Upgrade all installed packages
apt install <package_name>               # Install a package
apt remove <package_name>                # Remove a package
apt search <search_term>                 # Search for a package
apt show <package_name>                  # Show details about a package

apt-get update                           # Update the package list
apt-get upgrade                          # Upgrade all installed packages
apt-get install <package_name>           # Install a package
apt-get remove <package_name>            # Remove a package
apt-get autoremove                       # Remove unnecessary packages
apt-get -f install                       # Fix broken dependencies

dpkg -i <package_file.deb>              # Install a .deb package file
dpkg -r <package_name>                   # Remove a package
dpkg -l                                  # List all installed packages
dpkg -s <package_name>                   # Show the status of a package
dpkg-reconfigure <package_name>          # Reconfigure an already installed package
