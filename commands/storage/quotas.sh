
### Enabling and Configuring Disk Quotas
# install quota package (if not already installed)
sudo apt install quota -y                # Ubuntu/Debian
sudo yum install quota -y                # CentOS/RHEL

# enable quotas on a specific filesystem via /etc/fstab
echo "/dev/sda1 / ext4 defaults,usrquota,grpquota 0 1" | sudo tee -a /etc/fstab  # enable user and group quotas for ext4 filesystem

# remount the filesystem to apply changes
sudo mount -o remount /                  # remount the root filesystem (or any other with quotas enabled)

# initialize the quota files
sudo quotacheck -cug /                   # create and check quota files for user and group quotas on the root filesystem

# turn quotas on
sudo quotaon /                           # enable quotas on the root filesystem (or any other specified filesystem)


### Set and Manage Quotas for Users and Groups
sudo edquota username                    # edit quota for user (opens a text editor)
sudo edquota -g groupname                # edit quota for group (opens a text editor)


### Viewing and Managing Quotas
quota -u username                        # display quota usage for 'username'
quota -g groupname                       # display quota usage for 'groupname'
sudo repquota /                          # report quota usage for users and groups on the root filesystem
sudo quotaoff /                          # disable quotas on the root filesystem
