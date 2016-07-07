#!/bin/bash

# Close SELINUX
# Close Firewalld
systemctl stop firewalld.service
systemctl disable firewalld.service
sed -i 's/enforcing/disabled/g' /etc/selinux/config

yum clean all
yum makecache

yum -y install vim openssh* ntp
service ntpd stop
ntpdate time.nist.gov
sed -i 's/0.centos.pool.ntp.org/time.nist.gov/g' /etc/ntp.conf
chkconfig ntpd on
service ntpd restart

yum check-update
# Install needed packages
for Package in deltarpm gcc gcc-c++ make cmake autoconf libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel ncurses ncurses-devel libaio readline-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5-devel libidn libidn-devel openssl openssl-devel libxslt-devel libicu-devel libevent-devel libtool libtool-ltdl bison gd-devel vim-enhanced pcre-devel zip unzip sysstat patch bc expect rsync git lsof lrzsz
do
    yum -y install $Package
done
yum -y update bash openssl glibc

# Set DNS
#cat > /etc/resolv.conf << EOF
#nameserver 114.114.114.114
#nameserver 8.8.8.8
#EOF