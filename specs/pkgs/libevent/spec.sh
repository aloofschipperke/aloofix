# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=libevent
version=2.0.21
sequence=1
site=https://github.com/downloads/$name/$name
compression_suffix=gz
tarfile=${name}-${version}-stable.tar.$compression_suffix
src=${name}-${version}-stable
description="Asynchronous event notification library"
depends="openssl"
builddepends="wget"
section=libraries

license=BSD-3-Clause
license_files=LICENSE

extra_doc_files="README whatsnew-2.0.txt"

wget_options=--no-check-certificate
