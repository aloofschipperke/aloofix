# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=serf
version=1.2.0
sequence=1
site=http://serf.googlecode.com/files
description="High-performance asynchronous HTTP client library"
depends="zlib-lib apr-lib apr-util-lib openssl"
builddepends="apr-dev apr-util-dev"
section=libraries
compression_suffix=bz2

license=Apache-2.0
license_files=LICENSE

extra_doc_files="CHANGES LICENSE NOTICE README design-guide.txt"

install_target=install

###############################################################################

