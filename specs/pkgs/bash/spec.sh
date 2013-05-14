# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=bash
majversion=4
minversion=2
baseversion=${majversion}.${minversion}
patchlevel=045
version=${baseversion}.${patchlevel}
sequence=1
patchlist="$(seq -w 001 $patchlevel)"
site=http://ftp.gnu.org/gnu/$name
description="Bourne Again SHell"
depends="ncurses-lib"
builddepends="bison ncurses-dev"
section=devel
src=${name}-${baseversion}

license=GPLv3+
license_files="COPYING lib/readline/COPYING"

extra_doc_files="AUTHORS CHANGES COMPAT MANIFEST* NEWS NOTES
		 POSIX RBASH README Y2K"

base_pkg_files=bin/bash

tarfile=${name}-${baseversion}.tar.gz
urls="$site/$tarfile"
for N in $patchlist
do
    patchname="${name}${majversion}${minversion}-$N"
    urls="$urls $site/${name}-${baseversion}-patches/$patchname"
done

extra_configure_args="--exec-prefix=/ \
	--disable-profiling \
	--disable-nls \
	--without-bash-malloc \
	--with-curses \
	--without-libiconv-prefix \
	--without-libintl-prefix"

apply_patches() {
    for N in $patchlist
    do
	patch -p0 -d "$src" \
	    -i "$tarballdir/$1/${name}${majversion}${minversion}-$N"
    done
}

pkg_base_hook() {
    register_alternative /bin/sh bash 100
    register_postinst "add-shell /bin/bash"
    register_prerm "remove-shell /bin/bash"
}
