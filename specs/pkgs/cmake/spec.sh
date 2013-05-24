# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=cmake
majversion=2.8
minversion=11
version=${majversion}.$minversion
sequence=1
site=http://www.cmake.org/files/v$majversion
description="A cross-platform make system"
depends="curl-lib expat-lib zlib-lib"
builddepends="curl-dev expat-dev bzip2-dev zlib-dev ncurses-dev"
section=devel

license=Cmake
license_files="Copyright.txt Utilities/*/LICENSE Utilities/*/COPYING"

extra_doc_files="ChangeLog.txt Readme.txt"

configure() {
    ./configure --prefix=/usr \
	--docdir=/share/doc/cmake \
	--mandir=/share/man \
        --parallel=$make_j_qty \
        --system-curl \
        --system-expat \
        --system-zlib \
        --system-bzip2 \
        --no-qt-gui
}

make_options="VERBOSE=1"

preinstall() {
    make preinstall
    bin/cmake -DCMAKE_INSTALL_DO_STRIP=1 \
        -DCMAKE_INSTALL_PREFIX="$preinstalldir/usr" \
        -P cmake_install.cmake
}
