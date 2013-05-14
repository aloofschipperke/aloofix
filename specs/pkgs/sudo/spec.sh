# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=sudo
version=1.8.6p8
sequence=1
description="Give limited root privileges to specific users"
site=http://www.sudo.ws/$name/dist
depends=zlib-dev
builddepends="zlib-dev groff-min"
section=admin

license=ISC
license_files=doc/LICENSE

extra_doc_files="README ChangeLog NEWS"

configure() {
    ./configure CFLAGS="$cflags" $configure_args \
	--disable-nls \
	--without-pam \
	--disable-root-mailer \
	--without-lecture \
	--with-ignore-dot \
	--with-editor=/bin/vi \
	--with-env-editor \
	--enable-zlib=system \
	--with-passprompt="[sudo] passowrd for %p: " \
	|| return 1
}

install_target=install
