# In the /opt/findme/ directory you will find 10,000 files. You need to filter out specific files
# 1. Find all files that have the executable permission bit enabled for the user that owns them. Redirect the output of the find command to the /opt/foundthem.txt file.
# 2. Find all files that have the SETUID permission enabled and delete them.
# 3. Find any file that is larger than 1KB and copy it to the /opt/ directory

find /opt/findme/ -perm /u=x -type f | sudo tee /opt/foundthem.txt

sudo find /opt/findme/ -type f -perm /u=s -exec rm {} \;

sudo find /opt/findme/ -type f -size +1k -exec cp {} /opt/ \;


# --------------------------

# Perform the following two tasks:
# 1. Create a bash script that recursively copies the /var/www/ directory into the /opt/www-backup/ directory
#    Save your script at /opt/script.sh. Remember, the script file you create also has to be executable.
# 2. Make sure that your script /opt/script.sh automatically runs every day at 4AM. More specifically, create a cron job that runs that script every day at 4AM. Put this in the system-wide cron table (not root's local cron table) and make sure the script executes under the root user.

#!/bin/bash
cp -a /var/www/. /opt/www-backup/

sudo chmod +x /opt/script.sh

sudo vi /etc/crontab
0 4 * * *      root     /opt/script.sh


# --------------------------

# Enforce some limits on two users:
# 1. Set a limit on the user called john so that he can open no more than 30 processes. This should be a hard limit.
# 2. For the user called jane make sure she can create files not larger than 1024 kilobytes. Make this a soft limit.

/etc/security/limits.conf 

john hard nproc 30
jane soft fsize 1024


# --------------------------

# Create a new user on this system called mary
# - Set her password to 1234.
# - Leave the full name and other personal details empty.
# - Set her default shell to /bin/dash.
# - Make sure she can execute sudo commands by adding her to the secondary group called sudo.
# - At this point Mary's primary group is mary. And her secondary group is sudo. Change her primary group to developers. Without affecting her secondary group.

sudo useradd -m -s /bin/dash mary

echo "mary:1234" | sudo chpasswd # set password

sudo usermod -aG sudo mary

sudo usermod -g developers mary


# --------------------------

# Modify the following kernel runtime parameter:
#   1. vm.swappiness set it to a value of 10. 
#   This should be a persistent change, added to a file so that vm.swappiness is set to 10 every time the system boots up. 
#   However, after you create the proper file, also set this runtime parameter to 10 for this session as well. 
#   Otherwise said, the file will set the parameter to 10 the next time the system boots up, but we want to set it to 10 even for this current, active session, instead of waiting until the next boot until that takes effect.

sudo sysctl vm.swappiness=10 #current session 

echo "vm.swappiness=10" | sudo tee /etc/sysctl.d/99-swappiness.conf #persistent


# --------------------------

# You have an xfs filesystem on /dev/vdb1. 
# Also, there's an ext4 filesystem on /dev/vdb2.
# 1. Edit the correct file in /etc/ so that /dev/vdb1 is automatically mounted into the /backups directory every time the system boots up. 
#   Default mount options should be used.
# 2. /dev/vdb2 is already mounted in /mnt/. But there is a problem. 
# Sensitive data exists on this ext4 filesystem and you want to make sure that it's not accidentally modified. 
# To solve this problem, remount /dev/vdb2 into the /mnt directory, but this time, with the read-only mount option. 
# It does not matter what the other mount options are. 
# Just make sure this mount point is read-only so that users cannot change contents on this filesystem.

# /etc/fstab
/dev/vdb1    /backups    xfs    defaults    0    2

sudo mount -o remount,ro /dev/vdb2 /mnt


# --------------------------

# Use the Logical Volume Manager to perform the following tasks:
# 1. Add /dev/vdc and /dev/vdd as Physical Volumes to LVM.
# 2. Create a Volume Group on these two physical volumes. Call the volume volume1.
# 3. On the Volume Group called volume1 create a new Logical Volume. Call this Logical Volume website_files. Set the size of the Logical Volume to 3GB.

# Physical Volume
sudo pvcreate /dev/vdc /dev/vdd

# Volume Group
sudo vgcreate volume1 /dev/vdc /dev/vdd

# Logical Volume
sudo lvcreate -n website_files -L 3G volume1


# --------------------------

# In your home directory you will find a subdirectory called kode. Git tools are pre-installed. Switch to the kode subdirectory and perform the following tasks:
# 1. Initialize this subdirectory as an empty Git repository.
# 2. Associate this local Git repository with the remote repository found at https://github.com/kodekloudhub/git-for-beginners-course.git. Add this as a remote repository and call it (alias it as) origin.
# 3. Download all the latest changes from the master branch from that remote repository into your local repository.

cd ~/kode
git init

git remote add origin https://github.com/kodekloudhub/git-for-beginners-course.git

git pull origin master


# --------------------------

# A Docker container is running on node01. Perform the following tasks:
# 1. Stop and remove the container that is currently running, since it's not configured correctly.
# 2. In your home directory you will find a subdirectory called kode_web. It contains all the necessary build instructions for Docker. Use that directory to build a new Docker image. Call this image kodekloudwebserv.
# 3. Finally, launch a container based on the kodekloudwebserv image. In your command, make sure that all connections incoming to port 8081 on the host are redirected to port 80 of the container. Call this container webserver2.

# Credentials to access node01:
# Name: bob
# Password: caleston123

ssh node01

docker rm webserver1 --force

bob@node01:~/kode_web$ docker build -t kodekloudwebserv .

docker run --detach --publish 8081:80 --name webserver2 kodekloudwebserv


# --------------------------




# --------------------------





# --------------------------





# --------------------------




# --------------------------





# --------------------------





# --------------------------




# --------------------------





# --------------------------





# --------------------------




# --------------------------





# --------------------------





# --------------------------




# --------------------------





# --------------------------





# --------------------------




# --------------------------





# --------------------------





# --------------------------




# --------------------------





# --------------------------





# --------------------------




# --------------------------





# --------------------------





# --------------------------




# --------------------------





# --------------------------





# --------------------------




# --------------------------





# --------------------------





# --------------------------




# --------------------------





# --------------------------





# --------------------------




# --------------------------





# --------------------------





# --------------------------




# --------------------------





# --------------------------





# --------------------------




# --------------------------





# --------------------------





# --------------------------
