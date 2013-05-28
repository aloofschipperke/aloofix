# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=pcre
version=8.33
sequence=1
description="Perl-compatible regular expression library"
site=ftp://ftp.csx.cam.ac.uk/pub/software/programming/$name
section=libraries
compression_suffix=bz2

license="BSD-3-Clause custom"
license_files="COPYING cmake/COPYING_CMAKE_SCRIPTS LICENCE"

extra_doc_files="AUTHORS ChangeLog HACKING NEWS README"

configure_args="--prefix=/usr --disable-static --disable-cpp"
extra_dev_pkg_files="usr/bin/pcre-config"
