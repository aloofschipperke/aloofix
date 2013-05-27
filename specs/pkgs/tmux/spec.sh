# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=tmux
version=1.8
sequence=2
description="A terminal multiplexer"
site=http://downloads.sourceforge.net/$name
depends="ncurses libevent-lib"
builddepends="libevent-dev ncurses-dev"
section=misc

license=ISC
license_files=README

extra_doc_files="CHANGES FAQ README TODO examples/*"

extra_configure_args="LIBS=-ltinfo"

base_pkg_excludes=usr/share
