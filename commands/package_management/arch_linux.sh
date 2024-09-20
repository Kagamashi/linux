#!/bin/bash

pacman                                   # Package manager utility for Arch Linux

# pacman – Package manager utility for Arch Linux
pacman -Syu                              # Synchronize packages and update the system
pacman -S <package_name>                 # Install a package
pacman -R <package_name>                 # Remove a package
pacman -Ss <search_term>                 # Search for a package in the repositories
pacman -Qi <package_name>                # Show information about an installed package
pacman -Qdt                              # List orphaned packages (not required by any installed package)
pacman -Rns <package_name>               # Remove a package and its unused dependencies
