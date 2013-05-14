# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=apr-util
version=1.5.2
sequence=1
site=http://www.apache.org/dist/apr
description="Companion library for APR"
depends="apr-lib expat-lib sqlite-lib"
builddepends="apr-dev expat-dev"
section=devel
compression_suffix=bz2

license=Apache-2.0
license_files="LICENSE"

extra_configure_args="--with-apr=/usr --with-expat=/usr"
install_target=install

extra_doc_files="CHANGES NOTICE README"

extra_dev_pkg_files="usr/bin usr/lib/aprutil.exp \
	usr/lib/apr-util-1/*.a usr/lib/apr-util-1/*.la"
