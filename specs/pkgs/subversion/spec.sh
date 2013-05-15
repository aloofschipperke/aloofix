# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=subversion
version=1.7.9
sequence=1
site=http://archive.apache.org/dist/$name
description="Version control system"
depends="sqlite-lib apr-lib apr-util-lib openssl serf-lib neon-lib zlib-lib expat-lib"
builddepends="apr-dev apr-util-dev openssl-dev serf-dev neon-lib sqlite-dev zlib-dev"
section=devel
compression_suffix=bz2

license=Apache-2.0
license_files="LICENSE NOTICE"

extra_doc_files="BUGS CHANGES COMMITTERS README"

extra_configure_args="--with-ssl --disable-nls"
make_options="LIBS=-lexpat"
install_target=install
