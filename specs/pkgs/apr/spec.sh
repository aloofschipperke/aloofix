# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=apr
version=1.4.6
sequence=1
site=http://www.apache.org/dist/$name
description="The Apache Portable Runtime library"
section=devel
compression_suffix=bz2

license=Apache-2.0
license_files="LICENSE NOTICE"

extra_configure_args=--with-installbuilddir=/usr/share/$name/build-1
install_target=install

extra_dev_pkg_files="usr/bin usr/share/apr usr/lib/apr.exp"

extra_doc_files="CHANGES README \
	docs/*.html docs/non_apr_programs docs/incomplete_types"
