# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=dnsmasq
version=2.66
sequence=1
site=http://www.thekelleys.org.uk/$name
description="Lightweight DNS server/forwarder"
depends="user-dns"
builddepends=
section=admin
compression_suffix=xz

license="GPLv2 GPLv3"
license_files="COPYING*"

extra_doc_files="CHANGELOG* doc.html dnsmasq.conf.example"

configure() { true; }

make_options="PREFIX=/usr"

install_target=install
install_options="$make_options"

pkg_base_hook() {
    copy_from_spec etc
    install -d -m 755 "$pkgcontentdir/etc/dnsmasq.d"
    register_conffile /etc/dnsmasq.conf
}
