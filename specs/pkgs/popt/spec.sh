# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=popt
version=1.16
sequence=1
site=http://rpm5.org/files/$name
description="Popt option-handling library"
section=libraries

license=MIT
license_files=COPYING

extra_doc_files="CHANGES README"

extra_configure_args="--disable-nls
		      --without-libiconv-prefix
		      --without-libintl-prefix"
