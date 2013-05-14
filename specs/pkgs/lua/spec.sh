# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=lua
version=5.2.2
sequence=1
description="Lightweight programming language"
site=http://www.lua.org/ftp
depends="readline-lib ncurses"
builddepends="readline-dev ncurses-dev"
section=devel

license=MIT
license_files="doc/readme.html"

extra_doc_files="doc/*.html doc/*.css doc/*.gif doc/*.png"

configure() { true; }

build() {
    make -j $make_j_qty MYCFLAGS="$cflags" MYLIBS="-lncurses" linux
}

preinstall() {
    make INSTALL_TOP="$preinstalldir/usr" \
	INSTALL_MAN="$preinstalldir/usr/share/man/man1" install
}
