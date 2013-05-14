# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=python2
majversion=2.7
minversion=4
version=${majversion}.${minversion}
sequence=1
site=http://www.python.org/ftp/python/$version
compression_suffix=xz
tarfile=Python-${version}.tar.$compression_suffix
src=Python-$version
description="Version 2.x of the Python scripting language"
depends="expat-lib libffi-lib zlib-lib openssl-lib"
builddepends="expat-dev libffi-dev zlib-dev openssl-dev"
section=devel

license=PSF-2
license_files="LICENSE */*/LICENSE */*/COPYING */*/*/LICENSE"

extra_doc_files="README"
extra_dev_pkg_files="usr/bin/python-config
		     usr/bin/python${majversion}-config"

install_target=install
