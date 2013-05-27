# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=zip
majversion=3
minversion=0
version=3.0
sequence=1
description="A compression and file packaging utility"
compression_suffix=zip
src=${name}${majversion}${minversion}
tarfile=${src}.$compression_suffix
site=ftp://ftp.info-zip.org/pub/infozip/src
depends=
builddepends=
section=misc

license=BSD-Infozip
license_files=LICENSE

extra_doc_files="BUGS CHANGES README README.CR TODO WHATSNEW *.ann"

configure() { true; }

build() {
	make -j $make_j_qty -f unix/Makefile LOCAL_ZIP="$cflags" prefix=/usr generic_gcc
}

preinstall() {
	make -f unix/Makefile \
	     prefix="$preinstalldir/usr" \
	     MANDIR="$preinstalldir/usr/share/man/man1" install
	strip "$preinstalldir"/usr/bin/*
}
