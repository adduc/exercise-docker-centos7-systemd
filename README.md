# Exercise: running systemd in centos7

This exercise shows how systemd can be run inside a centos 7 container.

### CGroups

Systemd in CentOS 7 relies on cgroups v1. A lot of newer Linux
distributions are now shipping with cgroups v2 enabled. To [enable
cgroups v1][1], the kernel parameter `systemd.unified_cgroup_hierarchy=0`
should be set. After rebooting, `/sys/fs/cgroup` should be mounted as a
tmpfs.

### File Descripter Limit (needed for performance)

yum was incredibly slow to run on my system. Running on a server with
Alpine it was considerably faster. A [GitHub Post][2] suggested setting
ulimit, which I couldn't get working on the service level but did have
success running ulimit as part of each yum command. I opted to use
docker build's ulimit option.

### Inspiration

- [CentOS' docker image documentation][3] describes how systemd can be
  configured to run within a container.


[1]: https://wiki.archlinux.org/title/Cgroups#Enable_cgroup_v1
[2]: https://github.com/docker/buildx/issues/379#issuecomment-1052980242
[3]: https://github.com/docker-library/docs/tree/master/centos#systemd-integration



