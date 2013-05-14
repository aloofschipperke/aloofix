# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=man-db
version=2.6.3
sequence=1
site=http://download.savannah.gnu.org/releases/$name
description="Manpage handling"
depends="user-man libpipeline-lib gdbm-lib groff-min less"
builddepends="user-man pkg-config libpipeline-dev gdbm-dev zlib-dev groff-min"
section=doctools
compression_suffix=xz

license="GPLv2+ LGPLv2.1+"
license_files="docs/COPYING*"

extra_doc_files="README FAQ NEWS"

extra_configure_args="--disable-nls
		      --enable-setuid"

pkg_base_hook() {
    copy_from_spec etc/cron.daily
    register_conffile /etc/man_db.conf
    pkg_file_mv /usr/bin/man /usr/bin/man.man-db
    register_alternative /sbin/man /usr/bin/man.man-db 100

    register_postinst "install -d -m 2755 -o man -g root /var/cache/man"
    register_postinst "chown man /usr/bin/man.man-db /usr/bin/mandb"
    register_postinst "chmod 4755 /usr/bin/man.man-db /usr/bin/mandb"
    register_postinst "mandb --create --quiet"
    register_postrm "rm -rf /var/cache/man"
}
