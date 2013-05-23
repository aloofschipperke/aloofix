# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=sqlite
version=3071700
sequence=1
description="Sqlite Database"

site=http://www.sqlite.org/2013
tarfile="${name}-autoconf-${version}.tar.gz"
urls="$site/$tarfile http://sqlite.org/copyright.html"
src="${name}-autoconf-${version}"

depends=
section=databases

license=PD
license_files="$tarballdir/$name/copyright.html"

extra_configure_args="--disable-readline"
