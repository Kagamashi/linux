
# SELinux is a security architecture for Linux that allows administrators to define fine-grained access controls
#     * enforces security policies that restrict what a process can access and execute, beyond traditional file permissions
#     * SELinux labels ("contexts") are applied to files, processes, and ports to enforce policies; context has fields: `user:role:type:level`

# SELinux Modes:
#   * Enforcing: SELinux actively enforces policies and denies access when rules are violated
#   * Permissive: SELinux logs policy violations but does not enforce rules (useful for testing)
#   * Disabled: SELinux is completely turned off

getenforce                                     # check SELinux mode
sudo setenforce 0                              # set SELinux to "permissive" mode
sudo setenforce 1                              # set SELinux to "enforcing" mode
sestatus                                       # check SELinux status and mode

ls -Z                                          # display the SELinux context (labels) of files and directories
ps -eZ                                         # display the SELinux context of running processes

sudo chcon -t httpd_sys_content_t /var/www/html/file.html   # change SELinux type context for a file (temporary change)

# SELinux policies define the security rules enforced by SELinux, dictating what actions are allowed
#   * Targeted policies: only a subset of processes are confined
#   * MLS policies: multi-Level security policies offer very strict control

getsebool -a                                   # lists all SELinux booleans and their current state
sudo setsebool httpd_enable_homedirs on        # enable a specific boolean for allowing HTTPD to serve home directories
