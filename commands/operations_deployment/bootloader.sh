
# Grub2 is default bootloader

vi /etc/default/grub

info -f grub -n 'Simple configuration' # configuration information
man 7 bootparam

ls -larth /sys/firmware # firmware before compilation
grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg # if EFI
grub2-mkconfig -o /boot/grub2/grub.cfg # if not EFI

reboot now # no errors during compilation