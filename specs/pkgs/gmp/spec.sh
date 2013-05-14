# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=gmp
version=5.1.1
sequence=1
site=ftp://ftp.gmplib.org/pub/${name}-${version}
description="A library for arbitrary precision arithmetic"
depends="gcc-gcclib"
builddepends="m4"
section=devel
compression_suffix=xz

license="GPLv3+ LGPLv3+"
license_files="COPYING*"

extra_configure_args="ABI=32"

extra_doc_files="AUTHORS NEWS README
	         doc/configuration doc/isa_abi_headache"
