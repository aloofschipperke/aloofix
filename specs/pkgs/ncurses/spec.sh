# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=ncurses
version=5.9
sequence=2
site=http://ftp.gnu.org/pub/gnu/$name
description="NCurses library and support utilities"
depends=
section=devel

license=MIT
# History fans should look at the history of ncurses licensing.
license_files="README"

extra_doc_files="ANNOUNCE AUTHORS NEWS README TO-DO
		 doc/hackguide.doc doc/ncurses-intro.doc"

extra_dev_pkg_files=usr/bin/ncurses5-config
install_target=install

configure() {
    ./configure CFLAGS="$cflags" \
        --with-build-cflags="$cflags" \
        --prefix=/usr \
        --infodir=/usr/share/info \
        --mandir=/usr/share/man \
        --without-cxx \
        --without-ada \
	--with-ext-colors \
	--enable-ext-mouse \
	--enable-pc-files \
	--with-termlib \
        --with-shared \
        --without-normal \
        --without-debug
}

pkg_base_hook() {
    pkg_file_mv /usr/bin/clear /usr/bin/clear.ncurses
    pkg_file_mv /usr/bin/reset /usr/bin/reset.ncurses
    register_alternative /usr/bin/clear clear.ncurses 100
    register_alternative /usr/bin/reset reset.ncurses 100
}
