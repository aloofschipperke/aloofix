# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=readline
majversion=6
minversion=2
patchlevel=004
patchlist="$(seq -w 001 $patchlevel)"

baseversion="${majversion}.${minversion}"
version=${baseversion}.$patchlevel
sequence=1
description="Library for allowing users to edit command lines"
tarfile="${name}-${majversion}.${minversion}.tar.gz"
src=${name}-${baseversion}
site=ftp://ftp.cwru.edu/pub/bash
lib_depends="ncurses"
builddepends="ncurses-dev"
section=devel

urls="$site/$tarfile"
for N in $patchlist
do
    patchname="${name}${majversion}${minversion}-$N"
    urls="$urls $site/${name}-${baseversion}-patches/$patchname"
done

license=GPLv3+
license_files=COPYING

extra_doc_files="CHANGELOG CHANGES NEWS README USAGE"

apply_patches() {
    for N in $patchlist
    do
	patch -p0 -d "$src" \
	    -i "$tarballdir/$1/${name}${majversion}${minversion}-$N"
    done
}

install_target=install
