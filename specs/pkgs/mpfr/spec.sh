# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=mpfr
version=3.1.2
sequence=1
site=http://ftp.gnu.org/gnu/$name
description="The Multiple Precision Floating-Point Reliable Library"
depends="gmp-lib"
builddepends="gmp-dev"
section=devel
compression_suffix=xz

license="GPLv3+ LGPLv3+"
license_files="COPYING*"

extra_doc_files="AUTHORS BUGS NEWS README TODO"

base_pkg_excludes=usr/share
