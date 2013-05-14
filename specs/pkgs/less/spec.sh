# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=less
version=451
sequence=1
site=http://www.greenwoodsoftware.com/$name
description="Opposite of more"
depends=ncurses
builddepends="ncurses ncurses-dev"
section=misc
license="GPLv3+ or BSD-2-Clause"

license_files="COPYING LICENSE"
extra_doc_files="NEWS README"

pkg_base_hook() {
    pkg_file_mv /usr/bin/less /usr/bin/less.gnu
    register_alternative /usr/bin/less less.gnu 100
}
