
useradd                                 # add new users
usermod                                 # modify user accounts
userdel                                 # delete a user account
passwd                                  # update user passwords
chage                                   # change user password expiry information
id                                      # display user identity
who                                     # show who is logged on
whoami                                  # print the current user
last                                    # show a listing of last logged in users
groups                                  # show group memberships
finger                                  # user information lookup

useradd $user                          # add new user named "$user"
useradd -m $user                       # add new user and create a home directory
useradd -s /bin/bash $user             # specific shell
useradd -u 1100 $user                  # specific USER ID
useradd --system sysacc                # create system account intended for programs (no home directory)
useradd -d /home/otherdirectory/ $user # adds user with different home directory

usermod -aG groupname $user            # Add "$user" to an existing group
usermod -d /home/user $user            # Change the home directory of "$user"
usermod -l $user oldusername           # Change the username from "oldusername" to "$username"
usermod -s /bin/othershell $user       # Change shell for '$user'
usermod -L/--lock $user                # Lock user; user will no longer be able to log in with password (but can with ssh)
usermod -U/--unlock
usermod -e 2021-12-10 $user            # Set expire date for $user; date format YEAR-MONTH-DAY
usermod -e "" $user                    # Remove expire date
sudo usermod -aG sudo username         # Add a user to the "sudo" group, granting them sudo privileges.

userdel $user                       # Delete the user "$user"
userdel -r $user                    # Delete the user and their home directory

passwd $user                        # Change the password for a specific user
passwd                              # Change the password for the current user

chage -l $user                      # List password expiration information for a user
chage -E 2025-12-31 $user           # Set account expiration date for a user
chage -M 30 $user                   # Set the maximum number of days before a password must be changed
chage -M -1 $user                   # Password never expires
chage -m 5 $user                    # Set the minimum number of days between password changes
chage -d 0 $user                    # Set expire date of password for right now
chage -d -1 $user                   # Unexpire the password (revert previous chage)

id                                  # Show the user ID (UID) and group ID (GID)
id $user                            # Show the UID and GID for a specific user

who                                 # List users currently logged into the system

whoami                              # Display the username of the current user

last                                # Show the last logged in users
last -n 10                          # Show the last 10 logged in users

groups                              # Show the groups for the current user
groups $user                        # Show the groups for a specific user

finger $user                        # Display information about a specific user
finger                              # Show information about all users
