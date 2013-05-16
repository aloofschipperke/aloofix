# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=pciutils
version=3.2.0
sequence=1
site=ftp://ftp.kernel.org/pub/software/utils/$name
description="PCI utilities"
depends="zlib-lib"
builddepends="zlib-dev"
section=admin
compression_suffix=xz

license="GPLv2+ GPL+"
license_files=COPYING

extra_doc_files="README ChangeLog"

extra_pkgs=update
update_pkg_files=usr/sbin/update-pciids

update_description="Update script for pci.ids"
update_depends=gzip

base_pkg_excludes="$update_pkg_files"

build() {
    make -j $make_j_qty \
	OPT="$cflags" \
        ZLIB=yes DNS=yes SHARED=yes \
        PREFIX=/usr \
        MANDIR=/usr/share/man
}

configure() { true; }

preinstall() {
    make \
        DESTDIR="$preinstalldir" \
	OPT="$cflags" \
        ZLIB=yes DNS=yes SHARED=yes \
        PREFIX=/usr \
        MANDIR=/usr/share/man \
        install install-lib
}

pkg_base_hook() {
    pkg_file_mv /usr/sbin/lspci /usr/sbin/lspci.pciutils
    register_alternative /usr/bin/lspci ../sbin/lspci.pciutils 100
    register_conffile /usr/share/pci.ids.gz
}

pkg_update_hook() {
    copy_from_spec etc/cron.daily
}
