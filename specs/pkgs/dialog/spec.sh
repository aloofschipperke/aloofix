# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=dialog
version=1.2-20121230
sequence=1
site=ftp://invisible-island.net/$name
tarfile=${name}-${version}.tgz
description="Display dialog boxes in scripts"
depends=ncurses
builddepends="ncurses-dev"
section=misc

license="LGPLv2.1+"
license_files=COPYING

extra_doc_files="CHANGES README"

extra_configure_args="--with-ncurses --disable-nls"

install_target="install-lib install-strip install-man"
