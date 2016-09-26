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
 
## 3rd - Install NTP
sudo su
apt -y install ntp
service ntp restart
service ntp status

## 4th - Define Hostname
sudo su
echo "puppetmaster.local.lan" > /etc/hostname
echo "127.0.0.1    puppetmaster puppetmaster.local.lan localhost" > /etc/hosts

## 5th - Install Puppet Server
cd /tmp && wget https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb
sudo dpkg -i puppetlabs-release-pc1-trusty.deb
sudo apt update
sudo apt -y install puppetserver
sudo service puppetserver restart
sudo service puppetserver status