# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=gcc
version=4.8.0
sequence=1
site=http://ftp.gnu.org/gnu/$name/${name}-$version
description="GNU C Compiler"
depends="gcc-gcclib binutils glibc-dev gmp-lib mpfr-lib libmpc-lib"
builddepends="gmp-dev mpfr-dev libmpc-dev"
section=devel
compression_suffix=bz2

license="GPLv3Exception"
license_files="COPYING* */COPYING* */*/COPYING*
	       */LICENSE* */*/LICENSE* */*/*/LICENSE*"

extra_doc_files="ChangeLog* MAINTAINERS NEWS README"

default_dev_pkg_files=none

use_build_dir=y

configure_args=$(echo "$configure_args" | sed -e 's/--disable-dependency-tracking//')
extra_configure_args="--target=${arch}-linux
                        --disable-nls
                        --without-libiconv-prefix
                        --without-x
                        --disable-libstdcxx-pch
                        --enable-_cxa_atexit
                        --enable-clocale=gnu
                        --disable-bootstrap
                        --without-ppl
                        --without-cloog
		        --disable-install-libiberty
                        --enable-languages=c,c++"

configure_hook() {
    sed -i -e 's@\./fixinc\.sh@-c true@' "$src/gcc/Makefile.in"
}

build() {
    make -j $make_j_qty \
        CFLAGS="$cflags" \
        LIBCFLAGS="$cflags" \
        MAKEINFO=missing \
        BOOT_CFLAGS="$cflags"
}

preinstall_hook() {
    install -d -m 755 "$preinstalldir/usr/share/gdb/auto-load"
    mv "$preinstalldir"/usr/lib/*-gdb.py \
        "$preinstalldir/usr/share/gdb/auto-load"
    rm -f "$preinstalldir/usr/lib/libiberty.a"
}

pkg_base_hook() {
    for F in cpp gcc g++
    do
        ln "$pkgcontentdir/usr/bin/${arch}-linux-$F" \
            "$pkgcontentdir/usr/bin/$F" || exit 1
    done
    ln "$pkgcontentdir/usr/bin/i686-linux-gcov" "$pkgcontentdir/usr/bin/gcov"
    ln -s gcc "$pkgcontentdir/usr/bin/cc"
    ln -s g++ "$pkgcontentdir/usr/bin/c++"
    install -d -m 755 "$pkgcontentdir/lib"
    ln -s ../usr/bin/cpp "$pkgcontentdir/lib/cpp"
}

extra_pkgs=gcclib

gcclib_pkg_files=usr/lib/libgcc_s.*
base_pkg_excludes="$gcclib_pkg_files"

lib_pkg_excludes="$gcclib_pkg_files"

gcclib_section=libraries
gcclib_description="GNU C Compiler Runtime libraries"
