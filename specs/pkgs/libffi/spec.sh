# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=libffi
version=3.0.13
sequence=1
site=ftp://sourceware.org/pub/$name
description="A portable Foreign Function Interface library"
depends=
section=libraries

license=MIT
license_files=LICENSE

extra_doc_files="README ChangeLog*"
extra_dev_pkg_files="usr/lib/${name}-${version}"

configure() {
    # libffi configure fails if called with an absolute path for configure
    ./configure CFLAGS="$cflags" $configure_args
}
