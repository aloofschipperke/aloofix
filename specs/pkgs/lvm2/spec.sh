# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=lvm2
version=2.02.98
sequence=1
site=ftp://sources.redhat.com/pub/$name
tarfile=LVM2.${version}.tgz
src=LVM2.$version
description="Logical Volume Management"
depends="lvm2-devmapper"
builddepends=
section=admin

license="GPLv2 LGPLv2.1"
license_files="COPYING*"

extra_doc_files="README WHATS_NEW WHATS_NEW_DM
		 doc/example.conf doc/pvmove_outline.txt
		 doc/tagging.txt doc/testing.txt"

extra_pkgs=devmapper

devmapper_description="Device Mapper"

devmapper_pkg_files="usr/lib/device-mapper
		     usr/lib/libdevmapper*.so*
		     usr/sbin/dmeventd
		     usr/sbin/dmsetup"

base_pkg_excludes="$devmapper_pkg_files"
lib_pkg_excludes="$devmapper_pkg_files"

extra_configure_args="--with-default-locking-dir=/dev/.lvm
		      --disable-nls
                      --disable-selinux
                      --disable-readline
                      --enable-cmdlib
                      --enable-dmeventd"

install_target=install

preinstall_hook() {
    # strip out blank/comment lines
    sed -i \
	-e '/^[[:space:]]*#/d' -e '/^$/d' \
        "$preinstalldir/etc/lvm/lvm.conf"
    # set a reasonable default for the 'filter' configuration
    sed -i \
	-e 's@^\([[:space:]]*filter =\).*@\1 [ "r|/dev/cdrom|", "r|/dev/hdc|" ]@' \
        "$preinstalldir/etc/lvm/lvm.conf"
}

pkg_base_hook() {
    copy_from_spec etc
    copy_from_spec lib/initramfs/hooks
    register_conffile /etc/modules.d/lvm2
}
