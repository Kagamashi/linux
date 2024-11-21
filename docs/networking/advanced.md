# Advanced Networking in Linux

## 1. Bonding and Teaming

### Network Bonding
- **Bonding** is used to combine multiple network interfaces into a single logical interface for high availability or load balancing.
  - **High Availability**: In **active-backup** mode, if one interface goes down, the other automatically takes over, ensuring network uptime.
  - **Load Balancing**: In **round-robin** or **802.3ad (LACP)** mode, traffic is split across multiple interfaces, improving bandwidth.
- **Configuration**: Bonding can be configured using `nmcli`, or manually through configuration files such as `/etc/network/interfaces` (for Ubuntu/Debian) or `ifcfg` files (for CentOS/RHEL).
  - Interfaces are added as **slaves** to the bonded interface (e.g., `eth0`, `eth1`).

### Teaming
- **Teaming** is a more modern alternative to bonding and provides similar functionality with additional features and flexibility.
  - **teamd** is used to manage team interfaces on systems like CentOS/RHEL.

---

## 2. Bridging

### Network Bridging
- A **bridge** allows multiple interfaces to communicate as if they are part of the same network segment.
  - Bridging is commonly used in virtualization environments to allow VMs to communicate with the outside network as if they were physical hosts.
- **Configuration**: Bridging can be set up using tools like `brctl` or configured via `/etc/network/interfaces` for automatic startup.
  - Once created, physical interfaces (e.g., `eth0`) are added to the bridge (e.g., `br0`).

### Managing Bridges with brctl
- `brctl` is used to create and manage bridges. A bridge can be created using `brctl addbr` and interfaces can be added to it using `brctl addif`.

---

## 3. VLANs (Virtual LANs)

### Virtual LANs
- **VLANs** allow you to segment a physical network into multiple logical networks. This is useful for isolating network traffic without requiring separate physical infrastructure.
  - Each VLAN is identified by a **VLAN ID**, typically configured on switches and associated with tagged traffic on network interfaces.

### Configuring VLANs
- VLANs can be configured in Linux using the `ip` command or the `vconfig` tool (on older systems).
  - For modern systems, the `ip` command is preferred, where VLANs are added as subinterfaces (e.g., `eth0.100`).
- **Configuration files**: VLANs can be set up to start automatically by configuring them in `/etc/network/interfaces` or `ifcfg` files, depending on the distribution.
