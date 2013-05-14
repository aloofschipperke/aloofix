# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=bison
version=2.7.1
sequence=1
site=http://ftp.gnu.org/pub/gnu/$name
description="GNU Bison utility"
depends=m4
builddepends="m4 perl"
section=devel
compression_suffix=xz

license=GPLv3+
license_files=COPYING

extra_doc_files="AUTHORS ChangeLog* README THANKS TODO NEWS"

extra_configure_args="--disable-nls \
	--without-libintl-prefix --without-libiconv-prefix"

configure_hook() {
        sed -i -e '/gets is a/d' "$src/lib/stdio.in.h"
}
