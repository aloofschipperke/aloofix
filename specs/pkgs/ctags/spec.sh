# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=ctags
version=5.8
sequence=1
site=http://prdownloads.sourceforge.net/$name
description="Exuberant Ctags"
depends=
builddepends=
section=devel

license=GPLv2
license_files=COPYING

extra_doc_files="EXTENDING.html FAQ NEWS README ctags.html"

extra_configure_args=--enable-etags

preinstall() {
    make \
        prefix="$preinstalldir/usr" \
        mandir="$preinstalldir/usr/share/man" \
        install
    mv "$preinstalldir/usr/share/man/man1/ctags.1" \
        "$preinstalldir//usr/share/man/man1/ctags.exuberant.1"
    # for some reason, man-db fails unless this is compressed
    gzip -9 "$preinstalldir//usr/share/man/man1/ctags.exuberant.1"
    rm "$preinstalldir/usr/share/man/man1/etags.1"
    ln -s ctags.exuberant.1.gz \
        "$preinstalldir/usr/share/man/man1/etags.exuberant.1.gz"
}

pkg_base_hook() {
    rm "$pkgcontentdir/usr/bin/etags"
    pkg_file_mv /usr/bin/ctags /usr/bin/ctags.exuberant
    register_alternative /usr/bin/ctags ctags.exuberant 100
    register_alternative /usr/bin/etags ctags.exuberant 100
}
