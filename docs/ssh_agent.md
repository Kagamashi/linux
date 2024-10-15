# ssh
program for logging into remote machine and for executing commands on remote machine. It is intended to provide secure encrypted communications between two untrusted hosts over an insecure network.
OpenSSH is an open source implementation of SSH protocol.

Przesyłanie plików między komputerami:
  - SFTP (SSH File Transfer Protocol)
  - SCP (Secure Copy)

Flagi:
-A  Enables forwarding of connections from auth agent such as ssh-agent
-i  Identity file

> ssh username@remote_server
> ssh -l username -p port address

---

# ssh-keygen
generates, manages and converts authentication keys for ssh.
  - SSH keys are essential for automation
  - Extra layer of protection agains hackers and brute-force attacks

Flagi:
-b  4096	Bits
-C	Comment
-f	Output keyfile
-p	Change or set passphrase
-t ed25519 -a 100	  Most secure proposed option

> ssh keygen -
> ssh keygen -t ed25519 -C "my-email" -b 4096

---

# ssh config
OpenSSH client configuration file.
  - Command-line options
  - User's configuration file (~/.ssh/config)
  - System-wide configuration file (/etc/ssh/ssh_config)

AddKeysToAgent	Whether keys should be automatically added to a running ssh-agent
UseKeychain	On macOS whether system should search for passphrases in user's keychain
Host	Nickname for the server
Hostname	Specified the real host name to log into.

---

# ssh-copy-id 
script that uses ssh to log into a remote machine. 
It assembles a list of one or more fingerprints and tries to log in with each key to see if any of them are already installed. 
It then assembles a list of those that failed to log in, and using ssh, enables logins with those keys on the remote server.

By default it appends the keys to ~/.ssh/authorized_keys.

Flagi:
-i 	Specify a file
-n	Dry run - print keys that would be installed

---

# ssh-agent
key manager for SSH.
It holds our keys and certificates in memory unencrypted and ready for use by ssh.
*It is saving us from typing a passphrase every time we connect to a server.
It runs separately from ssh.*

> ssh-add	(our Gateway to ssh agent)
Adds private key identities to the OpenSSH authentication agent

> eval "$(ssh-agent -s)"	
Start ssh-agent
exec ssh-agent bash
sudo -s -H

Flagi: 
-l	List fingerprists of all identities represented by agent
-L	List public key parameters
-d	Removes identities from the agent
-D	Removes all identities
-A	Agent forwarding for single session
-x 	Locks agent with password
-X	Unlock the agent with a password

---

# ProxyJump : safer alternative to ssh-agent forwarding
  ProxyJump forwards standard input and output of our local SSH client through bastion and on to the remote host

1. Run ssh -J bastion.example.com cloud.computer.internal to connect to cloud.computer.internal via your bastion.example.com bastion host. cloud.computer.internal is a hostname that can be looked up using DNS lookup on bastion.example.com.
2. Your SSH client uses keys from your agent to connect to bastion.example.com.
3. Once connected, SSHD on the bastion connects to cloud.computer.internal and hands that connection off to your local SSH client.
4. Your local SSH client runs through the handshake again, this time with cloud.computer.internal.

Setting it inside ~/.ssh/config
<!-- Host bastion.example.com
  User carl
Host *.computer.internal
  ProxyJump bastion.example.com
  User carl -->

---

**ERRORS AND SOLUTIONS**
You get an error message like "Could not open a connection to your authentication agent."
-> eval $(ssh-agent -s)

You get a "Permission denied (publickey)" error when trying to SSH into a remote server.
-> It means that server doesnt have our public key. It has to be added to ~/.ssh/authorized_keys on remote server.
ssh-copy-id username@remote-server

Agent Forwarding doesn't work even with ssh -A option added.
-> AllowAgentForwarding must be set to yes in /etc/ssh/sshd_config SSH servers configuration file.

SSH-Agent not persisting between sessions
-> To make SSH-Agent persist between sessions we can add 'eval $(ssh-agent -s)' command to shell profile configuration ~/.bashrc, ~/.zshrc, 
