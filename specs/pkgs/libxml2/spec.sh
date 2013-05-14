# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=libxml2
version=2.9.0
sequence=1
site=ftp://xmlsoft.org/$name
description="An XML toolkit"
depends="zlib-lib"
builddepends="zlib-dev"
section=libraries

license=MIT
license_files="COPYING Copyright"

extra_doc_files="AUTHORS ChangeLog NEWS README TODO*"

extra_configure_args="--with-zlib --without-python"

extra_dev_pkg_files=usr/bin/xml2-config
