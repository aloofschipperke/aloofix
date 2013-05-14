# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=cdrtools
version=3.00
sequence=1
site=ftp://ftp.berlios.de/pub/cdrecord
description="CD and DVD utilities"
section=misc
compression_suffix=bz2

license="CDDL.Schily GPLv2 LGPLv2.1"
license_files="COPYING */COPYING */LICENSE CDDL.Schily.txt
	       GPL-2.0.txt LGPL-2.1.txt"

extra_doc_files="ABOUT AN-* Changelog* CONTRIBUTING README README.linux-shm"

extra_dev_pkg_files="usr/lib/profiled"

extra_pkgs=mkisofs
mkisofs_pkg_files=usr/bin/mkisofs
base_pkg_excludes="$mkisofs_pkg_files"

mkisofs_section=base
mkisofs_description="mkisofs from cdrtools"

configure() {
    # sed -e 's@/opt/schily@/usr@g' DEFAULTS/Defaults.linux
    true
}

build() {
    make -j $make_j_qty COPTOPT="$cflags" INS_BASE=/usr
}

preinstall() {
    make -C "$src" \
        INS_BASE="$preinstalldir/usr" \
        DEFINSUSR=root DEFINSGRP=root \
        MANDIR=share/man \
        install
    rm -rf "$preinstalldir/usr/share/man/man5"
}
