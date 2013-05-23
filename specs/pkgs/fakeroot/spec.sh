# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=fakeroot
version=1.19
sequence=1
site=http://ftp.debian.org/debian/pool/main/f/$name
compression_suffix=bz2
tarfile=${name}_${version}.orig.tar.$compression_suffix
description="Fake root environment"
depends=
section=devel

license=GPLv3+
license_files="COPYING"

extra_doc_files="AUTHORS BUGS DEBUG README doc/README.saving"

default_lib_pkg_files=' '
extra_configure_args=--libdir=/usr/lib/libfakeroot

preinstall_hook() {
        # patch fakeroot so busybox getopt is quiet
    sed -i -e \
        's@^GETOPTEST=.*@GETOPTEST=`getopt --version 2>/dev/null`@' \
        "$preinstalldir/usr/bin/fakeroot"
    rm -rf "$preinstalldir"/usr/share/man/??
    sed -i -e '1s@#!/bin/bash@#!/bin/sh@' "$preinstalldir/usr/bin/fakeroot"
}
