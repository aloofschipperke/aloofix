# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=e2fsprogs
version=1.42.7
sequence=1
site=http://prdownloads.sourceforge.net/e2fsprogs
description="Ext[234] filesystem management utilities"
depends=
builddepends=
section=admin
priority=standard

license="GPLv2 LGPLv2 MIT custom"
license_files="COPYING */COPYING */*/COPYING"

extra_doc_files="README RELEASE-NOTES SUBMITTING-PATCHES doc/libblkid.txt"

extra_dev_pkg_files="bin/compile_et bin/mk_cmds
	usr/share/et usr/share/ss"

extra_configure_args="--sbindir=/sbin
                        --bindir=/bin
			--enable-elf-shlibs
                        --enable-verbose-makecmds
                        --disable-nls"

install_target="install install-libs"

preinstall_hook() {
    find "$preinstalldir/bin" -size +3k -a -type f | xargs strip
    strip "$preinstalldir"/sbin/*
    strip "$preinstalldir/usr/lib/e2initrd_helper"
    find "$preinstalldir"/usr/lib/*.so* -type f | xargs strip --strip-unneeded
}

pkg_base_hook() {
    register_conffile /etc/mke2fs.conf
}

###############################################################################
