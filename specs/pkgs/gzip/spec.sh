# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=gzip
version=1.5
sequence=1
site=http://ftp.gnu.org/gnu/$name
description="GNU zip"
depends=
builddepends=
section=misc
compression_suffix=xz

license=GPLv3+
license_files=COPYING

extra_doc_files="ChangeLog* NEWS README THANKS TODO"

pkg_base_hook() {
    for P in gzip gunzip zcat
    do
	pkg_file_mv /usr/bin/$P /usr/bin/${P}.gnu
	register_alternative /bin/$P ../usr/bin/${P}.gnu 100
    done
}
