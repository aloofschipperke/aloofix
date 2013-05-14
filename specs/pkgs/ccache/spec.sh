# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=ccache
version=3.1.9
sequence=1
site=http://samba.org/ftp/$name
description="Compiler cache mechanism"
section=devel
depends="zlib-lib"
builddepends="zlib-dev"
compression_suffix=xz

license=GPLv3+
license_files="LICENSE.txt GPL-3.0.txt"

extra_doc_files="AUTHORS.txt MANUAL.txt NEWS.txt README.txt"

install_target=install
