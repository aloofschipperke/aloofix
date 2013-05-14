# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=libmpc
version=1.0.1
sequence=1
site=http://www.multiprecision.org/mpc/download
tarfile=mpc-${version}.tar.gz
src=mpc-$version
description="A complex floating-point library with exact rounding"
depends="gmp-lib mpfr-lib"
builddepends="gmp-dev mpfr-dev"
section=devel

license=LGPLv3+
license_files=COPYING.LESSER

extra_doc_files="AUTHORS NEWS README TODO"

