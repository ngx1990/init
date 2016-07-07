#!/bin/sh
chkconfig ntpd on
ntpdate time.nist.gov
sed -i 's/0.centos.pool.ntp.org/time.nist.gov/g' /etc/ntp.conf
sed -i 's/enforcing/disabled/g' /etc/selinux/config
service ntpd restart
service ntpd stop
systemctl disable firewalld.service
systemctl stop firewalld.service
yum -y install vim openssh* ntp
yum clean all