# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=gdbm
version=1.10
sequence=1
site=http://mirrors.kernel.org/gnu/$name
description="GNU DBM library"
section=databases

license=GPLv3+
license_files=COPYING

extra_doc_files="ChangeLog NEWS NOTE-WARNING README THANKS"

extra_configure_args="--disable-nls
	--without-libiconv-prefix --without-libintl-prefix"

install_options="BINOWN=$(id -u) BINGRP=$(id -g)"
install_target=install

