# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=pth
version=2.0.7
sequence=1
site=http://ftp.gnu.org/gnu/$name
description="GNU Portable Threads"
depends=
section=devel

license=LGPLv2.1+
license_files=COPYING

make_j_qty=1

configure_args="--prefix=/usr
	--sysconfdir=/etc
	--localstatedir=/var
	--infodir=/usr/share/info
	--mandir=/usr/share/man
	--enable-shared
	--disable-static
	--disable-silent-rules"

extra_doc_files="ANNOUNCE AUTHORS ChangeLog NEWS README
		SUPPORT TESTS THANKS USERS"
