######################
# ESSENTIAL COMMANDS #
######################

# Open the file under /home/student/textreferences/editme.txt and complete the following tasks:
  # 1. Move line 7777 to line 1.
  # 2. Remove line 7000.
  # 3. Replace every occurrence of the word Earth shown with an uppercase E, with the word Globe.
  # 4. Add a new line at the very end of the document that contains Auctores Varii.

# Solution using COMMANDS:
sed -n '7777p' /home/student/textreferences/editme.txt > /tmp/temp_line.txt
sed -i '7777d' /home/student/textreferences/editme.txt
sed -i '1r /tmp/temp_line.txt' /home/student/textreferences/editme.txt
sed -i '7000d' /home/student/textreferences/editme.txt
sed -i 's/\bEarth\b/Globe/g' /home/student/textreferences/editme.txt
echo "Auctores Varii" >> /home/student/textreferences/editme.txt

# Solution using VIM text editor:
:7777
yy #copy
dd #delete
gg #top of the file
p #paste at the top

:7000
dd #delete

:%s/\<Earth\>/Globe/g

G #end of file
o #insert mode
Auctores Varii
:wq

# ____________________________________________ #

# Working with archives and compressed files is an integral part of the System Administrator’s job.
# Perform the following tasks to demonstrate your ability to work with archives and compressed files:
# 1. Extract all files from archive file /opt/SAMPLE001.zip into target directory /opt/SAMPLE001
# 2. Create a tar archive file /opt/SAMPLE0001.tar containing all files in the directory /opt/SAMPLE001
# 3. Compress the tar archive file /opt/SAMPLE0001.tar using the bzip2 compression algorithm
# 4. Compress the tar archive file /opt/SAMPLE0001.tar using the xz compression algorithm
# Make sure that the uncompressed archive file /opt/SAMPLE0001.tar is not removed after creating the compressed versions of the archive file!

sudo mkdir -p /opt/SAMPLE001
sudo unzip /opt/SAMPLE001.zip -d /opt/SAMPLE001

sudo tar -cf /opt/SAMPLE0001.tar -C /opt SAMPLE001

sudo bzip2 -k /opt/SAMPLE0001.tar

sudo xz -k /opt/SAMPLE0001.tar

#Verify
ls -lh /opt/SAMPLE0001.*
tar -tf /opt/SAMPLE0001.tar #verify contents of tar archive
bzip2 -t /opt/SAMPLE0001.tar.bz2 #verify compressed file
xz -t /opt/SAMPLE0001.tar.xz

# ____________________________________________ #

# A data directory is not used anymore and is about to be archived.
# You have been asked to identify and remove some files,before archiving takes place.
# Perform the following tasks to demonstrate your ability to search for files given various criteria:
# 1. Find all executable files in the directory /srv/SAMPLE002 and remove them
# 2. Find all files in the directory /srv/SAMPLE002, which have not been accessed during the last month and remove them
# 3. Find all empty directories in the directory /srv/SAMPLE002 and remove them
# 4. Find all files in the directory /srv/SAMPLE002 with a file extension of .tar. 
# Write a list of matching filenames, one per line, to the file /opt/SAMPLE002/toBeCompressed.txt, which has already been created. 
# Ensure that you specify a relative path to each file, using /srv/SAMPLE001 as the base directory for the relative path

find /src/SAMPLE002 -type f -executable
find /srv/SAMPLE002 -type f -executable -exec rm -f {} \;

find /src/SAMPLE002 -type f -atime +30 #last 30 days
find /src/SAMPLE002 -type f -atime +30 -exec rm -f {} \;

find /src/SAMPLE002 -type d -empty
find /src/SAMPLE002 -type d -empty -exec rmdir {} \;

find /srv/SAMPLE002 -type f -name "*.tar" -printf "%P\n" > /opt/SAMPLE002/toBeCompressed.txt

#Verify
find /srv/SAMPLE002 -type f -executable
find /srv/SAMPLE002 -type f -atime +30
find /srv/SAMPLE002 -type d -empty
cat /opt/SAMPLE002/toBeCompressed.txt

# ____________________________________________ #


#############################
# USER AND GROUP MANAGEMENT #
#############################

