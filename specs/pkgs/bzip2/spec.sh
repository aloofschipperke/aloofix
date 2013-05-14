# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=bzip2
version=1.0.6
sequence=1
site=http://www.bzip.org/$version
description="Lossless block-sorting data compression"
depends=
section=devel

license=Bzip2
license_files=LICENSE

extra_doc_files="README CHANGES"

configure() { true; }

build() {
    make -j $make_j_qty
    make -j $make_j_qty -f Makefile-libbz2_so
}

preinstall() {
    make PREFIX="$preinstalldir/usr" install
    cp -P $src/libbz2.so* "$preinstalldir/usr/lib"
    ensure_dir "$preinstalldir/usr/share"
    mv "$preinstalldir/usr/man" "$preinstalldir/usr/share/man"
}

pkg_base_hook() {
    pkg_file_mv /usr/bin/bzip2 /usr/bin/bzip2.full
    pkg_file_mv /usr/bin/bunzip2 /usr/bin/buzip2.full
    pkg_file_mv /usr/bin/bzcat /usr/bin/bzcat.full
    register_alternative /usr/bin/bzip2 bzip2.full 100
    register_alternative /usr/bin/buzip2 buzip2.full 100
    register_alternative /usr/bin/bzcat bzcat.full 100
}
