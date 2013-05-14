# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=pkg-config
version=0.28
sequence=1
site=http://pkgconfig.freedesktop.org/releases
description="A script for managing compiling and linking flags"
section=devel

license=GPLv2+
license_files="COPYING glib/COPYING"

extra_doc_files="AUTHORS NEWS README"

extra_configure_args=--with-internal-glib
