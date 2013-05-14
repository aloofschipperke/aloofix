# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=iana-etc
version=2.30
sequence=1
site=http://sethwklein.net
description="IANA services and protocols files"
builddepends=gawk
section=misc
arch=noarch
compression_suffix=bz2

make_options="STRIP=yes"
make_targets="get files"

license="OSLv3 GPLv3"
license_files=COPYING

extra_doc_files="CREDITS NEWS README"

configure() { true; }

install_target=install

pkg_base_hook() {
    register_conffile /etc/services
    register_conffile /etc/protocols
}
