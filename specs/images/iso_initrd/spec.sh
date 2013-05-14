# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

imagetype=initrd

directories="
755 /mnt/hd
755 /usr/share/udhcpc
"

devices="console null"

packages="base-license base
	syslinux-license syslinux
	glibc-license glibc-min
	tzdata-license tzdata-min
	busybox-license busybox
	opkg-license opkg-lib opkg
	e2fsprogs-license e2fsprogs-lib e2fsprogs
"

if [ -f /etc/aloofix-release ]
then
    packages="$packages
	linux-license linux-md
	lvm2-license lvm2-devmapper lvm2
	mdadm-license mdadm-min"
fi

localize() {
    copy_spec_files etc
    mv linuxrc init
    sed -i -e 's/^root:[^:]*:/root::/' etc/shadow
    echo '::respawn:-/sbin/getty 115200 console' >>etc/inittab
    echo 'initrd' >etc/hostname
    echo -e '\ndest hd /mnt/hd' >>etc/opkg/opkg.conf
    >etc/sysctl.conf
}
