# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=memcached
version=1.4.15
sequence=1
site=http://memcached.googlecode.com/files
description="High-performance memory object caching system"
depends="libevent-lib"
builddepends="libevent-dev"
section=devel

license=BSD-3-Clause
license_files=COPYING

extra_doc_files="README.md AUTHORS NEWS
	doc/CONTRIBUTORS doc/protocol.txt doc/threads.txt"
