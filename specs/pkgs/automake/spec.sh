# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=automake
version=1.13.3
sequence=1
site=http://ftp.gnu.org/gnu/$name
description="A tool for automatically creating Makefiles"
depends="perl bash"
builddepends="perl autoconf"
section=devel
install_target=install
compression_suffix=xz

license=GPLv2+
license_files="COPYING lib/COPYING"

extra_doc_files="AUTHORS ChangeLog HACKING NEWS README THANKS"
