# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=findutils
version=4.4.2
sequence=1
site=http://ftp.gnu.org/pub/gnu/$name
description="GNU Findutils package"
depends=
builddepends=
section=misc

license=GPLv3+
license_files=COPYING

extra_doc_files="AUTHORS ChangeLog NEWS README* THANKS TODO"

extra_configure_args="--localstatedir=/var/cache/locate
		      --disable-nls"

pkg_base_hook() {
    pkg_file_mv /usr/bin/find /usr/bin/find.gnu
    pkg_file_mv /usr/bin/xargs /usr/bin/xargs.gnu
    register_alternative /usr/bin/find find.gnu 100
    register_alternative /usr/bin/xargs xargs.gnu 100
    copy_from_spec etc/cron.daily
}
