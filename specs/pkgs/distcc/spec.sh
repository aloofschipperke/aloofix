# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=distcc
version=3.1
sequence=1
description="A distributed C/C++ compilation system"
site=http://distcc.googlecode.com/files
compression_sufix=bz2
depends="user-distcc gcc popt-lib python2"
builddepends="popt-dev python2-dev"
section=devel
compression_suffix=bz2

license=GPLv2+
# INSTALL has the 'any later version' text
license_files="COPYING INSTALL"

configure_args=$(echo "$configure_args" | sed -e 's@--datarootdir=[^ ]\+@@')

extra_configure_args="--without-gtk
		--without-included-popt
		--without-gnome
		--without-avahi"

make_options="WERROR_CFLAGS="

install_target=install

preinstall_hook() {
    rm -rf "$preinstalldir/etc/default"
}

pkg_base_hook() {
    copy_from_spec etc/sv
}
