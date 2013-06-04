# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=vim
majversion=7
minversion=3
patchlevel=1109
baseversion=${majversion}.$minversion
version=${baseversion}.$patchlevel
sequence=1

site=http://ftp.vim.org/pub/$name/unix
src=${name}${majversion}${minversion}
patchsite=http://ftp.vim.org/pub/vim/patches/$baseversion
description="Vi IMproved"
depends=vim-min
builddepends="ncurses-dev"
section=editors
compression_suffix=bz2

# patch 780 is busted
patchlist="$(seq -w 001 999 | grep -v 780) $(seq -w 1000 $patchlevel)"

license="Vim Openpub"
license_files=runtime/doc/uganda.txt

doc_pkg_files="$doc_pkg_files
	       usr/share/vim/vim${majversion}${minversion}/doc
	       usr/share/vim/vim${majversion}${minversion}/tutor"
extra_doc_files="README*"

tarfile="${name}-${baseversion}.tar.$compression_suffix"
urls="$site/$tarfile"

for N in $patchlist
do
    urls="$urls $patchsite/${baseversion}.$N"
done

apply_patches() {
    for N in $patchlist
    do
	patch -p0 -N -d "$src" -i "$tarballdir/$1/${baseversion}.$N" \
	    || return 1
    done
}

extra_configure_args="--localstatedir=/var/lib/vim
                      --disable-nls
                      --without-x
                      --disable-gpm
                      --disable-selinux
		      --enable-cscope"

extra_pkgs="min"

min_pkg_files="usr/bin/vim usr/bin/rvim
	       usr/bin/view usr/bin/rview
	       usr/bin/ex usr/bin/vimdiff"

base_pkg_excludes="$min_pkg_files"

min_description="Subset of vim"
min_depends="ncurses"

install_target=install

pkg_min_hook() {
    register_alternative /bin/vi ../usr/bin/vim 100
}
