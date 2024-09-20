printenv
environment
export VARIABLE_NAME=value 

for persistent changes add export commands to shell configuration file e.g. .bashrc or .bash_profile




help




Standard Input (stdin) - This is where the process reads its input from. The default is the keyboard.
Standard Output (stdout) - The process writes its output to stdout. By default, this means the terminal.
Standard Error (stderr) - The process writes error messages to stderr. This also goes to the terminal by default.




sudo <command>
su -



permissions 
first character indicates if its file (-) or directory (d) 

-rwxrwxrwx 
rwx 
read write execute 
owner / group / others permissions
chmod, chown, chgrp



soft / hard links

soft link (symbolic links) - shortcut/pointer to another file or Directory
it doesnt contain actual data but rather points to the location of file or directory 
soft link has its own inode
ln -s /path/to/original /path/to/symlink

hard link - is essentialy an additional name for ane xisting file
both original file and hard link share the same inode and data
ln /path/to/original /path/to/hardlink


