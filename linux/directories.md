# Important Linux Directories

## /** – Root Directory
- **Description:** The top-level directory in the filesystem hierarchy. All other directories are subdirectories of the root.
- **Contains:** Essential system directories and files.

## **/bin** – Essential User Binaries
- **Description:** Contains essential command-line binaries and executables needed for system boot and repair.
- **Contains:** Common commands like `ls`, `cp`, `mv`, `cat`.

## **/boot** – Boot Loader Files
- **Description:** Contains files needed for booting the system, including the Linux kernel and initial RAM disk (initrd).
- **Contains:** `vmlinuz` (kernel), `initrd`, `grub` (bootloader configuration).

## **/dev** – Device Files
- **Description:** Contains special files that represent hardware devices and virtual devices.
- **Contains:** Device files like `/dev/sda` (hard drive), `/dev/tty` (terminal).

## **/etc** – Configuration Files
- **Description:** Contains system-wide configuration files and shell scripts used to boot and initialize system settings.
- **Contains:** Configuration files like `/etc/passwd`, `/etc/fstab`, `/etc/hosts`.

## **/home** – User Home Directories
- **Description:** Contains personal directories for each user. Each user has a subdirectory here.
- **Contains:** User home directories like `/home/username`, where user-specific files and settings are stored.

## **/lib** – Essential Shared Libraries
- **Description:** Contains shared library files required by system binaries in `/bin` and `/sbin`.
- **Contains:** Libraries like `libc.so`, `libm.so`.

## **/media** – Mount Points for Removable Media
- **Description:** Typically used as mount points for removable media such as USB drives and CD-ROMs.
- **Contains:** Subdirectories like `/media/usb`, `/media/cdrom`.

## **/mnt** – Temporary Mount Points
- **Description:** Used for mounting filesystems temporarily, often used for administrative tasks.
- **Contains:** Mount points created for temporary access like `/mnt/data`.

## **/opt** – Optional Application Software
- **Description:** Contains optional application software packages that are not part of the default system.
- **Contains:** Applications installed in their own subdirectories like `/opt/google`.

## **/proc** – Process and Kernel Information
- **Description:** Virtual filesystem providing process and kernel information as files.
- **Contains:** Information about system processes and kernel settings, like `/proc/cpuinfo`, `/proc/meminfo`.

## **/root** – Root User’s Home Directory
- **Description:** The home directory for the root user (system administrator).
- **Contains:** Root user's personal files and settings, e.g., `/root/.bashrc`.

## **/run** – Runtime Data
- **Description:** Contains runtime data for system processes, including PID files and runtime system information.
- **Contains:** Temporary files like `/run/lock`, `/run/user`.

## **/srv** – Service Data
- **Description:** Contains data for services provided by the system, such as web or FTP servers.
- **Contains:** Service-specific directories like `/srv/www` for web content.

## **/sys** – Virtual Filesystem for Kernel and Devices
- **Description:** Provides a view into the kernel and device information, similar to `/proc`.
- **Contains:** Device information like `/sys/class`, `/sys/bus`.

## **/tmp** – Temporary Files
- **Description:** Contains temporary files created by system and user processes. Files here are usually deleted upon reboot.
- **Contains:** Temporary files like `/tmp/tempfile`.

## **/usr** – User Utilities and Applications
- **Description:** Contains user-related programs, libraries, and documentation.
- **Contains:** Subdirectories like `/usr/bin` (user binaries), `/usr/lib` (libraries), `/usr/share` (shared data).

## **/var** – Variable Data
- **Description:** Contains files that are expected to change frequently, such as log files and spool directories.
- **Contains:** Logs (`/var/log`), mail (`/var/mail`), spool files (`/var/spool`).

https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/4/html/reference_guide/s1-filesystem-fhs#s3-filesystem-boot