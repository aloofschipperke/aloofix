# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=libcap
version=2.22
sequence=1
site=http://ftp.de.debian.org/debian/pool/main/libc/libcap2
tarfile=${name}2_${version}.orig.tar.gz
description="POSIX 1003.1e capability support library"
depends="attr-lib"
builddepends="attr-dev perl"
section=security

license="GPLv2 BSD-3-Clause"
license_files="License */License"

extra_doc_files="CHANGELOG README"

extra_pkgs=utils

base_pkg_files=usr/lib
utils_pkg_files=usr/sbin
base_pkg_excludes="usr/lib/security $utils_pkg_files"

utils_description="Command-line utilities for libcap"

configure() { true; }

make_options="prefix=/usr"
install_options="prefix=/usr RAISE_SETFCAP=no"
install_target=install

###############################################################################
