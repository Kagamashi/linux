BASH (Bourne Again Shell) - is a command-line interpretes used in many Unix-like OS

- Login Shell - initiated when we log into system, typically from terminal or SSH sessions. 
It reads configuration files like: /etc/profile, ~/.bash_profile, ~/.bash_login, ~/.profile during startup/
- Non-Login Shell - invoked when we open a terminal inside already running session (e.q. opening new terminal window). It does not read login-specific configuration but reads ~/.bashrc

- bash script.sh - invokes Bash shell to run script named script.sh; script doesn't need execution permissions when run this way because Bash is directly instructed to interpret the file
- ./script.sh - this method runs script as executable. Script must have execution permissions (chmod +x script.sh)