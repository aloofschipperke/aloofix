# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=tcl
version=8.6.0
sequence=2
description="Tcl scripting language"
compression_suffix=gz
src=${name}${version}
tarfile=${src}-src.tar.$compression_suffix
site=http://prdownloads.sourceforge.net/$name
depends=zlib-lib
builddepends=zlib-dev
section=devel

license=Tcl
license_files=license.terms

extra_doc_files="ChangeLog* README changes"

build_subdir=unix

configure_args=$(echo "$configure_args" | sed -e 's@--datarootdir=[^ ]\+@@')

extra_lib_pkg_files="usr/lib/*/lib*.so"
extra_dev_pkg_files="usr/lib/*/lib*.a"

configure() {
    cd $src/$build_subdir && \
	./configure $configure_args \
	--without-tzdata \
	--enable-man-suffix=tcl
    # 8.6.0 has a problem with regexes in dejagnu
    sed -i 's/^#define DUPTRAVERSE_MAX_DEPTH 500/#define DUPTRAVERSE_MAX_DEPTH 5000/' \
	../generic/regc_nfa.c
}
