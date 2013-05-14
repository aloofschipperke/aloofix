# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=mdadm
version=3.2.6
sequence=1
description="Manage MD devices aka Linux Software RAID"
site=ftp://ftp.kernel.org/pub/linux/utils/raid/$name
depends="linux-md linux-crypto mdadm-min"
builddepends=
section=admin
compression_suffix=xz

license=GPLv2
license_files=COPYING

extra_doc_files="ANNOUNCE* COPYING ChangeLog README.initramfs TODO"

extra_pkgs="min"

min_description="Minimal subset of mdadm package"

min_pkg_files=sbin/mdadm
base_pkg_files=sbin/mdmon

configure() { true; }

build() {
    make -j $make_j_qty CXFLAGS="$cflags"
}

install_target=install

pkg_base_hook() {
    copy_from_spec etc
    copy_from_spec lib/initramfs/hooks
    copy_from_spec usr/lib/mdadm
    register_conffile /etc/modules.d/mdadm
}
