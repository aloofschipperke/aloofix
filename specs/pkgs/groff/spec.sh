# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=groff
version=1.22.2
sequence=1
site=http://ftp.gnu.org/gnu/$name
description="The groff document formatting system"
depends="gcc-lib perl groff-min"
builddepends="bash"
section=doctools

license=GPLv3+
doc_license=FDLv1.3+
license_files="COPYING LICENSES FDL"

extra_doc_files="BUG-REPORT NEWS PROBLEMS README TODO"

extra_configure_args=--without-x
install_target=install

extra_pkgs="min"

min_description="Subset of groff for manpage creation"
min_depends=gcc-lib

min_pkg_files="usr/bin/eqn
usr/bin/groff
usr/bin/grops
usr/bin/grotty
usr/bin/neqn
usr/bin/nroff
usr/bin/pic
usr/bin/preconv
usr/bin/soelim
usr/bin/tbl
usr/bin/gtbl
usr/bin/troff
usr/share/groff/${version}/eign
usr/share/groff/${version}/font/devascii
usr/share/groff/${version}/font/devlatin1
usr/share/groff/${version}/font/devps
usr/share/groff/${version}/font/devutf8
usr/share/groff/${version}/tmac/an-ext.tmac
usr/share/groff/${version}/tmac/an-old.tmac
usr/share/groff/${version}/tmac/an.tmac
usr/share/groff/${version}/tmac/andoc.tmac
usr/share/groff/${version}/tmac/composite.tmac
usr/share/groff/${version}/tmac/cp1047.tmac
usr/share/groff/${version}/tmac/cs.tmac
usr/share/groff/${version}/tmac/de.tmac
usr/share/groff/${version}/tmac/den.tmac
usr/share/groff/${version}/tmac/devtag.tmac
usr/share/groff/${version}/tmac/doc-old.tmac
usr/share/groff/${version}/tmac/doc.tmac
usr/share/groff/${version}/tmac/e.tmac
usr/share/groff/${version}/tmac/eqnrc
usr/share/groff/${version}/tmac/europs.tmac
usr/share/groff/${version}/tmac/fallbacks.tmac
usr/share/groff/${version}/tmac/fr.tmac
usr/share/groff/${version}/tmac/hyphen.cs
usr/share/groff/${version}/tmac/hyphen.den
usr/share/groff/${version}/tmac/hyphen.det
usr/share/groff/${version}/tmac/hyphen.fr
usr/share/groff/${version}/tmac/hyphen.sv
usr/share/groff/${version}/tmac/hyphen.us
usr/share/groff/${version}/tmac/hyphenex.cs
usr/share/groff/${version}/tmac/hyphenex.det
usr/share/groff/${version}/tmac/hyphenex.us
usr/share/groff/${version}/tmac/latin1.tmac
usr/share/groff/${version}/tmac/latin2.tmac
usr/share/groff/${version}/tmac/latin5.tmac
usr/share/groff/${version}/tmac/latin9.tmac
usr/share/groff/${version}/tmac/man.tmac
usr/share/groff/${version}/tmac/mandoc.tmac
usr/share/groff/${version}/tmac/mdoc
usr/share/groff/${version}/tmac/mdoc.tmac
usr/share/groff/${version}/tmac/papersize.tmac
usr/share/groff/${version}/tmac/pic.tmac
usr/share/groff/${version}/tmac/ps.tmac
usr/share/groff/${version}/tmac/psatk.tmac
usr/share/groff/${version}/tmac/psold.tmac
usr/share/groff/${version}/tmac/pspic.tmac
usr/share/groff/${version}/tmac/safer.tmac
usr/share/groff/${version}/tmac/sv.tmac
usr/share/groff/${version}/tmac/trans.tmac
usr/share/groff/${version}/tmac/troffrc
usr/share/groff/${version}/tmac/troffrc-end
usr/share/groff/${version}/tmac/tty-char.tmac
usr/share/groff/${version}/tmac/tty.tmac
usr/share/groff/${version}/tmac/unicode.tmac
usr/share/groff/${version}/tmac/www.tmac
usr/share/groff/current
usr/share/groff/site-tmac"

base_pkg_excludes="$min_pkg_files"

preinstall_hook() {
    # busybox man command actually works, but it expects gtbl instead of tbl
    ln -s tbl "$preinstalldir/usr/bin/gtbl"
    strip "$preinstalldir"/usr/bin/* || return 0
}
