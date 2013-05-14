# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=libgcrypt
version=1.5.2
sequence=1
site=ftp://ftp.gnupg.org/gcrypt/$name
description="The GNU crypto library"
depends="libgpg-error-lib"
builddepends="libgpg-error-dev"
section=security
compression_suffix=bz2

license="GPLv2+ LGPLv2.1+"
license_files="COPYING*"

extra_doc_files=" AUTHORS ChangeLog NEWS README THANKS TODO"

extra_configure_args="--enable-random=auto"
