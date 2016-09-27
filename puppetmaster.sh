#!/bin/bash

# 4th - Install NTP
apt -y install ntp
service ntp restart;
#service ntp status

## 5th - Install Puppet Server
cd /tmp && wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
dpkg -i puppetlabs-release-pc1-xenial.deb
apt update
apt -y install puppetserver
#service puppetserver restart
#service puppetserver status

## 6th - GIT Installation and Config
apt update
apt -y install git
git config --global user.name "Andre Bacao"
git config --global user.email andre@bacao.pt
git config --global credential.helper 'cache --timeout=3600'
git clone https://github.com/abacao/home_puppetmaster.git
mv home_puppetmaster /etc
cp /etc/puppetlabs/* /etc/home_puppetmaster -R
sudo mv /etc/puppetlabs /etc/puppetlabs.bak
sudo mv /etc/home_puppetmaster /etc/puppetlabs
cd /etc/puppetlabs
sudo git pull
sudo git checkout master_install
sudo git add .
sudo git commit -a -m "added puppet default configs"
sudo git push origin master
