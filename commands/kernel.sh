
# display kernel information
uname -r                              # show the kernel release version
uname -a                              # show all system and kernel information

# show kernel and OS information
hostnamectl                           # display kernel version, hostname, architecture, etc.

# kernel ring buffer messages (for debugging hardware or drivers)
dmesg | less                          # view kernel log messages
dmesg | grep -i error                 # search for errors in kernel messages

# display kernel version
cat /proc/version                     # show the running kernel version

lsmod                                 # list all currently loaded kernel modules

sudo modprobe modulename              # load a kernel module
sudo modprobe -r modulename           # unload a kernel module

sudo insmod /path/to/module.ko        # insert a specific kernel module (.ko file)

sudo rmmod modulename                 # unload/remove a kernel module

sudo depmod -a                        # update module dependency list

modinfo modulename                    # display detailed information about a kernel module

# view and configure kernel parameters
sysctl -a                                              # display all kernel parameters
sudo sysctl parameter=value                             # set a kernel parameter temporarily
sudo sysctl -w parameter=value                         # write kernel parameter values
echo "parameter=value" | sudo tee -a /etc/sysctl.conf  # make parameter changes permanent

# rebuild initramfs (initial RAM disk)
sudo mkinitramfs -o /boot/initrd.img-$(uname -r) $(uname -r)  # rebuild initramfs for current kernel

# update GRUB to include new kernels
sudo update-grub                      # rebuild GRUB configuration after kernel updates

# view kernel logs using systemd journal
journalctl -k                         # display kernel log messages
journalctl -k -b                      # show kernel logs from the current boot

# view kernel parameters from /proc/sys
cat /proc/sys/kernel/hostname         # read kernel parameter (example: system hostname)


### Kernel Compilation and Upgrades
# open kernel configuration menu before compilation
make menuconfig                       # open the terminal-based kernel configuration menu

# compile the kernel and modules
make                                  # compile the kernel after configuration

# install kernel modules after compilation
make modules_install

# install the compiled kernel
make install

# Ubuntu/Debian Kernel Management
sudo apt install linux-image-<version>   # Install a new kernel version
sudo apt autoremove --purge              # Remove old kernel versions
