# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=opkg
version=0.1.8
sequence=1
site=http://opkg.googlecode.com/files
description="Lightweight package management system"
depends=
section=core
priority=required

license=GPLv2+
license_files=COPYING

extra_doc_files="AUTHORS ChangeLog NEWS README TODO"

base_pkg_excludes=usr/bin/opkg-key

extra_configure_args="--disable-static
			--disable-curl
                        --disable-gpg
                        --disable-shave"

pkg_base_hook() {
    pkg_file_mv /usr/bin/opkg-cl /usr/bin/opkg
    install -d -m 0755 "$pkgcontentdir/usr/lib/opkg/alternatives"
    copy_from_spec etc/opkg
    copy_from_spec usr/share/aloofix
    echo "arch $arch 10" >>"$pkgcontentdir/etc/opkg/opkg.conf"
    register_conffile /etc/opkg/opkg.conf
}
