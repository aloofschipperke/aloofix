# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=install2hd
version=$distroversion
sequence=1
site=http://aloofschipperke.com/aloofix/
description="Scripts to install Aloofix on a hard disk"
depends=busybox
section=admin
license=GPLv3
arch=noarch

license_files=aloofix
extra_doc_files=
urls=none

no_sigs

retrieve() { true; }
unpack() { true; }
configure() { true; }
build() { true; }
preinstall() { true; }

pkg_base_hook() {
    copy_from_spec bin
    copy_from_spec usr/share/install2hd
}
