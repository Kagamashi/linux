# Basic Storage Management in Linux

## 1. Partitioning and Filesystems

### Partitioning Tools
- **fdisk**: A tool for creating and modifying **MBR** partitions. It supports up to 4 primary partitions or 3 primary + 1 extended partition.
- **parted**: Used for managing both **MBR** and **GPT** partitions. GPT supports more than 4 partitions and is used on modern systems.
- **gdisk**: Used specifically for **GPT** partition management, similar to `fdisk` but designed for GPT.

### Creating, Modifying, and Deleting Partitions
- **MBR** and **GPT** are partition table formats. **MBR** supports 2TB disk size with up to 4 primary partitions, while **GPT** supports disks larger than 2TB and unlimited partitions.
- Use **fdisk** for MBR partition management and **parted** for GPT partitioning.
- When creating partitions, tools like `fdisk` or `parted` allow you to define the partition type (e.g., primary, extended) and the filesystem to use (ext4, XFS, Btrfs, etc.).

### Creating Filesystems
- Once a partition is created, you must format it with a filesystem:
  - **ext4**: A popular Linux filesystem.
  - **XFS**: Known for its scalability, often used in enterprise environments.
  - **Btrfs**: A newer filesystem offering advanced features like snapshots.
  
- The **mkfs** command is used to create filesystems:
  - `mkfs.ext4` for ext4.
  - `mkfs.xfs` for XFS.
  - `mkfs.btrfs` for Btrfs.

---

## 2. Mounting Filesystems and fstab

### Mounting Filesystems
- **Mounting** is the process of making a filesystem accessible by attaching it to a directory in the root filesystem (like `/mnt`).
  - Use `mount` to attach a partition to a directory and `umount` to unmount it.
  - To make sure a filesystem is mounted automatically on boot, add it to `/etc/fstab`. The `/etc/fstab` file contains information about all the filesystems, their mount points, and options.

### Filesystem Labels and UUIDs
- **blkid** and **lsblk** show device attributes like **UUIDs** (Universally Unique Identifiers) and **labels** for filesystems.
  - UUIDs are preferred in `/etc/fstab` for mounting because they uniquely identify the filesystem, avoiding issues with device renaming.
  - Filesystems can also be labeled for easy reference with tools like `e2label` for ext4 and `xfs_admin` for XFS.

---

## 3. Filesystem Management

### Checking Filesystem Integrity
- **fsck** (File System Consistency Check) is used for checking and repairing filesystems (e.g., ext4).
  - For **XFS** filesystems, use `xfs_repair`.
  - Filesystems should be unmounted before running checks to avoid data corruption.

### Resizing Filesystems
- Filesystems can be resized after their partition is resized:
  - **ext4**: Use `resize2fs` to resize ext4 partitions, whether increasing or decreasing size.
  - **XFS**: Can only be grown while mounted, using `xfs_growfs`. XFS does not support shrinking.
