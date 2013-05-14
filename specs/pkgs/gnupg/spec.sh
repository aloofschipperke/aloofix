# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=gnupg
version=2.0.20
sequence=1
site=ftp://ftp.gnupg.org/gcrypt/$name
description="GNU Privacy Guard 2"
depends="zlib-lib libgpg-error-lib libgcrypt-lib pth-lib libksba-lib libassuan-lib pinentry"
builddepends="zlib-dev pth-dev libgpg-error-dev libgcrypt-dev libassuan-dev libksba-dev"
section=security
compression_suffix=bz2

license="GPLv3 LGPLv3"
license_files="COPYING*"

extra_doc_files="AUTHORS ChangeLog* NEWS README THANKS TODO
		 doc/FAQ doc/KEYSERVER doc/DETAILS doc/OpenPGP"

extra_configure_args="--disable-selinux-support
                      --disable-nls
                      --without-libiconv-prefix
                      --without-libintl-prefix
                      --with-zlib"

preinstall_hook() {
    rm -f "$preinstalldir"/usr/share/gnupg/help.??*.txt
}

pkg_base_hook() {
    copy_from_spec etc/profile.d
}
