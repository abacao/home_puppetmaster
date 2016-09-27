# Puppet Node Installation

## 1st - Download ISO:
http://archive.ubuntu.com/ubuntu/dists/xenial-updates/main/installer-amd64/current/images/netboot/mini.iso

## 2nd - Installation Menus
 - Install
 - Language English
 - Country Other - Europe - Portugal
 - Locale - UK
 - No Keyboard detect - Native PT
 - Hostname: ubuntu
 - Ubuntu Repo: PT
 - No Proxy
 - User Name: ubuntu
 - Username: ubuntu
 - Password: ubuntu
 - Use weak password: YES
 - Encrypt Home Dir: NO
 - Location: Lisbon
 - Partition: Guided - use entire disk
 - Select and YES to write the changes
 - Let it run.......
 - No automatic updates
 - Let it run.......
 - Select "Standard system utilities" and "OpenSSH Server"
 - Yes to Install Grub
 - Yes to UTC
 - Restart
 
## 3rd - Google DNS
- sudo su
- echo "dns-nameservers 8.8.8.8 8.8.4.4" >> /etc/network/interfaces
- service networking restart
- service networking status

## 4th - Install NTP
- sudo su
- apt -y install ntp
- service ntp restart
- service ntp status

## 5th - Configure Hostname
- sudo su
- echo "prod-webserver01.local.lan" > /etc/hostname
- echo "127.0.0.1 prod-webserver01 prod-webserver01.local.lan localhost" > /etc/hosts
- echo "10.100.10.4 puppet puppetmaster puppetmaster.local.lan" >> /etc/hosts


## 6th - Install Agent
- sudo su
- cd /tmp && wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb && dpkg -i puppetlabs-release-pc1-trusty.deb
- apt -y update && apt -y install puppet-agent

## 7th - Ensure Puppet Running
- sudo su
- /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true

