# Network File Sharing

## 1. NFS (Network File System)

### Installing and Configuring NFS Server
- **NFS (Network File System)** is a protocol used to share directories and files between Linux systems over a network.
  - **Server installation**: The NFS server package needs to be installed on the host sharing files. This is done using package managers like `apt` (for Ubuntu/Debian) or `yum` (for CentOS/RHEL).
  - **NFS Configuration**: After installation, shared directories are defined in the `/etc/exports` file.
    - Example: `/srv/nfs_share 192.168.1.0/24(rw,sync,no_subtree_check)` allows all clients in the `192.168.1.0/24` subnet to access `/srv/nfs_share` with read/write permissions.
  - **Starting NFS service**: The NFS service must be started and enabled to automatically start at boot.

### Mounting NFS Shares
- **Client installation**: The NFS client package (`nfs-common` or `nfs-utils`) must be installed on the client machine.
- **Mounting shares**: NFS shares are mounted on the client’s filesystem, typically under a directory like `/mnt`.
  - NFS shares can be mounted automatically at boot by adding the share to `/etc/fstab`.

### Export Configuration and Permissions
- **/etc/exports**: The NFS export configuration file (`/etc/exports`) defines which directories are shared and who has access.
  - **Permissions**: Common options include:
    - `rw`: Read and write access.
    - `sync`: Writes are committed to disk before the server responds.
    - `no_subtree_check`: Avoids checking permissions of the parent directory.

---

## 2. SMB/CIFS (Samba)

### Installing and Configuring Samba
- **Samba** is a protocol that allows Linux systems to share files and printers with Windows clients using the **SMB/CIFS** protocol.
  - **Samba installation**: Install Samba using `apt` for Ubuntu/Debian or `yum` for CentOS/RHEL.
  - **Samba Configuration**: Samba shares are defined in the `/etc/samba/smb.conf` file. Each share needs to specify the path to the shared directory and any additional permissions or access restrictions.
    - Example:
      ```
      [sambashare]
        path = /srv/samba_share
        valid users = @sambashare
        guest ok = no
        writable = yes
        browsable = yes
      ```

### User and Permission Management for Samba Shares
- **User management**: Samba requires users to have Samba-specific accounts and passwords, which are managed using the `smbpasswd` command.
  - Users must be part of a group, such as `sambashare`, to access shared resources.
- **Permissions**: Permissions for Samba shares can be configured in the `/etc/samba/smb.conf` file, determining whether users can read, write, or browse the shared resources.
  - **valid users**: Specifies which users or groups are allowed to access the share.
  - **writable**: Allows or denies write access to the share.
  - **browsable**: Controls whether the share is visible when browsing.

### Accessing Samba Shares
- Samba shares can be accessed from Windows clients using the `\\server_ip_address\share_name` syntax, or from Linux clients using the `smbclient` command or mounting via `cifs`.
