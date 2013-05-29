# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=openssl
version=1.0.1e
sequence=2
site=http://www.openssl.org/source
description="A library for SSL v2/v3, TLS v1, and general cryptography"
depends="perl zlib-lib"
builddepends="perl zlib-dev"
section=security
patchlist=broken-pod

make_j_qty=1

license=Openssl
license_files="LICENSE crypto/*/COPYRIGHT"

extra_doc_files="CHANGES* NEWS README"

configure() {
    ./Configure linux-elf \
        $cflags \
        --prefix=/usr --openssldir=/etc/ssl --shared \
        zlib-dynamic no-idea no-rc5
    # newest pod2man defaults to die on error and openssl has several errors
    find doc -name '*.pod' \
	| xargs sed -ibak -e 's/^=item \([0-9]\+\) *$/=item B<\1>/'
    make depend
}

preinstall() {
    make INSTALL_PREFIX="$preinstalldir" \
        MANDIR=/usr/share/man \
        MANSUFFIX=ssl \
        install
}
