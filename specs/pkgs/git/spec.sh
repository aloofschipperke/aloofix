# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=git
version=1.8.2.3
sequence=1
site=http://git-core.googlecode.com/files
description="The stupid content tracker"
depends="zlib-lib expat-lib perl curl-lib python2 man-db"
builddepends="gettext zlib-dev expat-dev curl-dev perl python2 python2-dev"
section=devel

tarfile="${name}-${version}.tar.gz"
mantarfile="${name}-manpages-${version}.tar.gz"

urls="$site/$tarfile $site/$mantarfile"

license="GPLv2 Apache-2.0 custom"
license_files="COPYING LGPL-2.1 vcs-svn/LICENSE
	       contrib/subtree/COPYING contrib/persistent-https/LICENSE
	       compat/nedmalloc/License.txt"

extra_doc_files="README"

base_pkg_excludes=usr/share/locale

extra_configure_args="--without-iconv
                      --without-tcltk"

make_options="PYTHON_PATH=/usr/bin/python2
	      NO_CROSS_DIRECTORY_HARDLINKS=1
	      V=1
"
make_targets="all strip"

install_options="V=1"

install_target="install"

preinstall_hook() {
    # thankfully the git team provides a tarball of the manpages -
    # avoid the need for asciidoc
    install -d -m 755 "$preinstalldir/usr/share/man"
    tar -x -C "$preinstalldir/usr/share/man" -f "$tarballdir/$pkg/$mantarfile"
}
