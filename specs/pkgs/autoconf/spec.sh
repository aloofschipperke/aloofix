# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=autoconf
version=2.69
sequence=1
site=http://ftp.gnu.org/gnu/$name
description="Create configure scripts from M4 macros"
depends="m4 perl"
builddepends="m4 perl"
section=devel
compression_suffix=xz

license="GPLv3+"
license_files="COPYING*"

extra_doc_files="AUTHORS BUGS NEWS README THANKS TODO ChangeLog*"

install_target=install

preinstall_hook() {
    rm -rf "$preinstalldir/usr/share/info/standards.info"
}
