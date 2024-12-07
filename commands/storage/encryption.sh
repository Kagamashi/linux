

### Creating and Managing Encrypted Volumes with LUKS
# install cryptsetup (if not already installed)
sudo apt install cryptsetup -y             # Ubuntu/Debian
sudo yum install cryptsetup -y             # CentOS/RHEL

sudo cryptsetup luksFormat /dev/sda1       # initialize LUKS on /dev/sda1 (careful: this wipes data)
sudo cryptsetup open /dev/sda1 secure_vol  # decrypt /dev/sda1 and map it to /dev/mapper/secure_vol
sudo mkfs.ext4 /dev/mapper/secure_vol      # format the decrypted volume with ext4
sudo mount /dev/mapper/secure_vol /mnt     # mount the volume to /mnt


### Unlocking and Mounting Encrypted Disks
sudo cryptsetup open /dev/sda1 secure_vol  # open the encrypted volume as secure_vol
sudo mount /dev/mapper/secure_vol /mnt     # mount the decrypted volume to /mnt
sudo umount /mnt                           # unmount the volume
sudo cryptsetup close secure_vol           # close the encrypted volume


### Managing Passphrases for Encrypted Disks
sudo cryptsetup luksAddKey /dev/sda1       # add an additional passphrase to the LUKS volume
sudo cryptsetup luksRemoveKey /dev/sda1    # remove a passphrase from the LUKS volume
sudo cryptsetup luksDump /dev/sda1         # display the LUKS header information for the encrypted volume
