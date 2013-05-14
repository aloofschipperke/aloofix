# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=bc
version=1.06
sequence=1
patchlist=remove-readline-decl

description="Arbitrary precision calculator language"
site=http://ftp.gnu.org/pub/gnu/$name
depends="ncurses readline-lib"
builddepends="ncurses-dev readline-dev flex"
section=misc

license="GPLv2+ LGPLv2.1+"
license_files="COPYING COPYING.LIB"

extra_doc_files="AUTHORS FAQ NEWS README"

configure_args=$(echo "$configure_args" | sed -e 's@--datarootdir=[^ ]\+@@')
extra_configure_args="--with-readline"

configure() {
    export CFLAGS="$cflags"
    ./configure $configure_args $extra_configure_args || return 1
}

build() {
    make -j $make_j_qty LEX="flex -I" || return 1
}

pkg_base_hook() {
    pkg_file_mv /usr/bin/dc /usr/bin/dc.gnu
    register_alternative /usr/bin/dc dc.gnu 100
}
