# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=nasm
version=2.10.07
sequence=1
site=http://www.nasm.us/pub/$name/releasebuilds/$version
description="Netwide Assembler"
section=devel
compression_suffix=bz2

license=BSD-2-Clause
license_files=LICENSE

make_j_qty=1

extra_doc_files="AUTHORS CHANGES README TODO"

make_targets="all strip"
install_options="INSTALLROOT=$preinstalltree/$name/${name}-$version"
install_target=install
