# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=m4
version=1.4.16
sequence=1
site=http://ftp.gnu.org/pub/gnu/$name
description="GNU M4 Macroprocessor"
section=devel
compression_suffix=xz

license=GPLv3+
license_files=COPYING

extra_doc_files="AUTHORS BACKLOG ChangeLog NEWS README THANKS TODO"

configure_hook() {
    sed -i -e '/gets is a/d' $src/lib/stdio.in.h
}

make_options="V=1"
install_options="V=1"
