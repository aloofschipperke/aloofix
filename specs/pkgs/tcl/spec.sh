# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=tcl
version=8.6.0
sequence=1
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

configure() {
    cd $src/$build_subdir && \
	./configure $configure_args \
	--enable-man-suffix=tcl
}