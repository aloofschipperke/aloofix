# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=tzdata
version=2013c
sequence=1
site=http://www.iana.org/time-zones/repository/releases
tarfile=${name}${version}.tar.gz
section=admin
description="Timezone utilities and data files"
depends=tzdata-min

tzcode_version=2013c
tzcode_tarfile=tzcode${tzcode_version}.tar.gz

urls="$site/$tarfile $site/$tzcode_tarfile"

license=PD
# No specific license file - files individually state they are in the
# public domain, so we just copy README into the license directory.
license_files=README

extra_doc_files="README Theory"

extra_pkgs="min"

make_targets="AWK=gawk
	TOPDIR=/usr
	TZDIR=/usr/share/zoneinfo
	ETCDIR=/usr/sbin
	MANDIR=/usr/share/man"

unpack() {
    # tzdata doesn't include the subdir in the tar files,
    # so we need to make sure it's deposited in the tzdata src dir
    tar -x -C $src -f $tarballdir/$1/$tarfile
    tar -x -C $src -f $tarballdir/$1/$tzcode_tarfile
}

configure() { true; }

preinstall() {
    make CFLAGS="$cflags" \
    	 AWK=gawk LOCALTIME=$timezone \
    	 TOPDIR=$preinstalldir/usr \
	 TZDIR=$preinstalldir/usr/share/zoneinfo \
	 ETCDIR=$preinstalldir/usr/sbin \
	 MANDIR=$preinstalldir/usr/share/man \
	 install
    strip $preinstalldir/usr/sbin/z*
}

extra_pkgs=min

min_pkg_files="usr/share/zoneinfo/Factory usr/share/zoneinfo/$timezone"
base_pkg_excludes="$min_pkg_files"

min_priority=required
min_section=base
min_description="Minimal timezone data"

pkg_min_hook() {
    ensure_dir "$pkgcontentdir/etc"
    ln -s ../usr/share/zoneinfo/$timezone "$pkgcontentdir/etc/localtime"
}
