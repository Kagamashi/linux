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

# NFS server and client tools are installed on caleston-lp10 system. Instruct the NFS server to share the /home directory in read-only mode with IP addresses in the 10.0.0.0/24 CIDR range.

# /etc/exports
/home 10.0.0.0/24(ro)

# apply changes made in /etc/exports
sudo exportfs -ra


# --------------------------

# Find the application that is accepting incoming connections on port 80. Make note of the exact name of that application. You will need it later on.
# As you investigated what application is accepting incoming connections to port 80, you might have noticed that two or more PIDs are associated with that. 
# Basically, the application has forked multiple processes to do its job. Figure out which PID is associated with the master process.
# With both of these things noted, create the following file: /opt/process.txt.
# - On the first line add the name of the application associated with port 80, in all lowercase letters.
# - On the second line add the PID number associated with the master process.

sudo lsof -i :80 #which app is listening on port 80

pgrep -a nginx #find master process of app


# --------------------------

# Explore your network settings and perform the following tasks:
# 1. There is currently one network interface which does not have any IPv4 address associated with it. Temporarily assign it the following IPv4 address: 10.5.0.1/24. This should not be a permanent change (no need to edit configuration files).
# 2. What is the default route for this system? Create a file, and add a single line where you save the IP address for the gateway used by this default route (i.e., requests are routed to what IP address?). Save the address in this file: /opt/gateway.txt.
# 3. For the final task, find out what is the IP address of the main DNS resolver configured for this system. Create the file /opt/dns.txt and add a single line to it with that IP address

ip addr #which network interface lacks IP address

sudo ip addr add 10.5.0.1/24 dev eth1

ip route show default

cat /etc/resolv.conf #DNS config


# --------------------------

# There is a another virtual machine with name node01 is available for you. Perform this task on node01. You can access the node by ssh
#     username: bob
#     Host- node01
#     Password- caleston123 

# You can identify the disk because it is currently unpartitioned, not mounted anywhere, and is 2 GB in size.
# Disk /dev/vdb is unpartitioned, not mounted anywhere, and is 2 GB in size.
# - Create two partitions of equal size on this disk: 500M each. Ignore about remaining 1GB partition.
# - Create an ext4 filesystem on the first partition.
# - Create an xfs filesystem on the second partition.
# - Create two directories: /part1 and /part2.
# - Manually mount the ext4 filesystem in the /part1 directory. Manually mount the xfs filesystem in the /part2 directory.
# - Also, configure the system to automatically mount these the same way, every time the operating system boots up.

lsblk #list block devices and find block device without any partitions

echo -e "g\nn\n\n\n+500M\nn\n\n\n+500M\nn\n\n\n\nw" | sudo fdisk /dev/vdb

sudo mkfs.ext4 /dev/vdb1
sudo mkfs.xfs /dev/vdb2

sudo mkdir /part1
sudo mkdir /part2

sudo mount /dev/vdb1 /part1
sudo mount /dev/vdb2 /part2

# /etc/fstab
/dev/vdb1    /part1    ext4    defaults    0    2
/dev/vdb2    /part2    xfs    defaults    0    2


# --------------------------

# Configure the system to use /swfile as a swap file on node01.
# 1. First, create /swfile. Make the size of this file exactly 1024 MB.
# 2. Then take all the necessary steps to temporarily mount this as swap. (So that it's immediately used as swap for this current boot session).
# 3. But also make sure to configure the system to also use this as swap every time it will boot up in the future.

# Credentials to access node01:
# Name: bob
# Password: caleston123

ssh node01
sudo fallocate -l 1024M /swfile # create swap file of 1024MB

sudo chmod 600 /swfile

sudo mkswap /swfile # setup file as Linux swap area

sudo swapon /swfile # activate swap file

# /etc/fstab
/swfile none swap sw 0 0


# --------------------------

# On node01two processes are overusing our storage device. One is executing a lot of I/O operations per second (small data transfers, but a very large number of such transfers). Otherwise said, the process has a high tps/IOPS. The other process is reading very large volumes of data.
# 1. Identify the process with the high tps. What partition is it using? Create the file /opt/devname.txtand write the device name of that partition inside that file. For example, if it's using /dev/vde5, you would simply write /dev/vde5 on a single line in that file. Note that there might be some abstractions behind this, and we're not interested in device mapper names, but rather, the real device the mapper is using.
# 2. Identify the process with the high read transfer rate/second. Create the file /opt/highread.pid and write the PID number of that process in that file. For example, if the PID is 3886 you just write 3886 in that file (only the number, on a single line).

# Credentials to access node01:
#     Name: bob
#     Password: caleston123

To identify the process with high TPS and the partition it is using, follow the steps below:
    - Run the sudo dstat --top-io --top-bio command to get the process name with I/O activity.
    - Run the pgrep python3 command to get the PID of the process.
    - Run sudo lsof -p <PID> to list the open files by the process.
    - Run sudo lsof -p <PID> | awk '{print $9}' | while read file; do df $file; done to get the device details.
    - Find the actual partition used by running the pvs command and store the actual device name in /opt/devname.txt.

sudo pidstat -d 1


# --------------------------

# On node01 list all filesystems to check out how much free space they have remaining. You'll find one which is almost full (should be around 98% full). 
# To confirm it is the correct filesystem, see where it is mounted, and you should find many directories on it in the form of numbers from 1 to 999.
# Find the directory which has the largest file and delete that file (only that file, nothing else).

# get largest file
bob@node01:~$ sudo find /data -type f -exec du -h {} + | sort -rh | head -n 1
196M    /data/683/lf

sudo rm -rf /data/683/lf


# --------------------------

# On caleston-lp10 change the configuration for the SSH daemon. Disable X11 forwarding globally. Then, make an exception for just one user called bob. 
# For that user alone enable X11 forwarding.
# Do not restart the SSH service after making the changes.

