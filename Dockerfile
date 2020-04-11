FROM centos:centos7.2.1511
MAINTAINER "Akshar" <axar1990@gmail.com>
ENV container docker
RUN yum -y install initscripts wget && yum clean all
RUN yum -y install systemd; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]

RUN wget --no-check-certificate --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1jnaLvJ0UTeimyaV6eLnWo-m2PvcCUfT8' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1jnaLvJ0UTeimyaV6eLnWo-m2PvcCUfT8" -O /root/Rovius-CloudPlatform-4-11-0-0-rhel7.tar && rm -rf /tmp/cookies.txt

RUN tar -xf /root/Rovius-CloudPlatform-4-11-0-0-rhel7.tar -C /root

RUN wget --no-check-certificate --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1V_KG4ba5JGtqaZgdedWD8j51WFKbLdbX' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1V_KG4ba5JGtqaZgdedWD8j51WFKbLdbX" -O /root/cpsetup.sh && rm -rf /tmp/cookies.txt

RUN wget --no-check-certificate --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=11xCrwUvttq4gPZMc7cp3FLzhwmRELE-H' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=11xCrwUvttq4gPZMc7cp3FLzhwmRELE-H" -O /root/acphf.sh && rm -rf /tmp/cookies.txt

RUN chmod 777 /root/cpsetup.sh

RUN chmod 777 /root/acphf.sh
