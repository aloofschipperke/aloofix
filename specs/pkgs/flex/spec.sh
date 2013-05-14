# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=flex
version=2.5.37
sequence=1
site=http://prdownloads.sourceforge.net/$name
description="Flex lexical analyzer generator"
depends=
builddepends="m4"
section=devel

compression_suffix=bz2

license=Flex
license_files=COPYING

extra_doc_files="AUTHORS ChangeLog NEWS ONEWS README THANKS TODO"

configure() {
    ./configure CFLAGS="$cflags" CXXFLAGS="$cflags" \
	$configure_args \
	--disable-nls \
        --without-libiconv-prefix --without-libintl-prefix
}
