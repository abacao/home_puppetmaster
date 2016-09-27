# home_puppetmaster
Bulding Puppet Master with Ubuntu Server 16.04 for home fun and profit


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

## 3rd - Define Hostname and DNS
 - sudo su
 - echo "puppetmaster.local.lan" > /etc/hostname
 - echo "127.0.0.1    puppetmaster puppetmaster.local.lan localhost" > /etc/hosts
 - echo "dns-nameservers 8.8.8.8 8.8.4.4" >> /etc/network/interfaces
 - reboot

## 4th - Install NTP, PuppetServer, GIT install, clone and 1st commit
- sudo su
- cd /tmp && wget https://raw.githubusercontent.com/abacao/home_puppetmaster/master/puppetmaster.sh && chmod +x puppetmaster.sh
- bash -x puppetmaster.sh
