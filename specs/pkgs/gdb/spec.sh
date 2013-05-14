# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=gdb
version=7.6
sequence=1
site=http://ftp.gnu.org/gnu/$name
description="The GNU Debugger"
depends="ncurses expat-lib python2"
builddepends="texinfo python2 python2-dev expat-dev zlib-dev ncurses-dev"
section=devel
compression_suffix=bz2

license="GPLv3+ GPLv2+ LGPLv3+ LGPLv2.1+ LGPLv2+"
license_files="COPYING* */COPYING* */*/COPYING*"

extra_doc_files="README MAINTAINERS ChangeLog"

make_j_qty=1

configure_args="--prefix=/usr"
extra_configure_args="--with-python=/usr/bin/python2
		      --disable-nls
		      --with-expat
		      --with-zlib
		      --with-curses
		      --enable-tui
		      --without-x
"

install_target=install

preinstall_hook() {
    rm -rf "$preinstalldir"/usr/include/*.h
    rm -rf "$preinstalldir"/usr/lib/libiberty.a
    rm -rf "$preinstalldir"/usr/lib/libbfd.*
    rm -rf "$preinstalldir"/usr/lib/libopcodes.*
    rm -rf "$preinstalldir"/usr/share/info/standards.info
    rm -rf "$preinstalldir"/usr/share/info/bfd.info
    rm -rf "$preinstalldir"/usr/share/info/configure.info
}
