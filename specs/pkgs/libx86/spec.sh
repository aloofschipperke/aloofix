# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=libx86
version=1.1
sequence=1
patchlist=if_mask

description="x86 real-mode library"
site=http://www.codon.org.uk/~mjg59/$name/downloads
depends=
builddepends=
section=devel

license=MIT
license_files=COPYRIGHT

configure() { true; }

install_target=install
