# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=libassuan
version=2.1.0
sequence=1
site=ftp://ftp.gnupg.org/gcrypt/$name
description="IPC library for GnuPG 2"
depends="libgpg-error-lib"
builddepends="libgpg-error-dev"
section=security
compression_suffix=bz2

license="GPLv3+ LGPLv2.1+"
license_files="COPYING*"

extra_doc_files="AUTHORS ChangeLog* NEWS README THANKS TODO"
