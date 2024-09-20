#!/bin/bash

# MANAGING SYSTEM SERVICES
# Apache, Nginx, MySQL, PostgreSQL, Postfix, Dovecot


# WEB SERVERS
# Apache HTTP Server
# Overview: Apache is a popular open-source web server.
# Configuration file: /etc/httpd/conf/httpd.conf or /etc/apache2/apache2.conf

# Start and enable Apache service
systemctl start httpd               # Start the Apache service
systemctl enable httpd              # Enable Apache to start on boot

# Check the status of Apache service
systemctl status httpd              # Show the current status of Apache service

# Nginx Web Server
# Overview: Nginx is a high-performance web server and reverse proxy.
# Configuration file: /etc/nginx/nginx.conf

# Start and enable Nginx service
systemctl start nginx               # Start the Nginx service
systemctl enable nginx              # Enable Nginx to start on boot

# Check the status of Nginx service
systemctl status nginx              # Show the current status of Nginx service


# DATABASES
# MySQL
# Overview: MySQL is a popular open-source relational database management system.
# Configuration file: /etc/my.cnf

# Start and enable MySQL service
systemctl start mysqld              # Start the MySQL service
systemctl enable mysqld             # Enable MySQL to start on boot

# Check the status of MySQL service
systemctl status mysqld             # Show the current status of MySQL service

# PostgreSQL
# Overview: PostgreSQL is a powerful open-source object-relational database system.
# Configuration file: /etc/postgresql/postgresql.conf

# Start and enable PostgreSQL service
systemctl start postgresql          # Start the PostgreSQL service
systemctl enable postgresql         # Enable PostgreSQL to start on boot

# Check the status of PostgreSQL service
systemctl status postgresql         # Show the current status of PostgreSQL service


# MAIL SERVICES
# Postfix
# Overview: Postfix is a mail transfer agent (MTA) used for routing and delivering email.
# Configuration file: /etc/postfix/main.cf

# Start and enable Postfix service
systemctl start postfix             # Start the Postfix service
systemctl enable postfix            # Enable Postfix to start on boot

# Check the status of Postfix service
systemctl status postfix            # Show the current status of Postfix service

# Dovecot
# Overview: Dovecot is a secure IMAP and POP3 server for Unix-like operating systems.
# Configuration file: /etc/dovecot/dovecot.conf

# Start and enable Dovecot service
systemctl start dovecot             # Start the Dovecot service
systemctl enable dovecot            # Enable Dovecot to start on boot

# Check the status of Dovecot service
systemctl status dovecot            # Show the current status of Dovecot service
