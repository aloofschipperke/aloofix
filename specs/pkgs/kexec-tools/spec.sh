# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=kexec-tools
version=2.0.4
sequence=2
site=ftp://ftp.kernel.org/pub/linux/utils/kernel/kexec
description="Utility for using the kexec kernel mechanism"
depends=zlib-lib
builddepends="zlib-dev"
section=admin
compression_suffix=xz

license=GPLv2
license_files=COPYING

extra_doc_files="AUTHORS COPYING News TODO doc/*.txt doc/*.html"

extra_configure_args="--exec-prefix=/"

install_target=install

preinstall_hook() {
    install -d -m 0755 "$preinstalldir/usr/share/man/man8"
    install -m 0644 "$src"/*/*.8 \
        "$preinstalldir/usr/share/man/man8"
}

pkg_base_hook() {
    copy_from_spec sbin
}
