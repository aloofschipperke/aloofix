# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=iproute2
version=3.9.0
sequence=1

description="Networking and traffic control utilities"
site=ftp://ftp.kernel.org/pub/linux/utils/net/$name
depends="iptables"
builddepends="pkg-config bison flex bash iptables-dev"
section=networking
compression_suffix=xz

license=GPLv2
license_files=COPYING

extra_doc_files="README*"

configure() {
    # we don't want arpd
    sed -i -e '/^TARGETS=/s/arpd//' misc/Makefile
    sed -i -e /ARPDIR/d Makefile
    sed -i -e 's/arpd.8//' man/man8/Makefile
    # this next one is unfortunate - gcc 4.8 is throwing a warning in lnstat.c
    sed -i -e 's/-Werror//' Makefile
}

build() {
    make -j $make_j_qty
}

preinstall_hook() {
    rm -rf "$preinstalldir/var/lib"
}

install_target=install

pkg_base_hook() {
    sed -i -e '1s@#!.*/#!/bin/sh@' "$pkgcontentdir/sbin/rtpr"
    sed -i -e '1s@#!.*/#!/bin/sh@' "$pkgcontentdir/sbin/ifcfg"
    pkg_file_mv /sbin/ip /sbin/ip.iproute2
    register_alternative /sbin/ip ip.iproute2 100
}
