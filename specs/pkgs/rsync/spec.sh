# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=rsync
version=3.0.9
sequence=1
description="Rsync file transfer program"
site=http://samba.anu.edu.au/ftp/$name
depends="popt-lib"
builddepends="perl popt-dev"
section=admin

license=GPLv3+
license_files=COPYING

extra_doc_files="NEWS OLDNEWS README TODO"

extra_configure_args="
	--disable-debug
	--disable-locale
	--disable-iconv
	--disable-iconv-open
	--without-included-popt
	--enable-xattr-support
"
