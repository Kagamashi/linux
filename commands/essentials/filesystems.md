
## BLOCK DEVICE
type of hardware or virtual device that provide block-level access to data
data on block devices is stored in fixed-size blocks (usually 512bytes or 4KB)

Examples:
- hard drives (HDDs)
- solid-state drives (SSDs)
- USB drives
- virtual disks in VMs (/dev/sda, /dev/xvdf..)

Block devices are represented in /dev as special files:
- /dev/sda: first SATA or SCSI disk
- /dev/xvdf: block device in cloud environment like AWS

Block devices must be formatted with a filesystem to store files in structured way


## FILESYSTEM
method/structure used to organize and manage data on storage devices
defines how files and directories are named,stored,accessed,manipulated on a block device

- organize data into files/directories
- keep metadata (file permissions,timestamps,ownership)
- manage free space/allocate blocks for files
- provide an interface for users/applications to access data

Examples:
- Linux-native filesystems: ext4, xfs, btrfs
- Cross-platform filesystems: FAT32, exFAT, NTFS
- Special-purpose filesystems: tmpfs, iso9660

# Example workflow:
1. Attach block device /dev/sdb
2. Partition device if needed (use fdisk/parted)
3. Create filesystem on partition
   mkfs.ext4 /dev/sdb1
4. Mount filesystem to a directory
   mount /dev/sdb1 /mnt/data
5. Use directory /mnt/data to store files


# ext4 (Fourth Extended Filesystem)
- journaling for data integrity
- support large file sized (up to 16TB)
- maximum filesystem size: 1EiB
- backward compatibility with ext3/ext2
*- default filesystem for many Linux distributions*

# xfs
- efficient handling of large files and high I/O workloads
- online resizing (expanding, not shrinking)
*- good for high-performance servers, enterprise storage*

# btrfs (B-Tree Filesystem0)
- advanced features: snapshots, subvolumes, checksums
- RAID support built-in
- Copy-on-Write (CoW) for efficient storage
*- systems required advanced features like backups/versioning*

# FAT32
- legacy filesystem
- no journaling, not suitable for modern systems
- compatible across platforms (Linux, Windows, macOS)
*- external drives, USB sticks*
