
# AppArmor 
#   * MAC (Mandatory Access Control) security module that restricts the actions of processes based on profiles
#   * profiles can be created for specific applications to define what they can access (files, network, etc.)
#   * profiles are stored in /etc/apparmor.d/

# AppArmor Modes:
#   * Enforcing: the profiles are enforced, and violations are blocked
#   * Complain: profiles are not enforced, but violations are logged for review (useful for testing)
#   * Disabled: AppArmor is turned off for a specific profile

sudo aa-status                                          # shows current status of AppArmor, including loaded profiles
sudo aa-enforce /etc/apparmor.d/usr.bin.nginx           # enforce the AppArmor profile for nginx
sudo aa-complain /etc/apparmor.d/usr.bin.nginx          # set nginx profile to complain mode (logs violations, doesn't block)
sudo nano /etc/apparmor.d/usr.bin.nginx                 # edit the AppArmor profile for nginx
sudo apparmor_parser -r /etc/apparmor.d/usr.bin.nginx   # reload a specific profile after making changes

sudo systemctl start apparmor                  # enable and start AppArmor
sudo systemctl stop apparmor                   # stop and disable AppArmor

dmesg | grep -i apparmor                       # view AppArmor messages in the system logs

# example of a basic AppArmor profile (for `/usr/bin/nginx`):
# /etc/apparmor.d/usr.bin.nginx
/usr/bin/nginx {
  # deny access to files and resources outside allowed areas
  deny /etc/shadow r,
  deny /etc/passwd r,
  
  # allow network access
  network inet tcp,
  network inet udp,
