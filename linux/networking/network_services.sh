#!/bin/bash

# NETWORK SERVICES
# DNS, HTTP, SMTP, DHCP, systemctl enable, systemctl start


# Configuring Basic Services
# DNS Server (BIND)
# Overview: BIND (Berkeley Internet Name Domain) is a popular DNS server software.
# Configuration file: /etc/named.conf or /etc/bind/named.conf

# Start and enable BIND service
systemctl start named               # Start the BIND service
systemctl enable named              # Enable BIND to start on boot

# HTTP Server (Apache)
# Overview: Apache is a widely-used web server software.
# Configuration file: /etc/httpd/conf/httpd.conf or /etc/apache2/apache2.conf

# Start and enable Apache service
systemctl start httpd               # Start the Apache service
systemctl enable httpd              # Enable Apache to start on boot

# SMTP Server (Postfix)
# Overview: Postfix is a widely-used mail transfer agent (MTA) for routing and delivering email.
# Configuration file: /etc/postfix/main.cf

# Start and enable Postfix service
systemctl start postfix             # Start the Postfix service
systemctl enable postfix            # Enable Postfix to start on boot

# DHCP Server (ISC DHCP)
# Overview: ISC DHCP server provides dynamic IP address allocation.
# Configuration file: /etc/dhcp/dhcpd.conf

# Start and enable DHCP service
systemctl start dhcpd               # Start the DHCP service
systemctl enable dhcpd              # Enable DHCP to start on boot


# Configuring Services with systemd
# systemctl – Control the systemd system and service manager

# Enable a service to start on boot
systemctl enable <service_name>    # Replace <service_name> with the name of the service (e.g., httpd, postfix)

# Start a service immediately
systemctl start <service_name>     # Replace <service_name> with the name of the service (e.g., httpd, postfix)

# Example: Enabling and starting the Apache HTTP server
systemctl enable httpd              # Enable Apache to start on boot
systemctl start httpd               # Start Apache service

# Example: Enabling and starting the Postfix SMTP server
systemctl enable postfix            # Enable Postfix to start on boot
systemctl start postfix             # Start Postfix service
