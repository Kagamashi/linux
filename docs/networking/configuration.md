# IP Addressing in Linux

## IP Addressing (IPv4 and IPv6)

### Understanding IPv4 and IPv6
- **IPv4**: The 32-bit address system (e.g., `192.168.1.1`), commonly used in most networks. It consists of four octets separated by dots, with each octet ranging from 0 to 255.
- **IPv6**: The 128-bit address system (e.g., `2001:db8::1`), developed to address IPv4 exhaustion. It uses hexadecimal numbers separated by colons and provides a much larger address space.

### Configuring IP Addresses
- **IP addressing in Linux** involves assigning an IPv4 or IPv6 address to a network interface (e.g., `eth0`, `enp3s0`).
- Both **static** (manual configuration) and **dynamic** (using DHCP) addressing can be used for both IPv4 and IPv6.
- Troubleshooting is done by checking IP assignments and connectivity (e.g., using `ping` for IPv4 and `ping6` for IPv6).

### Troubleshooting
- **IPv4 Connectivity**: Test with `ping` to verify connectivity to another machine on the network.
- **IPv6 Connectivity**: Use `ping6` to check if the network supports IPv6 and ensure the correct configuration.

---

## Network Masks, Gateways, and DNS Settings

### Network Masks
- A **subnet mask** determines the size of a network and the division between the network and host portions of an IP address.
  - For IPv4, `/24` represents a subnet mask of `255.255.255.0`, meaning the first 24 bits represent the network portion.
  - For IPv6, subnetting works similarly, with common subnet masks like `/64`.

### Gateways
- A **gateway** is a network node (usually a router) that allows traffic to flow between different networks, such as from your local network to the internet.
- The **default gateway** is used for traffic that is not destined for the local network.

### DNS Settings
- **DNS (Domain Name System)** translates domain names (e.g., `www.example.com`) into IP addresses.
- Linux systems store DNS server information in `/etc/resolv.conf`, where you can manually add or modify DNS servers.

---

---

## 3. Configuring Network Interfaces

### Commands for Configuring Network Interfaces
- **ifconfig**: Older command for displaying or configuring network interfaces (deprecated).
- **ip addr**: Preferred command for managing network interfaces and addresses.
- **nmcli**: NetworkManager’s command-line interface for managing network connections, both wired and wireless.
- **nmtui**: A text-based user interface to configure NetworkManager in terminal environments.

### Configuring Static and Dynamic IPs
- **Static IP**: Manually assigned, used in scenarios where a device needs to retain the same IP (e.g., servers).
- **Dynamic IP**: Assigned automatically via **DHCP**.
  - Configuring static IPs or switching between static and DHCP can be done using `nmcli` or by manually editing interface configuration files.

### Interface Configuration Files
- **Debian/Ubuntu**:
  - Network interfaces are configured in `/etc/network/interfaces`.
- **RHEL/CentOS**:
  - Network interfaces are configured in `/etc/sysconfig/network-scripts/ifcfg-*`.

### Managing Network Interfaces
- Network interfaces can be brought up or down manually using `ip` or `nmcli`. Network services can be restarted using `systemctl` (e.g., `NetworkManager`, `networking`).

---

## 4. Routing

### Static Routing
- **Static routes** are manually configured and are used to direct traffic to specific subnets through specific gateways.
  - You can add or remove routes using the `ip route` or `route` commands.

### Default Gateways and Routing Tables
- The **default gateway** forwards traffic when no specific route for the destination exists.
- The routing table can be viewed and managed using the `ip route show` command or older tools like `route`.

---

## 5. DNS Configuration

### Configuring and Troubleshooting DNS
- DNS server information is stored in `/etc/resolv.conf` and can be managed using `resolvectl` in systems that use `systemd`.
- Common tools for querying DNS servers include:
  - **nslookup**: Basic DNS lookup tool.
  - **dig**: A more detailed DNS query tool.
  - **host**: Simple command for DNS lookups.

### Resolving DNS Issues
- If DNS lookups fail, first verify that the correct DNS servers are listed in `/etc/resolv.conf` and try querying with `dig` or `nslookup` to isolate the issue.