# Linux administrators are responsible for the creation, deletion, and the modification of groups, as well as the group membership.
# Complete the following tasks to demonstrate your ability to create and manage groups and group membership:
# 1. Create the computestream group.
# 2. Create a computestream folder in /exam/.
# 3. Make the computestream group the owner of the /exam/computestream folder.

sudo groupadd computestream
sudo mkdir -p /exam/computestream
sudo chgrp computestream /exam/computestream

# Verify
ls -ld /exam/computestream

# ____________________________________________ #

# Create a candidate user account with the password cert456.
# Modify the sudo configuration to let the candidate account access root privileges with no password prompt.

sudo useradd -m candidate
echo "candidate:cert456" | sudo chpasswd

sudo visudo #edit sudoers file
candidate ALL=(ALL) NOPASSWD:ALL
# user - allows user to execute commands as any user/group - passwordless sudo access

# Verify
su - candidate
sudo whoami #expected output: root

# ____________________________________________ #

# Configure the system so that an empty NEWS file is automatically created in the home directory of any new user.

sudo touch /etc/skel/NEWS
ls -l /etc/skel/NEWS

# Verify
sudo useradd -m testuser
ls -l /home/testuser/NEWS

# ____________________________________________ #

# Create a group called students.

sudo groupadd students

# Verify
getent group students

# ____________________________________________ #

# Create a new user account with the following attributes:
# ● Username is harry.
# ● Password is magic.
# ● This user’s home directory is defined as /home/school/harry/.
# ● This new user is a member of the existing students group.
# ● The /home/school/harry/binaries/ directory is part of the PATH variable.

sudo useradd -m -d /home/school/harry -G students harry
echo "harry:magic" | sudo chpasswd

sudo mkdir -p /home/school/harry/binaries
sudo chown harry:students /home/school/harry/binaries

echo 'export PATH=$PATH:/home/school/harry/binaries' | sudo tee -a /home/school/harry/.bashrc
SUDO -u harry bash -c "source /home/school/harry/.bashrc" # reload .bashrc file

#Verify
id harry
sudo -u harry bash -c "echo $PATH" #check if binaries dir is part of PATH
ls -ld /home/school/harry

# ____________________________________________ #

# Create a user account with username sysadmin with the following attributes:
# ● Use a password of science.
# ● This user’s home directory is defined as /sysadmin/.
# ● sysadmin has sudo privileges and will not be prompted for a password when using the sudo command.
# ● The default shell for this user is zsh.

sudo useradd -m -d /sysadmin -s /usr/bin/zsh sysadmin
echo "sysadmin:science" | sudo chpasswd

sudo visudo
sysadmin ALL=(ALL) NOPASSWD:ALL

grep sysadmin /etc/passwd #confirm default shell

# Verify 
su - sysadmin #switch to sysadmin user
sudo whoami
echo $SHELL

# ____________________________________________ #

# Ensure that all users can invoke the last command and access a list of users who previously logged in.

ls -l /var/log/wtmp

sudo chmod 644 /var/log/wtmp
sudo chown root:utmp /var/log/wtmp

last #display list of users who previously logged in

# ____________________________________________ #

# Correct the projectadmin user account so that logins are possible using the password _onetime43_. 
# Set the home directory to /home/projectadmin.

getent passwd projectadmin #Verify if user exists in the system
sudo useradd -m -d /home/projectadmin -s /bin/bash projectadmin #If not, create the user

echo "projectadmin:_onetime43_" | sudo chpasswd
sudo usermod -d /home/projectadmin -m projectadmin

sudo usermod -U projectadmin #unlock user account
sudo usermod -s /bin/bash projectadmin 

# Verify
getend passwd projectadmin
su - projectadmin #enter new password to confirm login works
echo $HOME

# ____________________________________________ #

# Alter the devel user account so that it can log into the system with a working bash shell environment.

grep devel /etc/passwd
sudo usermod -s /bin/bash devel
grep devel /etc/passwd

sudo mkdir -p /home/devel #ensure home directory exists
sudo chown devel:devel /home/devel

su - devel #verify bash functionality
echo $SHELL 

#Verify
sudo cp /etc/skel/.bashrc /home/devel/.bashrc
sudo chown devel:devel /home/devel/.bashrc