# /etc/ssh/sshd_config
X11Forwarding no

Match User bob
    X11Forwarding yes


# --------------------------

# Configure the system to use the following NTP pools:
#     0.europe.pool.ntp.org
#     1.europe.pool.ntp.org
# Next, change the timezone of this system to Europe, Bucharest.

# /etgc/systemd/timesyncd.conf
[Time]
NTP=0.europe.pool.ntp.org 1.europe.pool.ntp.org

sudo systemctl restart systemd-timesyncd

sudo timedatectl set-timezone Europe/Bucharest


# --------------------------

# Add a cron job for the user called john. Don't use the system-wide crontable, but rather add it to the personal crontable of the user called john.
# Make sure that this cron job runs every Wednesday at 4AM. The command it should execute is find /home/john/ -type d -empty -delete.
# Switch back to the bob user once the task is done.

sudo su john

crontab -e #edit crontab
0 4 * * 3 find /home/john/ -type d -empty -delete


# --------------------------

# There is a network interface on this system which has the IP address 10.5.5.2 associated with it. 
# What is the name of this network interface? Create a file in /opt/interface.txt and add a single line to it containing the exact name of that interface.

ip -o -4 addr list | grep '10.5.5.2' | awk '{print $2}' |sudo  tee /opt/interface.txt


# --------------------------

# An administrator added a new user called jane to this system. But a few mistakes were made. Fix the following problems:
# 1. The administrator wanted to allow jane to run sudo commands. But instead of adding "jane" to the secondary/supplemental "sudo" group, the administrator changed the primary group to sudo. Fix this by doing the following: Set the primary/login group back to the group called jane. And add the user to the secondary/supplemental group called sudo. In essence the primary group for the user called "jane" should be "jane". And the secondary group should be "sudo".
# 2. Currently, the home directory path for the jane user is set correctly. But the directory itself is missing. Fix this by creating the /home/jane/ directory. Make sure that the directory is owned by the jane user and jane group.
# 3. The default shell for the user called jane is set to /bin/sh. Change the default shell to /bin/bash.
# 4. Finally, set the password for jane to 1234.

sudo usermod -g jane jane

sudo usermod -aG sudo jane #add user jane to secondary group 'sudo'

sudo mkdir -p /home/jane
sudo chown jane:jane /home/jane

sudo usermod -s /bin/bash jane

echo 'jane:1234' | sudo chpasswd


# --------------------------

# Perform the following tasks:
# 1. Set up a port redirection rule that does the following: it redirects any IPv4 packet from the 10.5.5.0/24 CIDR range incoming on port 81 to another machine with the IP address 192.168.5.2 on port 80. To simplify this task, you are not required to specify input or output network interfaces.
# 2. Don't forget to add the proper masquerading rule so that packets redirected from 10.5.5.0/24 have a way of getting back to that sender, by our machine sitting in the middle and acting as an ad-hoc router between those two networks.
# 3. Make sure that after you add the rules you make them persistent (so that when the machine is rebooted these changes are not lost).

# port redirection rule
sudo iptables -t nat -A PREROUTING -p tcp -s 10.5.5.0/24 --dport 81 -j DNAT --to-destination 192.168.5.2:80

# masquerading rule
sudo iptables -t nat -A POSTROUTING -s 10.5.5.0/24 -j MASQUERADE

# make iptables rules persistent
sudo apt install iptables-persistent


# --------------------------

# In /home/bob/certs/ directory you will find 4 files. That's because we generated two self-signed TLS certificates for you. Delete the 2 files containing the private keys. But preserve the certificate files.
# At this point you're left with 2 files containing 2 separate certificates. They both use the RSA algorithm. But one is using 2048 bits for its cryptography purposes, while the other is using 4096. Delete the certificate that is using 2048 bits

openssl x509 -in file* -noout -text #To find out which files are not a certificate, run the below command, and if you get output as Unable to load certificate, then it is a key

openssl x509 -in file* -noout -text | grep "Public-Key"


# --------------------------

# There is a file at /opt/aclfile. Currently no one has permissions to read, write, or execute this file, not even root. But instead of working with regular permissions, use ACL for this task. Add the following to the access control list:
# The user called janet should be able to read and write to /opt/aclfile. Just read and write, no execute permission for this ACL entry.

sudo setfacl -m u:janet:rw /opt/aclfile


# --------------------------

# Add two security limits to the configuration of this system:
# 1. The user called janet should have a hard`` limit so that she can't open more than100processes.
# 2. The group called mail should have a soft limit so users in the group not be able to create files larger than 8192 kilobytes.

# /etc/security/limits.conf
janet hard nproc 100
@mail soft fsize 8192


# --------------------------

# In your home directory you will find a subdirectory called project. Navigate to it and then do the following:
# 1. Add file1 to the staging area to prepare it for a future commit.
# 2. Commit this file with the exact following message: Created first required file.
# 3. Now upload your changes to the remote repository already associated with your local repository. Everything is already set up for you. Use the remote repository aliased as origin and upload the master branch and password to push the code is C0ntr0lplan3Pa$$wd.

cd /home/bob

touch file1
git add file1

git commit -m "Created first required file"
git push origin master


# --------------------------

# Perform the following tasks related to SELinux on node01:
# 1. First, check if SELinux is running in enforcing, permissive, or disabled mode. Create the file /opt/selinuxmode.txt. And write your answer to that file. Just one line where you write a single word: enforcing, permissive, or disabled, according to the status you found.
# 2. There is a file that has the wrong SELinux type label. Please correct that and restore the default SELinux label for the file at /usr/bin/less.

# Credentials to access node01:
#     Name: bob
#     Password: caleston123



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
