# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=cscope
version=15.8a
sequence=2
description="Text screen based source browsing tool"
site=http://downloads.sourceforge.net/$name
depends="ncurses"
builddepends="ncurses-dev"
section=devel

license=BSD-3-Clause
license_files=COPYING

extra_doc_files="AUTHORS ChangeLog NEWS README TODO"

extra_configure_args=LIBS=-ltinfo
