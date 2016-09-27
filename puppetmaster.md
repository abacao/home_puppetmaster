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

## 5th - Define Hostname
- sudo su
- echo "puppetmaster.local.lan" > /etc/hostname
- echo "127.0.0.1    puppetmaster puppetmaster.local.lan localhost" > /etc/hosts

## 6th - Install Puppet Server
- sudo su
- cd /tmp && wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
- dpkg -i puppetlabs-release-pc1-xenial.deb
- apt update
- apt -y install puppetserver
- service puppetserver restart
- service puppetserver status

## 7th - GIT Installation and Config
- sudo su
- apt update
- apt -y install git
- git clone https://github.com/abacao/home_puppetmaster.git 
- mv home_puppetmaster /etc
- cp /etc/puppetlabs/* /etc/home_puppetmaster -R
- sudo mv /etc/puppetlabs /etc/puppetlabs.bak
- sudo mv /etc/home_puppetmaster /etc/puppetlabs
- cd /etc/puppetlabs
- sudo git add .
- sudo git commit -a -m "added puppet default configs"
- sudo git push origin master
