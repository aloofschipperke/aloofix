# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=patch
version=2.7.1
sequence=1
description="Apply diff files"
section=devel
site=http://ftp.gnu.org/gnu/$name
compression_suffix=xz

license=GPLv3+
license_files="COPYING"

extra_doc_files="AUTHORS ChangeLog* NEWS README TODO"

extra_configure_args="--disable-xattr"
