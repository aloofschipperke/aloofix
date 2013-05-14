# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=make
version=3.82
sequence=1
site=http://ftp.gnu.org/pub/gnu/$name
description="GNU Make"
depends=
section=devel
compression_suffix=bz2

license="GPLv3+ LGPLv2+"
license_files="COPYING */COPYING*"

extra_doc_files="AUTHORS ChangeLog NEWS README"

extra_configure_args="--disable-nls \
	--without-libiconv-prefix --without-libintl-prefix"
