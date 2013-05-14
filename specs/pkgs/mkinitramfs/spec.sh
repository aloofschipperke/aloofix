# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=mkinitramfs
version=$distroversion
sequence=1
description="Utility for creating Aloofix initramfs images"
site=http://aloofschipperke.com/aloofix/
depends=
builddepends=
section=core
arch=noarch

license=GPLv3
license_files=aloofix

urls=none

no_sigs

retrieve() { true; }
unpack() { true; }
configure() { true; }
build() { true; }
preinstall() { true; }

pkg_base_hook() {
    copy_from_spec etc
    copy_from_spec lib/initramfs
    copy_from_spec sbin
    register_conffile /etc/initramfs.conf
}
