# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=libnl
version=3.2.21
sequence=1
description="Library for working with netlink sockets"
site=http://www.infradead.org/~tgr/$name/files
depends="libnl-min"
builddepends="bison flex flex-dev"
section=networking

license=LGPLv2.1
license_files=COPYING

extra_doc_files="ChangeLog"

# extra_configure_args=--disable-cli

extra_pkgs=min

min_description="Minimal installation for libnl"
min_depends=libnl-lib

min_pkg_files=etc/libnl
base_pkg_excludes="$min_pkg_files"

pkg_min_hook() {
    register_conffile /etc/libnl/classid
    register_conffile /etc/libnl/pktloc
}
