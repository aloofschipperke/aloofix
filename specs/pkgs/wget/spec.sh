# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=wget
version=1.14
sequence=1
site=http://ftp.gnu.org/gnu/$name
description="Command-line http/ftp client"
depends="zlib-lib libgpg-error-lib libgcrypt-dev nettle-lib gnutls-lib"
builddepends="zlib-dev libgpg-error-dev libgcrypt-dev gnutls-dev"
section=web
compression_suffix=xz

license=GPLv3+
license_files=COPYING

extra_doc_files="AUTHORS src/ChangeLog MAILING-LIST"

extra_configure_args="--with-ssl=gnutls --disable-nls"
install_target=install

pkg_base_hook() {
    register_conffile /etc/wgetrc
    pkg_file_mv /usr/bin/wget /usr/bin/wget.gnu
    register_alternative /usr/bin/wget wget.gnu 100
}

