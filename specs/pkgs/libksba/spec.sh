# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=libksba
version=1.3.0
sequence=1
site=ftp://ftp.gnupg.org/gcrypt/$name
description="X.509 certificate library"
depends="libgpg-error-lib"
builddepends="libgpg-error-dev"
section=security
compression_suffix=bz2

license="GPLv3+ LGPLv3+ GPLv2+"
license_files="COPYING*"

extra_doc_files="AUTHORS ChangeLog NEWS README THANKS TODO"

extra_dev_pkg_files=usr/bin/ksba-config

