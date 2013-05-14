# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=neon
version=0.29.6
sequence=1
site=http://www.webdav.org/$name
description="HTTP and WebDAV client library"
depends="openssl zlib-lib expat-lib"
builddepends="openssl-dev zlib-dev expat-dev"
section=libraries

license="LGPLv2+ GPLv2+"
license_files="*/COPYING*"

extra_doc_files="AUTHORS BUGS NEWS README THANKS TODO"

extra_configure_args="--with-expat
		      --disable-nls
                      --with-ssl=openssl
                      --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt"

install_target=install

preinstall_hook() {
    # broken .so entries in the man pages
    sed -i -e 's@^\.so @.so man3/@' "$preinstalldir/usr/share/man/man3"/*.3
}
