# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=libgpg-error
version=1.11
sequence=1
site=ftp://ftp.gnupg.org/gcrypt/$name
description="Common error values for GnuPG components"
depends=
section=security
compression_suffix=bz2

license="GPLv2+ LGPLv2+"
license_files="COPYING*"

extra_doc_files="AUTHORS ChangeLog INSTALL NEWS README THANKS"

extra_dev_pkg_files=usr/bin/gpg-error-config
base_pkg_excludes="$extra_dev_pkg_files"

extra_configure_args="--disable-nls
		      --without-libiconv-prefix
                      --without-libintl-prefix"
