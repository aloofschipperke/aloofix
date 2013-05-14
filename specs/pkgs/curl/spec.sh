# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=curl
version=7.30.0
sequence=1
site=http://curl.haxx.se/download
description="Command-line tool for http,ftp,ftps,http,https file transfers"
depends="ca-certificates openssl-lib"
builddepends="openssl-dev"
section=web
compression_suffix=bz2

license=MIT
license_files="COPYING docs/LICENSE-MIXING"

extra_doc_files="CHANGES COPYING README RELEASE-NOTES
		 docs/BINDINGS docs/BUGS docs/CONTRIBUTE docs/FAQ
		 docs/FEATURES docs/INSTALL docs/INTERNALS
		 docs/LICENSE-MIXING docs/MANUAL
		 docs/RESOURCES docs/TODO docs/TheArtOfHttpScripting"

extra_configure_args="--with-ca-path=/etc/ssl/certs
		      --disable-debug --enable-optimize --disable-manual
                      --disable-ldap --disable-ldaps --disable-dict
		      --disable-telnet --disable-tftp --disable-ares
		      --disable-sspi --without-krb4 --without-spnego
		      --without-gssapi --without-libssh2 --without-gnutls
		      --without-nss --without-libidn
		      --with-ipv6"
