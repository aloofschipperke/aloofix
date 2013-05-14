# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=tar
version=1.26
sequence=1
site=http://ftp.gnu.org/gnu/$name
description="GNU Tar utility"
depends=
section=admin
compression_suffix=xz

license=GPLv3+
license_files=COPYING

extra_doc_files="AUTHORS ChangeLog* NEWS README THANKS TODO"

extra_configure_args="--bindir=/bin \
	--disable-nls --without-libiconv-prefix --without-libintl-prefix"

configure_hook() {
    sed -i -e '/gets is a/d' $src/gnu/stdio.in.h
}

pkg_base_hook() {
    pkg_file_mv /bin/tar /bin/gtar
    register_alternative /bin/tar gtar 100
}
