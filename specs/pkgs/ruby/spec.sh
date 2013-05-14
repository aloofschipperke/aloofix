# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=ruby
majversion=2.0
minversion=0
version=${majversion}.$minversion
patchlevel=0
sequence=1
description="Ruby programming language"
site=ftp://ftp.ruby-lang.org/pub/$name/$majversion
compression_suffix=bz2
tarfile=${name}-${version}-p${patchlevel}.tar.$compression_suffix
src=${name}-${version}-p${patchlevel}
depends="libffi-lib"
builddepends="libffi-dev"
section=devel

license="Ruby or BSD-2-Clause"
license_files="BSDL COPYING* GPL LEGAL */*/LICENSE* */*/*/LICENSE"

extra_doc_files="ChangeLog NEWS README* doc/ChangeLog* NEWS*"

configure() {
    ./configure rb_cv_binary_elf=yes \
	CFLAGS="$cflags" \
	--prefix=/usr
}

install_target=install
