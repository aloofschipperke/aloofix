# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=attr
version=2.4.46
sequence=1
site=http://download.savannah.gnu.org/releases/$name
description="Extended attribute support library for ACLs"
section=devel

license="LGPLv2.1+ GPLv2+"
license_files="doc/COPYING"

extra_doc_files="doc/CHANGES"

tarfile="${name}-${version}.src.tar.gz"
install_target=install

extra_configure_args="--libexecdir=/usr/lib --enable-gettext=no"
make_options="LINGUAS="

preinstall() {
    make DIST_ROOT="$preinstalldir" install install-lib install-dev
    rm -rf "$preinstalldir/usr/share/man/man2"
}
