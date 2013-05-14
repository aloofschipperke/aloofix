# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=unifdef
version=2.8
sequence=1
site=http://dotat.at/prog/$name
description="Remove #ifdef lines from a file"
section=devel

make_j_qty=1

license=BSD-2-Clause
doc_license=BSD-3-Clause
license_files=COPYING

extra_doc_files="README"

configure() { true; }

make_targets="clean unifdef"

build() {
    make -j $make_j_qty prefix=/usr
}

preinstall() {
    make DESTDIR="$preinstalldir" prefix=/usr install || return 1
    strip "$preinstalldir/usr/bin/unifdef"
}
