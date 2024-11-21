# Logical Volume Management (LVM) in Linux

## 1. Basic LVM Concepts

### Logical Volume Management (LVM)
- **LVM** provides a more flexible and manageable way to handle disk storage. It allows for resizing, moving, and creating snapshots of logical volumes without major downtime.
- LVM is composed of three layers:
  - **Physical Volumes (PVs)**: Physical storage devices (e.g., `/dev/sda1`) initialized for use by LVM.
  - **Volume Groups (VGs)**: A group of physical volumes, combined into a single storage pool (e.g., `vg_data`).
  - **Logical Volumes (LVs)**: Logical partitions created within a volume group, where filesystems like ext4 or XFS are placed (e.g., `lv_data`).

---

## 2. Creating PVs, VGs, and LVs

### Physical Volumes (PVs)
- **Physical Volumes** are the lowest level in the LVM hierarchy and represent storage devices (partitions or entire disks). To use a storage device in LVM, it must be initialized as a PV using `pvcreate`.

### Volume Groups (VGs)
- **Volume Groups** are created by grouping together one or more physical volumes. They act as a storage pool from which logical volumes can be allocated. Use `vgcreate` to create a VG.

### Logical Volumes (LVs)
- **Logical Volumes** are the LVM equivalent of disk partitions. They are created from the storage pool (volume group) and can be used to create filesystems (e.g., ext4, XFS). Use `lvcreate` to create a logical volume.

---

## 3. Extending or Reducing Logical Volumes

### Extending a Logical Volume
- Logical volumes can be extended dynamically without disrupting the system.
  - After increasing the size of the logical volume using `lvextend`, the filesystem must also be resized using tools like `resize2fs` for ext4 or `xfs_growfs` for XFS.

### Reducing a Logical Volume
- Reducing a logical volume is risky and requires backing up data. Use `lvreduce` to shrink the LV and make sure to resize the filesystem before reducing the LV.

---

## 4. Managing LVM Snapshots

### LVM Snapshots
- **Snapshots** allow you to take point-in-time copies of a logical volume, useful for backups or testing.
  - Use `lvcreate --snapshot` to create a snapshot. The size of the snapshot should be large enough to store changes made to the original volume after the snapshot is taken.
  - Snapshots can be removed when no longer needed using `lvremove`.

---

## 5. LVM Display Commands

### pvdisplay
- Displays detailed information about **physical volumes**, including size, UUID, and which volume group they belong to.

### vgdisplay
- Displays detailed information about **volume groups**, including free space, physical extents, and associated logical volumes.

### lvdisplay
- Displays detailed information about **logical volumes**, including size, device name, and any associated snapshots.
