#!/bin/bash

#This Script will check service in docker instance if service is not available then, it will install

service=mysqld

if (( $(systemctl list-unit-files | grep $service | wc -l) > 0 ))
then
echo "$service is running!!!"
else
echo
echo "Installting Management Server's MYSQL"
sh /root/Rovius-CloudPlatform-4.11.0.0-rhel7/install.sh -d
fi

service=cloudstack-management

if (( $(systemctl list-unit-files | grep $service | wc -l) > 0 ))
then
echo "$service is running!!!"
else
echo "Installting Management Server Service"
sh /root/Rovius-CloudPlatform-4.11.0.0-rhel7/install.sh -m
fi

hs=`hostname`
echo $hs

#Now Checking for SQL setting

#mysql -u root -ppassword
mysql -u root -e "SET PASSWORD = PASSWORD('password');"
mysql -u root -ppassword -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'$hs' IDENTIFIED BY 'password';"
mysql -u root -ppassword -e "CREATE USER 'cloud'@'$hs' IDENTIFIED BY 'password';"
mysql -u root -ppassword -e "GRANT ALL PRIVILEGES ON *.* TO 'cloud'@'$hs' IDENTIFIED BY 'password';"


echo "Restarting MYSQL service...."
systemctl restart mysqld

rpm -e --nodeps mysql-connector-java-8.0.19-1.el7.noarch

wget http://mirror.centos.org/centos/7/os/x86_64/Packages/mysql-connector-java-5.1.25-3.el7.noarch.rpm

yum install slf4j -y

rpm -ivh mysql-connector-java-5.1.25-3.el7.noarch.rpm

#Now db setup
hs1=`hostname -i`

cloudstack-setup-databases cloud:password@$hs1 --deploy-as=root:password

cloudstack-setup-management --tomcat7

systemctl restart cloudstack-management
