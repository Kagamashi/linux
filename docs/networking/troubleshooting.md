# Network Tools and Troubleshooting

## 1. Basic Network Diagnostic Commands

### ping
- The **ping** command checks the connectivity between your system and another IP address or domain by sending ICMP echo requests.
  - If the remote host responds, it confirms that the host is reachable.
  - This is useful for testing basic network connectivity and determining if the network interface is operational.

### traceroute
- **traceroute** shows the path (hops) that a packet takes to reach a destination.
  - It helps identify routing issues by showing where the connection might fail or slow down.
  - It displays each hop's IP address and the round-trip time to reach it.

### netstat/ss
- **netstat** (deprecated) and **ss** (newer) display information about active network connections and listening ports.
  - `ss` is faster and provides more detailed socket information.
  - Useful for checking which ports are open or for monitoring active TCP/UDP connections.

### curl/wget
- **curl** and **wget** are tools for fetching content from web servers.
  - **curl** can send and receive data using multiple protocols (HTTP, HTTPS, FTP, etc.) and is commonly used in scripts.
  - **wget** is used to download files and can handle recursive downloads or resume incomplete downloads.

### telnet/nc (netcat)
- **telnet** is used to connect to remote systems on a specified port, mainly for testing service connectivity (e.g., HTTP on port 80).
- **nc (netcat)** is a more versatile tool that can test port connectivity, send/receive data, and even act as a simple network server or client.

---

## 2. Firewall Configuration

### iptables
- **iptables** is a command-line utility for configuring IPv4 packet filtering rules in Linux. It's often used to allow or block specific ports or services.
  - You can define rules to allow or block incoming/outgoing traffic on certain ports.
  - The `INPUT` chain is used to control incoming connections, and rules must be saved to persist after reboot.

### nftables
- **nftables** is a newer replacement for `iptables` and offers more powerful and flexible firewall configuration.
  - Similar to `iptables`, you can define rules to allow/block traffic on specific ports.
  - It’s more efficient and scalable for complex firewall configurations.

### firewalld
- **firewalld** provides a higher-level interface for managing firewall rules dynamically without restarting the firewall service.
  - It supports predefined service names (like SSH, HTTP, HTTPS) to make firewall management easier.
  - You can define permanent rules and reload them when needed.

---

## 3. Network Services (SSH, HTTP/HTTPS, FTP, DNS)

### SSH
- **SSH (Secure Shell)** is a secure network protocol for managing and logging into remote servers.
  - The SSH service is managed by `sshd`, and you can check its status or manage its start/stop behavior with `systemctl`.
  - You can allow SSH traffic on port 22 by configuring the firewall rules.

### HTTP/HTTPS
- **HTTP** is the protocol used by web servers to deliver web content, while **HTTPS** is the secure, encrypted version.
  - Web services like Apache (`httpd`) and Nginx use these protocols.
  - Manage these services using `systemctl` and configure the firewall to allow traffic on ports 80 (HTTP) and 443 (HTTPS).

### FTP
- **FTP (File Transfer Protocol)** is used for transferring files between systems over a network.
  - Common FTP services include **vsftpd**, which can be started, stopped, or enabled using `systemctl`.
  - FTP typically uses port 21, which must be allowed in the firewall rules.

### DNS
- **DNS (Domain Name System)** translates human-readable domain names into IP addresses.
  - DNS services can be managed through tools like **BIND** or other DNS servers.
  - DNS typically uses port 53, which needs to be allowed in the firewall rules.
