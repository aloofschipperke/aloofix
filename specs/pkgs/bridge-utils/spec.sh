# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=bridge-utils
version=1.5
sequence=1
patchlist=ip6

site=http://downloads.sourceforge.net/bridge
description="IEEE 802.1d Ethernet Bridging tools"
depends=linux-netbridge
builddepends=autoconf
section=networking

license=GPLv2+
license_files=COPYING

extra_doc_files="AUTHORS README THANKS TODO doc/FAQ doc/HOWTO doc/WISHLIST"

install_target=install

configure() {
    autoconf
    ./configure CFLAGS="$cflags" $configure_args
}