su - devel
source ~/.bashrc

# ____________________________________________ #


##############
# NETWORKING #
##############

# Find the name of the service which uses TCP port 2605, as documented in /etc/services,
# and write the service name to the file /home/student/port-2605.txt. 
# Find all of the ports used for TCP services IMAP3 and IMAPS, again as documented
# in /etc/services, and write those port numbers to the file /home/student/imap-ports.txt.

grep -w "2605/tcp" /etc/services | awk '{print $1}' > /home/student/port-2605.txt
grep -E "^(imap3|imaps)[[:space:]]" /etc/services | grep "/tcp" | awk '{print $2}' | cut -d'/' -f1 > /home/student/imap-ports.txt

#Verify
cat /home/student/port-2605.txt
cat /home/student/imap-ports.txt

# ____________________________________________ #


######################
# STORAGE MANAGEMENT #
######################

# The following tasks may be achieved using the user student’s sudo privileges:
# 1. Temporarily mount the filesystem available on /dev/xvdf2 under /mnt/backup/.
# 2. Decompress and unarchive the /mnt/backup/backup-primary.tar.bz2 archive into /opt/. 
# This should result in a new directory (created from the archive itself) named /opt/proddata/.

sudo mkdir -p /mnt/backup
sudo mount /dev/xvdf2 /mnt/backup
df -h | grep /mnt/backup

sudo mkdir -p /opt
sudo tar -xjf /mnt/backup/backup-primary.tar.bz2 -C /opt
ls -l /opt/proddata

sudo umount /mnt/backup
df -h | grep /mnt/backup

# ____________________________________________ #

# Configure the swap partition /dev/xvdi1 so that it does not become attached automatically at boot time.

sudo swapoff /dev/xvdi1
sudo swapon --show #if xvdi1 no longer appears in output it's disabled

sudo nano /etc/fstab
/dev/xvdi1 none swap sw 0 0 # comment or remove this line

#Verify
sudo reboot
sudo swapon --show

# ____________________________________________ #

# Configure the system so that the existing filesystem that corresponds to /staging gets persistently mounted in read-only mode

df -hT | grep /staging

sudo nano /etc/fstab

# look for entry related to /staging
/dev/sdb1   /staging   ext4   defaults,ro   0   0

sudo mount -o remount,ro /staging # ro = read-only
mount | grep /staging

sudo reboot
mount | grep /staging # verify /staging is still mounted in read-only mode

# ____________________________________________ #


################################
# OPERATION OF RUNNING SYSTEMS #
################################

# Create a bash shell script named certscript.sh under /home/student/apps/.
# ● Make sure the script can be invoked as ./certscript.sh.
# ● The first line of output from the script should consist of the name of the user who invoked it.
# ● The second line of output should contain the IP address of the default gateway.

cd /home/student/apps
nano certscript.sh

#!/bin/bash
# Output the name of the user who invoked the script
echo "User: $(whoami)"
# Output the IP address of the default gateway
echo "Default Gateway: $(ip route | grep default | awk '{print $3}')"

chmod +x certscript.sh
./certscript.sh

# ____________________________________________ #

# Install the tmux package on your system.

# Ubuntu/Debian
sudo apt update
sudo apt install -y tmux
tmux -V

#RHEL/CentOS/Fedora
sudo dnf update
sudo dnf install -y tmux
tmux -V

#(alternative) build from source
sudo apt install -y gcc make libevent-dev libncurses-dev
wget https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz
tar -xzf tmux-3.3a.tar.gz
cd tmux-3.3a
./configure
make
sudo make install
tmux -V

# ____________________________________________ #

# Create a cron job that kills all processes named scan_filesystem which is owned by root, every minute.

sudo nano /usr/local/bin/kill_scan_Filesystem.sh

#!/bin/bash
# Find and kill all processes named 'scan_filesystem' owned by root
pkill -u root -f scan_filesystem

sudo chmox +x /usr/local/bin/kill_scan_filesystem.sh

sudo crontab -e
* * * * * /usr/local/bin/kill_scan_filesystem.sh # this will run script every minute

#Verify
sudo crontab -l
ps aux | grep scan_filesystem
