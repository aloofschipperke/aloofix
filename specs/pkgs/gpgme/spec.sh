# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=gpgme
version=1.4.1
sequence=1
site=ftp://ftp.gnupg.org/gcrypt/$name
description="GnuPG Made Easy"
depends="gnupg libgpg-error-lib pth-lib"
builddepends="libgpg-error-dev libassuan-dev"
section=security
compression_suffix=bz2

license="GPLv2+ LGPLv2.1+"
license_files="COPYING*"

extra_doc_files="AUTHORS ChangeLog NEWS README THANKS TODO"

base_pkg_excludes="usr/share usr/libexec usr/bin"
