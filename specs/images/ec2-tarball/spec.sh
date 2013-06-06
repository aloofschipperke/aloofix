# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

imagetype=tarball

directories="
755 /etc/sv/default
"

devices="console null zero"

packages="base-license base
	glibc-license glibc-min
	tzdata-license tzdata-min
	busybox-license busybox
	opkg-license opkg-lib opkg
	e2fsprogs-license e2fsprogs-lib e2fsprogs
	zlib-license zlib-lib
	dropbear-license dropbear
"

localize() {
    copy_spec_files etc
    touch firstboot
    [ -f etc/init.d/firstboot.rootpw ] \
	|| mv etc/init.d/no.firstboot.rootpw etc/init.d/firstboot.rootpw
    echo ec2-host >etc/hostname
    ln -s dhcp etc/ifplugd/ifplugd.eth0
    for svc in ifplugd.eth0 klogd syslogd ntpd dropbear
    do
	ln -s ../all/$svc etc/sv/default
    done
    install -d -m 0755 root/.ssh
    touch root/.ssh/authorized_keys
    chmod 0700 root/.ssh/authorized_keys
}
