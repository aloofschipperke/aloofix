# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=glib
majversion=2.37
minversion=0
version=${majversion}.${minversion}
sequence=1
site=http://ftp.gnome.org/pub/gnome/sources/$name/$majversion
description="A low-level core library for GTK+ and others"
depends="zlib-lib libffi-lib pcre-lib"
builddepends="zlib-dev pkg-config libffi-dev pcre-dev gettext python2 python2-dev automake"
section=libraries
compression_suffix=xz

license="LGPLv2"
license_files="COPYING */COPYING */*/COPYING"

extra_configure_args="MISC_STUFF=
		      --with-libiconv=no
		      --with-html-dir=/usr/share/doc/$name/html"

extra_doc_files="AUTHORS HACKING NEWS* README"
