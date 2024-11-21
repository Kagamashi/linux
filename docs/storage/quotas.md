# Storage Quotas in Linux

## 1. User and Group Quotas

### What are Disk Quotas?
- **Disk quotas** allow system administrators to limit the amount of disk space or the number of inodes (files) that a user or group can use. This ensures fair usage of disk resources and prevents any one user from consuming all available space.

---

## 2. Enabling and Configuring Disk Quotas

### Configuring Quotas in `/etc/fstab`
- To enable quotas on a filesystem, modify the `/etc/fstab` file and add the `usrquota` (for user quotas) and/or `grpquota` (for group quotas) mount options. For example:
  - `/dev/sda1 / ext4 defaults,usrquota,grpquota 0 1`
  - This enables both user and group quotas on the root filesystem (`/`).

### Remounting and Initializing Quota Files
- After modifying `/etc/fstab`, the filesystem must be remounted using the `mount -o remount` command to apply the quota options.
- Next, initialize the quota files using the `quotacheck` command:
  - `quotacheck -cug /` will create and check the user (`u`) and group (`g`) quota files for the root filesystem (`/`).

### Turning Quotas On
- Use `quotaon` to enable quotas on the specified filesystem:
  - `quotaon /` enables quotas on the root filesystem (`/`).

---

## 3. Setting and Managing Quotas for Users and Groups

### Setting Quotas Using `edquota`
- Quotas for users and groups can be set using the `edquota` command:
  - `edquota username`: Opens a text editor where soft and hard limits for disk space and inodes can be set for the specified user.
  - `edquota -g groupname`: Similar, but for groups.
  
- **Soft limit**: A threshold that the user/group can exceed for a grace period before they must reduce usage.
- **Hard limit**: The absolute maximum amount of disk space or inodes a user/group can use. They cannot exceed this limit.

---

## 4. Viewing and Managing Quotas

### Checking Quota Usage
- The `quota` command displays the current quota usage for a user or group:
  - `quota -u username`: Displays quota usage for the specified user.
  - `quota -g groupname`: Displays quota usage for the specified group.

### Viewing Quota Reports
- Use `repquota` to view quota usage for all users and groups:
  - `repquota /` provides a report of all user and group quota usage on the root filesystem.

### Turning Quotas Off
- Quotas can be turned off with `quotaoff`:
  - `quotaoff /` disables quotas on the root filesystem.
