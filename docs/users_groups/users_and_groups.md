

/etc/skel - every file from this directory will be copied into /home/user directory

# ----------------------
# GROUP
# ----------------------

Groups are defined in the following system files:

/etc/group - Contains group names, GIDs, and group memberships.
Example of /etc/group entry:
group_name:x:GID:user1,user2,user3

/etc/gshadow - Contains group passwords (if any), group administrators, and members.
Example of /etc/gshadow entry:
group_name:!::user1,user2
Here, `!` means no password is set for the group.


# ----------------------
# RESOURCE LIMITS
# ----------------------

ulimit: This is a shell command used to set or display resource limits for the current user session. Limits can be set for resources like CPU time, memory usage, file descriptors, and more.

Soft limits: Can be changed by users up to the hard limit.
Hard limits: Can only be increased by the root user and represent the maximum allowed value.
Persistent Limits (limits.conf): To make limits permanent, they can be set in /etc/security/limits.conf or /etc/security/limits.d/ files. This ensures limits persist across reboots and apply to specific users, groups, or all users.

System-wide Limits (sysctl): Global limits for resources like file descriptors can be set using sysctl configuration files (e.g., /etc/sysctl.conf).

cgroups (Control Groups): A more advanced method for limiting and isolating the resource usage (CPU, memory, disk I/O) of groups of processes. Often used in containerized environments.

limits.conf
 /etc/security/limits.conf
 /etc/security/limits.d/

 Resource limits can be managed using:
 - ulimit - a shell command
 - /etc/security/limits.conf - configuration file for setting persistent limits
 - cgroups - more advanced system for controlling resource allocation

Each line in `/etc/security/limits.conf` defines a limit for a user or group:
Syntax:
<domain> <type> <item> <value>
- `<domain>`: Username, group name, or wildcard (*).
- `<type>`: `soft` (user can change) or `hard` (enforced by the system).
- `<item>`: The resource to limit (e.g., `nofile`, `nproc`).
- `<value>`: The limit value (e.g., number of files or processes).

Common resource types:
nofile: The maximum number of open file descriptors a user can have.
nproc: The maximum number of processes a user can run.
as: The maximum amount of virtual memory available to a user.
cpu: CPU time usage, often controlled by cgroups.

alice      soft  nofile  1024             # Set a soft limit of 1024 open files for alice.
alice      hard  nofile  4096             # Set a hard limit of 4096 open files for alice.

*          soft  nproc   200              # All users can create up to 200 processes.
*          hard  nproc   300              # Hard limit of 300 processes.


# ----------------------
# SYSTEM-WIDE DEFAULT RESOURCE LIMITS
# ----------------------

# Global system-wide limits can be set in `/etc/sysctl.conf` or `/etc/sysctl.d/` files using `sysctl`.
# For example, to change the maximum number of file descriptors globally:

# Add to `/etc/sysctl.conf`:
fs.file-max = 100000                       # Set the system-wide maximum number of open file descriptors.

# Apply the changes:
sudo sysctl -p                             # Reload system configuration to apply the changes.


# ----------------------
# CGROUPS (CONTROL GROUPS)
# ----------------------

# `cgroups` (Control Groups) provide more fine-grained control over system resources for groups of processes.
# You can limit CPU, memory, disk I/O, and more using `cgroups`.

# Example of limiting CPU usage:
# Create a new control group for a user or process (this requires system-level configuration).
cgcreate -g cpu:/limited_user              # Create a new control group named "limited_user".

# Limit the CPU usage of this control group to 50%.
echo 50000 > /sys/fs/cgroup/cpu/limited_user/cpu.cfs_quota_us

# Add a user or process to the control group.
cgclassify -g cpu:/limited_user PID        # Add a process with a specific PID to the "limited_user" control group.



# ----------------------
# SUDO - SuperUser Privileges
# ----------------------

Every user that is part of SUDO group have sudo privileges

sudo visudo
# Syntax of `/etc/sudoers` entries:
# <user> <hosts> = (<run_as_user>) <commands>

# Example: Allow the user `john` to run any command as root:
john   ALL=(ALL:ALL) ALL

# Example: Allow `john` to run specific commands (e.g., `apt` and `systemctl`) as root:
john   ALL=(ALL) /usr/bin/apt, /usr/bin/systemctl

# Example: Allow a group (`admin`) to run all commands:
%admin ALL=(ALL) ALL

# Example: Allow `john` to run commands without a password:
john   ALL=(ALL) NOPASSWD: ALL

# Limiting the number of failed sudo attempts:
Defaults        passwd_tries=3            # Limit users to 3 incorrect sudo password attempts before the session is locked.


# ----------------------
# PAM - Pluggable Authentication Modules
# ----------------------

# PAM configuration files are located in `/etc/pam.d/`. Each service (e.g., `sshd`, `login`, `sudo`) has its own PAM file.
# Example PAM files:
# - `/etc/pam.d/sudo`   : Controls sudo authentication.
# - `/etc/pam.d/sshd`   : Controls SSH login authentication.
# - `/etc/pam.d/login`  : Controls system login authentication.

# PAM modules can be stacked to provide multiple layers of authentication. Each PAM file has a series of rules with four types of control flags:
# - **required**: The module must pass for authentication to succeed.
# - **requisite**: Similar to `required`, but if it fails, authentication is denied immediately.
# - **sufficient**: If this module succeeds, no further modules are processed.
# - **optional**: The module is not critical, and its failure will not prevent authentication.

# Example of `/etc/pam.d/sshd`:
auth       required   pam_unix.so          # Standard UNIX authentication.
auth       optional   pam_faildelay.so delay=4000000  # Introduce a 4-second delay on authentication failure.
# Example 1: Lock a user after 5 failed login attempts
# Add the following to `/etc/pam.d/login`:
auth       required   pam_tally2.so onerr=fail deny=5 unlock_time=300

# Example 2: Restrict SSH logins to a certain time window
# Add the following to `/etc/pam.d/sshd`:
account    required   pam_time.so
# Add this to `/etc/security/time.conf`:
sshd;*;*;!Wk0900-1700                        # Allow SSH logins only during weekdays between 9 AM and 5 PM.

# Example 3: Enforce password complexity using PAM
# Modify `/etc/pam.d/common-password` to use the `pam_cracklib.so` module:
password   required   pam_cracklib.so retry=3 minlen=8 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1
# This ensures that passwords are at least 8 characters long, and must contain at least one uppercase letter, one lowercase letter, one digit, and one special character.



# A typical PAM file contains the following modules:
# - **auth**: Authentication modules (verify a user's identity).
# - **account**: Account management modules (restrict access based on rules).
# - **password**: Password management (control password changes).
# - **session**: Session setup modules (apply rules when starting/stopping user sessions).

# Example of a basic `/etc/pam.d/login` file:
auth      required   pam_securetty.so        # Deny root login on insecure terminals.
auth      requisite  pam_nologin.so          # Deny login if /etc/nologin exists.
auth      required   pam_unix.so             # Standard UNIX authentication.
