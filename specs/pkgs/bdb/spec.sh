# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=bdb
version=5.3.21
sequence=1
site=http://download.oracle.com/berkeley-db
src=db-$version
tarfile=db-${version}.tar.gz
description="Berkeley DB package"
section=databases

license=Sleepycat
license_files=LICENSE

configure() {
    cd $src/build_unix && \
	../dist/configure CFLAGS="$cflags" \
	--prefix=/usr \
	--disable-static \
	--docdir=/usr/share/doc/$name \
	--enable-compat185
}

build_subdir=build_unix
make_options="docdir=/usr/share/doc/$name"
install_options="$make_options"
install_target=install
