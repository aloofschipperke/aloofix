# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

imagetype=iso

volumeid="$distroname $distroversion"
appid="$distroname"

directories="
755 /bin
755 /boot
755 /boot/isolinux
755 /dev
"

devices="ram0"

packages="syslinux-license syslinux-iso
	linux-license linux"

initrd=iso_initrd.gz
