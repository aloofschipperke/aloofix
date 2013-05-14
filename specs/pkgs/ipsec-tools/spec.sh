# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=ipsec-tools
version=0.8.1
sequence=1
site=http://downloads.sourceforge.net/sourceforge/$name
description="IPsec utilities"
depends=
builddepends="openssl-dev bison flex flex-dev"
section=security
compression_suffix=bz2

license=BSD-3-Clause
license_files=NEWS

extra_doc_files="ChangeLog* README NEWS"

extra_cflags="-fno-strict-aliasing"
extra_configure_args="--disable-rc5
	--disable-idea
	--disable-security-context
	--with-kernel-headers=/usr/include
	--enable-hybrid
	--enable-dpd
	--enable-natt
	--enable-adminport"

build() {
    # ipsec-tools configure add Werror to CFLAGS, so we force CFLAGS
    make -j $make_j_qty CFLAGS="$cflags"
}

pkg_base_hook() {
    copy_from_spec etc
}
