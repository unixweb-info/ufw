#!/bin/bash
# Be sure to work with root or sudo privileges
# Installing ufw
sudo apt update
sudo apt install ufw -y
# Checking whether IPv6 is enabled
sudo grep IPV6 /etc/default/ufw
# Setting up default ufw rules
sudo ufw default deny incoming
sudo ufw default allow outgoing
# Opening port 22 - these ports are needed for FTP operation
sudo ufw allow OpenSSH
# If you do not want to open this port, you can set a comment on this rule or remove it from the script.
# Opening ports 80,443 - these ports are needed for the site to work
# sudo ufw allow 'Nginx Full' if you have the nginx package installed
sudo ufw allow 80,443/tcp
# Opening ports 21,65000:65500 - these ports are needed for FTP operation. Don't forget to check the port range that is configured in ProFTPD, Execute this command in the Linux terminal:
# grep PassivePorts /etc/proftpd.conf
sudo ufw allow 21,65000:65500/tcp
# Opening ports 25,110,143,465,587,993,995 - these ports are needed for mail operation
sudo ufw allow 25,110,143,465,587,993,995/tcp
# 
# If you need to open mysql port 3306, remove the comment from the rule by removing the grid sign # at the beginning of the rule and replace IP 192.168.1.1 with your IP address. It is not recommended to open this port for everyone.
sudo ufw allow proto tcp from 192.168.1.1 to any port 3306
# Adding UFW to the startup
sudo systemctl enabled ufw
# Enabling UFW
sudo ufw enable
# We display the status of the established UFW rules
sudo ufw status
