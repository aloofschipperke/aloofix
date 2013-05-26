# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=expect
version=5.45
sequence=2
description="A tools for automating interactive applications"
compression_suffix=gz
src=${name}${version}
tarfile=${src}.tar.$compression_suffix
site=http://downloads.sourceforge.net/project/$name/Expect/$version
depends=tcl
builddepends="tcl tcl-dev"
section=admin

license=PD
license_files=license.terms

extra_doc_files="FAQ HISTORY NEWS README ChangeLog"

configure_args=$(echo "$configure_args" | sed -e 's@--datarootdir=[^ ]\+@@')

extra_lib_pkg_files="usr/lib/*/lib*.so"

install_target=install

preinstall_hook() {
	rm -f "$preinstalldir/usr/bin/mkpasswd"
}
