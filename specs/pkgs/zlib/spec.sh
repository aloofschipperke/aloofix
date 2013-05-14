# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=zlib
version=1.2.8
sequence=1
site=http://www.zlib.net
priority=standard
description="Zlib data compression library"
section=libraries
compression_suffix=xz

license=Zlib
license_files=README

extra_doc_files="ChangeLog FAQ README"

configure() {
    CFLAGS="$cflags -fPIC" \
        ./configure --prefix=/usr --shared --libdir=/lib
}

preinstall() {
    make prefix="$preinstalldir/usr" \
	libdir="$preinstalldir/lib" \
	pkgconfigdir="$preinstalldir/usr/lib/pkgconfig" \
	install
    strip --strip-unneeded $preinstalldir/lib/libz.*
}
