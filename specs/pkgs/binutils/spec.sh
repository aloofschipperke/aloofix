# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=binutils
version=2.23.2
sequence=1
site=http://ftp.gnu.org/gnu/$name
description="GNU Binutils"
depends="zlib-lib"
section=devel
compression_suffix=bz2

license="GPLv2+ GPLv3+ LGPLv2.1+ LGPLv3+"
license_files="COPYING* */COPYING*"

extra_doc_files="ChangeLog MAINTAINERS README*"

extra_configure_args="--target=${arch}-linux
	--disable-libada --disable-nls --disable-multilib"

configure_hook() {
    make configure-host
}

preinstall_hook() {
    rm -f "$preinstalldir"/usr/share/info/standards.info
}

pkg_base_hook() {
    for F in ar as c++filt gprof ld nm objcopy objdump ranlib \
	readelf size strings strip;
    do
        ln "$pkgcontentdir/usr/bin/${arch}-linux-$F" \
            "$pkgcontentdir/usr/bin/$F"
    done
}
