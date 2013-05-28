# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=perl
version=5.18.0
sequence=1
site=http://www.cpan.org/src/5.0
description="Perl - the duct tape of the Internet"
section=devel

license="(GPL or PerlArtistic) custom"
license_files="Artistic Copying */*/LICENSE */*/*/LICENSE"

extra_doc_files="AUTHORS Changes README README.linux"

configure() {
    rm config.sh
    CFLAGS="$cflags" ./configure.gnu --prefix=/usr
}

preinstall() {
    make DESTDIR="$preinstalldir" \
        STRIPFLAGS=-s \
        install.perl
    ./perl installman \
	--destdir="$preinstalldir" \
        --man1dir="$preinstalldir/usr/share/man/man1" \
        --man1ext=1 \
        --man3dir="$preinstalldir/usr/share/man/man3" \
        --man3ext=3pm
    # The pod data for the following files aren't canonical, so they
    # end up as bogus manpages.
    for F in \
	CPAN::Debug CPAN::HandleConfig CPAN::Tarzip CPAN::Queue \
	TAP::Harness::Beyond
    do
	rm -f "$preinstalldir/usr/share/man/man3/${F}.3pm"
    done
}
