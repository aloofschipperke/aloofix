# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

include aloofix-installer

appid="Aloofix Buildstrap CD"

default_pkgsets="toolchain"

add_pkgset toolchain \
    user-license user-build user-web \
    make-license make \
    patch-license patch \
    binutils-license binutils-lib binutils \
    glibc-license glibc-dev \
    linux-license linux-dev \
    gcc-license gcc-gcclib gcc-lib gcc \
    gmp-license gmp-lib \
    mpfr-license mpfr-lib \
    libmpc-license libmpc-lib \
    tar-license tar \
    fakeroot-license fakeroot \
    aloofix-src-license aloofix-src

###############################################################################
