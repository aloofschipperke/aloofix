# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=dropbear
version=2013.58
sequence=1
patchlist="crypt-failure"

site=http://matt.ucc.asn.au/$name/releases
description="Dropbear ssh package"
depends="zlib-lib"
builddepends="zlib-dev"
section=core
priority=standard
provides=ssh
compression_suffix=bz2

license="MIT PD"
license_files="LICENSE */LICENSE"

extra_doc_files="CHANGES MULTI README TODO"

dropbear_programs="dropbear dbclient dropbearkey dropbearconvert scp"

extra_configure_args="
	--disable-lastlog
	--without-pam"

configure_hook() {
    sed -i -e 's/.*\(#define DROPBEAR_BLOWFISH\).*/\1/' options.h
    sed -i -e 's/.*\(#define DROPBEAR_SHA2_256_HMAC\).*/\1/' options.h
    sed -i -e 's/.*\(#define DROPBEAR_SHA2_512_HMAC\).*/\1/' options.h
    sed -i -e 's@.*\(#define DO_HOST_LOOKUP\).*@/*\1*/@' options.h
}

build() {
    make -j $make_j_qty \
	PROGRAMS="$dropbear_programs" \
	MULTI=1 SCPPROGRESS=1 \
	clean strip
}

preinstall() {
    make DESTDIR="$preinstalldir" \
	PROGRAMS="$dropbear_programs" \
	MULTI=1 \
	install
    for F in $dropbear_programs
    do
	ln -s dropbearmulti $preinstalldir/usr/bin/$F
    done
    install -d -m 0755 $preinstalldir/usr/share/man/man1
    install -d -m 0755 $preinstalldir/usr/share/man/man8
    install -m 0644 $src/*.1 $preinstalldir/usr/share/man/man1
    install -m 0644 $src/*.8 $preinstalldir/usr/share/man/man8
}

pkg_base_hook() {
    copy_from_spec etc
    ensure_dir "$pkgcontentdir/root/.ssh"
    ensure_dir "$pkgcontentdir/etc/dropbear"
    register_alternative /usr/bin/ssh dbclient 100
    register_alternative /usr/bin/scp dropbearmulti 100
}
