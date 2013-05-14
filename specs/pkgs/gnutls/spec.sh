# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=gnutls
majversion=3.2
minversion=0
version=${majversion}.$minversion
sequence=1
site=ftp://ftp.gnutls.org/gcrypt/$name/v$majversion
description="GNU Transport Layer Security"
depends="gcc-gcclib nettle zlib-lib"
builddepends="nettle-dev zlib-dev"
section=security
compression_suffix=xz

license="GPLv3+ LGPLv2.1+ BSD LGPLv3+"
license_files="COPYING* */*/COPYING*"

extra_doc_files="AUTHORS ChangeLog NEWS README THANKS doc/TODO"

extra_configure_args="--disable-nls"

