# Advanced Storage Management in Linux

## 1. Automating Mounts with /etc/fstab

### What is `/etc/fstab`?
- The **`/etc/fstab`** file contains a list of filesystems to be mounted at boot time. It defines the device, mount point, filesystem type, and mount options for each entry.

### Configuring `/etc/fstab`
- To automate mounting of a partition, an entry needs to be added to `/etc/fstab`. The general syntax is:
<device> <mount point> <filesystem> <options> <dump> <fsck order>
- **Device**: The partition or device (e.g., `/dev/sda1`).
- **Mount point**: The directory where the partition will be mounted (e.g., `/mnt`).
- **Filesystem**: The filesystem type (e.g., `ext4`, `xfs`).
- **Options**: Mount options like `defaults`, `rw` (read/write), `ro` (read-only), `noauto` (don't mount at boot), `exec` (allow execution of binaries), etc.
- **Dump**: 0 or 1, used by the `dump` backup utility.
- **Fsck order**: Determines the order in which filesystems are checked at boot (0 to disable).

### Common Mount Options
- **defaults**: Use the default mount options (read/write, execute allowed, auto-mount, etc.).
- **rw**: Mount the filesystem as read/write.
- **ro**: Mount the filesystem as read-only.
- **noauto**: Do not mount the filesystem at boot.
- **exec/noexec**: Allow or disallow the execution of binaries.

### Mounting Filesystems Automatically
- To automatically mount a partition at boot, add the appropriate line to `/etc/fstab`:
/dev/sda1 /mnt ext4 defaults 0 2
- This will mount the `/dev/sda1` partition to `/mnt` with default options when the system boots.
- To immediately apply changes to `/etc/fstab`, use the `mount -a` command.

---

## 2. Swap Management

### What is Swap?
- **Swap** is disk space used when the system runs out of physical memory (RAM). When the system's memory is full, inactive pages are moved to swap space to free up RAM.

### Creating and Configuring Swap
- **Swap Partitions**: A dedicated partition on the disk used for swap space. You can create a swap partition during installation or manually using tools like `fdisk` or `parted`.
- **Swap Files**: If you don’t want to create a dedicated partition for swap, you can create a swap file:
- Use `fallocate` to create the file, `chmod` to set the correct permissions, `mkswap` to initialize it, and `swapon` to activate it.

### Managing Swap Space
- **Checking Active Swap**: Use `swapon --show` to see active swap partitions and files.
- **Activating Swap**: Use `swapon /swapfile` to enable a swap file or partition.
- **Deactivating Swap**: Use `swapoff /swapfile` to deactivate swap.

### Adding Swap to `/etc/fstab`
- To ensure the swap file or partition is activated at boot, add an entry to `/etc/fstab`:
/swapfile none swap sw 0 0

- This ensures the swap file is used automatically when the system boots.

### Modifying Swap Settings
- **Swappiness**: Controls how aggressively the kernel uses swap space. Lower values reduce the likelihood of swapping, while higher values increase swap usage.
- To adjust swappiness temporarily:
  ```
  sudo sysctl vm.swappiness=10
  ```
- To make the change permanent, add it to `/etc/sysctl.conf`:
  ```
  vm.swappiness=10
  ```
