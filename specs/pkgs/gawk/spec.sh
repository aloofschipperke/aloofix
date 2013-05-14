# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=gawk
version=4.1.0
sequence=1
site=http://ftp.gnu.org/gnu/$name
description="GNU Awk language"
section=devel
compression_suffix=xz

license=GPLv3+
license_files="COPYING"

extra_doc_files="AUTHORS ChangeLog* NEWS* POSIX.STD README"

extra_configure_args="--disable-libsigsegv
	--disable-nls
	--without-libiconv-prefix
	--without-libintl-prefix
	--with-mpfr"

pkg_base_hook() {
    rm "$pkgcontentdir/usr/bin/awk"
    register_alternative /usr/bin/awk gawk 100
}
