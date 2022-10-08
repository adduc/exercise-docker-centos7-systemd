FROM centos:7

# Update existing packages
RUN yum -y update \
 && rm -rf /var/cache /var/log/yum.log

# Delete unit files that are unneeded to run in a container
RUN (\
  cd /lib/systemd/system/sysinit.target.wants/; \
  for i in *; do \
    [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; \
  done); \
  rm -f /lib/systemd/system/multi-user.target.wants/*;\
  rm -f /etc/systemd/system/*.wants/*;\
  rm -f /lib/systemd/system/local-fs.target.wants/*; \
  rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
  rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
  rm -f /lib/systemd/system/basic.target.wants/*;\
  rm -f /lib/systemd/system/anaconda.target.wants/*;

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
