#!/bin/bash

id                                       # Display user identity
who                                      # Show who is logged on
whoami                                    # Print the current user
last                                      # Show a listing of last logged in users
groups                                    # Show group memberships
finger                                    # User information lookup

# id – Display user identity
id                                        # Show the user ID (UID) and group ID (GID)
id <username>                             # Show the UID and GID for a specific user

# who – Show who is logged on
who                                       # List users currently logged into the system

# whoami – Print the current user
whoami                                    # Display the username of the current user

# last – Show a listing of last logged in users
last                                      # Show the last logged in users
last -n 10                                # Show the last 10 logged in users

# groups – Show group memberships
groups                                    # Show the groups for the current user
groups <username>                         # Show the groups for a specific user

# finger – User information lookup
finger <username>                        # Display information about a specific user
finger                                    # Show information about all users
