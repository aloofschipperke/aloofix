# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=nmap
version=6.25
sequence=1
description="Network exploration tool and security/port scanner"
site=http://nmap.org/dist
depends="libpcap-lib openssl-lib pcre-lib"
builddepends="libpcap-dev openssl-dev pcre-dev lua-dev"
section=networking
compression_suffix=bz2

license="GPLv2+/OpenSSLException"
license_files="COPYING liblinear/LICENSE libdnet-stripped/LICENSE
	       nping/COPYING ndiff/COPYING ncat/COPYING
	       docs/3rd-party-licenses.txt docs/licenses/*"

extra_doc_files="CHANGELOG HACKING docs/README docs/*.txt"

make_j_qty=1

configure_args=${configure_args/--disable-static/}

extra_configure_args="
	--disable-nls
	--with-libdnet=included
	--with-liblinear=included
	--without-zenmap"

install_target=install
