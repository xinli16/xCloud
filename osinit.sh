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
xpath="/home/xl"
xfile=$xpath"/x"
xflag="xc-ubu"
sn="XC20080001"
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
