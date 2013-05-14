# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=texinfo
version=5.1
sequence=1
site=http://ftp.gnu.org/gnu/$name
description="A documentation system"
depends="texinfo-min texinfo-dev"
builddepends="perl"
section=doctools
compression_suffix=xz

license=GPLv3+
license_files=COPYING

extra_doc_files="AUTHORS NEWS README* ChangeLog* TODO"

extra_configure_args=--disable-nls

extra_pkgs="min"

min_pkg_files="usr/bin/info
	       usr/bin/infokey
	       usr/bin/install-info"
extra_dev_pkg_files="usr/bin/makeinfo
		     usr/bin/texindex"

base_pkg_excludes="$min_pkg_files"

dev_depends="perl"

min_depends="ncurses"
min_description="Subset of texinfo for reading info files"

pkg_min_hook() {
    register_postinst initialize_texinfo
}
