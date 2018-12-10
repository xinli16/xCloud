#!/bin/bash
#############################################################################
# @file: osinit.sh - the script to setup cloud system
# @author: xinli zhang
# @version: 1.0
# @create: 2018.12.01
# @latest: 2018.12.01
#############################################################################

# 1. Install Ubuntu 18.04.01 LTS server with user: xl and password: zhang

# 2. Create x-folder and write sn and name of system
if [ 1 -gt 0 ];then
xpath="/home/x"
xfile=$xpath"/x"

xflag="$$xc-ubu$$"
sn="XC20180001"
name="xc01"

if [ -d $xpath ]; then
rm -rf $xpath
fi
mkdir $xpath

echo ${xflag} >> ${xfile}
echo ${sn} >> ${xfile}
echo ${name} >> ${xfile}
fi

# 3. Copy files
if [ 0 -gt 0 ];then
cp xc.sh $xpath
fi

# 4. Get updates
if [ 1 -gt 0 ];then
apt-get -y update
fi

# 5. install and config samba
if [ 1 -gt 0 ];then
apt-get -y install samba samba-common
mkdir /home/xcs
mkdir /home/xcs/pics
chmod -R 777 /home/xs
sed -i '/max log size = 1000/asecurity = user' /etc/samba/smb.conf
sed -i '$a [xcs]\ncomment = xCloud Share Folder\npath = /home/xs\nbrowseable = yes\nwritable = yes' /etc/samba/smb.conf
useradd xc01
(echo 123456; echo 123456)|smbpasswd -a xc01
service samba restart
fi

# 6. Install and config mysql
if [ 1 -gt 0 ];then
apt-get -y install mysql-server
apt-get -y install mysql-client
apt-get -y install libmysqlclient-dev
sh ./nidb_s.sh
fi
