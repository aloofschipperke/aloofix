# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=nettle
version=2.7.1
sequence=1
site=http://ftp.gnu.org/gnu/$name
description="A cryptographic library"
depends="gmp-lib"
builddepends="m4 gmp-dev"
section=security

license=LGPLv2.1+
license_files="COPYING.LIB"

extra_doc_files="AUTHORS ChangeLog NEWS README descore.README TODO"

configure_args=$(echo "$configure_args" | sed -e 's/--disable-static//')

extra_configure_args="--disable-openssl"

install_target=install
