# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=diffutils
version=3.3
sequence=1
site=http://ftp.gnu.org/pub/gnu/$name
compression_suffix=xz
description="GNU Diff utilities"
depends=
builddepends=
section=misc

license=GPLv3+
license_files=COPYING

extra_doc_files="AUTHORS ChangeLog* NEWS README THANKS TODO"

extra_configure_args="--disable-nls"

configure_hook() {
    sed -i -e '/gets is a/d' "$src/lib/stdio.in.h"
}

pkg_base_hook() {
    pkg_file_mv /usr/bin/cmp /usr/bin/cmp.gnu
    pkg_file_mv /usr/bin/diff /usr/bin/diff.gnu
    register_alternative /usr/bin/cmp cmp.gnu 100
    register_alternative /usr/bin/diff diff.gnu 100
}
