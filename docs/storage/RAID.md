# RAID (Redundant Array of Independent Disks) in Linux

## 1. RAID Levels

### RAID 0 (Striping)
- **RAID 0** splits data across multiple disks to increase performance. There is **no redundancy**, so if one disk fails, all data is lost.
  - **Use case**: High-performance needs where data loss isn't critical (e.g., temporary storage).
  - **Benefit**: Increased read/write performance through striping.

### RAID 1 (Mirroring)
- **RAID 1** mirrors data across two or more disks. If one disk fails, the other can take over without data loss.
  - **Use case**: Critical systems where data redundancy is required (e.g., operating system partitions).
  - **Benefit**: Provides redundancy with no performance loss in read operations, but write performance may be slightly degraded.

### RAID 5 (Striping with Parity)
- **RAID 5** uses striping along with parity distributed across the disks, providing fault tolerance. It requires at least 3 disks and can tolerate the failure of one disk.
  - **Use case**: Systems that require both improved performance and redundancy (e.g., file servers).
  - **Benefit**: Provides fault tolerance with more usable disk space than RAID 1.

### RAID 6 (Striping with Double Parity)
- **RAID 6** extends RAID 5 by adding an additional parity block, allowing for the failure of up to 2 disks. It requires at least 4 disks.
  - **Use case**: Enterprise systems that require higher fault tolerance (e.g., critical databases).
  - **Benefit**: Higher redundancy than RAID 5, at the cost of slightly lower performance and storage efficiency.

### RAID 10 (Combination of RAID 1 + RAID 0)
- **RAID 10** combines mirroring and striping, requiring at least 4 disks. It provides the redundancy of RAID 1 and the performance boost of RAID 0.
  - **Use case**: High-performance applications that also require redundancy (e.g., high-transaction databases).
  - **Benefit**: Provides both performance and redundancy, though it requires more disks.

---

## 2. Software RAID with mdadm

### Setting Up Software RAID
- **mdadm** is the tool used to create and manage software RAID arrays in Linux.
  - You can create different types of RAID arrays (e.g., RAID 0, 1, 5, 6, 10) using the `mdadm --create` command.
  - RAID arrays are identified as `/dev/mdX` (e.g., `/dev/md0`).

### Managing RAID Arrays
- RAID arrays can be managed by adding or removing devices using the `mdadm --manage` command.
  - To stop or remove a RAID array, use the `mdadm --stop` and `mdadm --remove` commands.
  - The RAID configuration can be saved to `/etc/mdadm/mdadm.conf` (Debian-based systems) or `/etc/mdadm.conf` (RHEL-based systems) for persistence across reboots.

---

## 3. Monitoring RAID Arrays

### Monitoring RAID Status
- The status of RAID arrays can be checked with the **`cat /proc/mdstat`** command, which provides a summary of active RAID devices and their state (e.g., syncing, rebuilding).
  
### Detailed RAID Information
- Use the `mdadm --detail` command to get detailed information about specific RAID arrays, including the status of individual disks, RAID level, and rebuild progress.
  
### RAID Array Rebuilding
- If a RAID array is being rebuilt (after a disk failure or replacement), you can monitor the progress using `cat /proc/mdstat`. This will display ongoing synchronization or rebuild status in real time.
