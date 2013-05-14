# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=man-pages
version=3.51
sequence=1
arch=noarch
site=ftp://ftp.kernel.org/pub/linux/docs/$name
description="Base Linux man pages"
section=documentation
compression_suffix=xz

license=Man-pages
license_files=README

extra_doc_files="README Changes*"

configure() { true; }
build() { true; }

install_target=install

doc_pkg_excludes="usr/share/man/man1/time.1
		  usr/share/man/man5/tzfile.5
		  usr/share/man/man8/tzselect.8
		  usr/share/man/man8/zdump.8
		  usr/share/man/man8/zic.8"
