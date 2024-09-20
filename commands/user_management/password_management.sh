#!/bin/bash

passwd                                   # Update user passwords
chage                                    # Change user password expiry information

# passwd – Update user passwords
passwd <username>                        # Change the password for a specific user
passwd                                   # Change the password for the current user

# chage – Change user password expiry information
chage -l <username>                      # List password expiration information for a user
chage -E 2025-12-31 <username>           # Set account expiration date for a user
chage -M 30 <username>                   # Set the maximum number of days before a password must be changed
chage -m 5 <username>                    # Set the minimum number of days between password changes
