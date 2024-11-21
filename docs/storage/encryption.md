# Disk Encryption with LUKS in Linux

## 1. Disk Encryption with LUKS

### What is LUKS?
- **LUKS (Linux Unified Key Setup)** is a standard for disk encryption that allows secure storage of data on partitions. It is primarily used to encrypt whole disks or disk partitions, ensuring data confidentiality.

### Creating Encrypted Volumes with LUKS
- To create an encrypted volume, the `cryptsetup luksFormat` command is used. This sets up the **LUKS header** on the disk, which contains encrypted key material and metadata.
  - **Important**: This operation erases the existing data on the partition.

### Managing Encrypted Volumes
- **Opening the Encrypted Volume**: After creating the encrypted volume, it must be opened (unlocked) using `cryptsetup open`. This maps the volume to `/dev/mapper/secure_vol` (or any other chosen name).
- **Formatting the Decrypted Volume**: Once the volume is opened, you can format it with any filesystem (e.g., ext4, XFS, etc.).
- **Mounting**: After opening and formatting, the decrypted volume is mounted like any regular volume using the `mount` command.

---

## 2. Unlocking and Mounting Encrypted Disks

### Unlocking and Opening Encrypted Volumes
- When an encrypted volume needs to be accessed, it is opened using `cryptsetup open`, which prompts for the passphrase to unlock the volume.
- The decrypted device is accessible through `/dev/mapper/secure_vol` (or the mapped name you used during the open operation).

### Mounting Encrypted Volumes
- Once decrypted, the volume can be mounted to any directory (`/mnt` is common) using the `mount` command, allowing you to access its contents as a regular filesystem.

### Closing Encrypted Volumes
- After use, it is important to unmount the volume and close it using `cryptsetup close`. This ensures that the data remains encrypted and protected when not in use.

---

## 3. Managing Passphrases for Encrypted Disks

### Adding New Passphrases
- **LUKS** allows multiple passphrases to be associated with the same encrypted volume. This is useful if you want to provide multiple users access to the volume or if you want a backup passphrase.
  - Use `cryptsetup luksAddKey` to add an additional passphrase to the encrypted volume.

### Removing Passphrases
- If a passphrase needs to be revoked, `cryptsetup luksRemoveKey` allows you to remove it, ensuring that old or compromised passphrases cannot be used to unlock the volume.

### Viewing LUKS Header Information
- The **LUKS header** stores metadata such as the number of passphrases and the key slots in use. Use `cryptsetup luksDump` to view this information.
  - **Note**: The LUKS header is critical for decryption, and losing it means losing access to the encrypted data.
