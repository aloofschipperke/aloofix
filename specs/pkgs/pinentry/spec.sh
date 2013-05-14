# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=pinentry
version=0.8.2
sequence=1
site=ftp://ftp.gnupg.org/gcrypt/$name
description="PIN and passphrase entry dialogs"
depends="ncurses libcap-lib"
builddepends="ncurses-dev libcap-dev"
section=security
compression_suffix=bz2

license=GPLv2+
license_files="COPYING"

extra_doc_files="AUTHORS ChangeLog NEWS README THANKS TODO"

extra_configure_args="--enable-pinentry-curses
                      --disable-pinentry-gtk
                      --disable-pinentry-gtk2
                      --disable-pinentry-qt
                      --disable-pinentry-qt4"
