# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=glibc
version=2.17
sequence=1
site=http://ftp.gnu.org/gnu/$name
description="GNU Libc library"
depends="base tzdata-min glibc-min"
builddepends="bash gawk"
section=core
priority=standard
compression_suffix=xz

license="GPLv2 LGPLv2.1 custom"
license_files="COPYING* LICENSES"

extra_doc_files="BUGS ChangeLog* CONFORMANCE NEWS README"

use_build_dir=y

ssp=no-stack-protector

extra_configure_args="--without-selinux
                        --without-gd
                        --enable-kernel=2.6.32
                        --enable-bind-now
                        --disable-profile"

make_options="LINGUAS="

install_options="install_root=$preinstalltree/$name/${name}-$version $make_options"
install_target=install

extra_pkgs=min

min_pkg_files="etc/ld.so.conf
		lib/ld-linux.so.2
		lib/ld-${version}.so
		lib/libc-${version}.so
		lib/libc.so.6
		lib/libcrypt-${version}.so
		lib/libcrypt.so.1
		usr/lib/libcrypt.so
		lib/libm-${version}.so
		lib/libm.so.6
		usr/lib/libm.so
		lib/libdl-${version}.so
		lib/libdl.so.2
		usr/lib/libdl.so
		lib/libnss_files-${version}.so
		lib/libnss_files.so.2
		usr/lib/libnss_files.so
		lib/libnss_dns-${version}.so
		lib/libnss_dns.so.2
		usr/lib/libnss_dns.so
		lib/libresolv-${version}.so
		lib/libresolv.so.2
		usr/lib/libresolv.so
		lib/libpthread-${version}.so
		lib/libpthread.so.0
		usr/lib/libpthread.so"

min_priority=required
min_section=base
min_description="Minimal required glibc libraries"

base_pkg_excludes="usr/lib/gconv
		usr/share/i18n
		usr/share/locale
		usr/bin usr/sbin
		$min_pkg_files"

lib_pkg_excludes="$min_pkg_files"

preinstall_hook() {
    install -d -m 0755 "$preinstalldir/etc"
    touch "$preinstalldir/etc/ld.so.conf"
    install -d -m 0755 "$preinstalldir/usr/include/rpc"
    install -d -m 0755 "$preinstalldir/usr/include/rpcsvc"
    cp "$src"/sunrpc/rpc/*.h "$preinstalldir/usr/include/rpc"
    cp "$src"/nis/rpcsvc/*.h "$preinstalldir/usr/include/rpcsvc"
    strip "$preinstalldir/sbin/sln"
    strip "$preinstalldir/sbin/ldconfig"
    ls -1 "$preinstalldir"/lib/*.so \
	| egrep -v '^(ld|libc|libpthread|libthread_db)-' \
	| xargs strip --strip-unneeded
    # lazy heuristic, but anything more than 4K and less than 8K will
    # take up 8K based on block sizes
    find "$preinstalldir/usr/bin" -size +8k | strip || true
    find "$preinstalldir/usr/lib" -type f -a -name '*.so' -a -size +1k \
	| xargs strip --strip-unneeded
    strip --strip-unneeded "$preinstalldir/usr/libexec/pt_chown"
    strip "$preinstalldir"/usr/libexec/getconf/*
    strip "$preinstalldir"/usr/sbin/*
}

pkg_min_hook() {
    copy_from_spec etc/ld.so.conf
    copy_from_spec etc/nsswitch.conf
    register_conffile /etc/ld.so.conf
    register_conffile /etc/nsswitch.conf
}

pkg_base_hook() {
    chmod 4755 "$pkgcontentdir/usr/libexec/pt_chown"
    install -d -m 0755 "$pkgcontentdir/var/cache"
    install -d -m 0700 "$pkgcontentdir/var/cache/ldconfig"
    install -d -m 0755 "$pkgcontentdir/usr/bin"
    for F in usr/bin/getconf usr/bin/ldd usr/bin/lddlibc4 usr/bin/iconv
    do
	install -m 0755 "$preinstalldir/$F" "$pkgcontentdir/$F"
    done

    # portability hacks for running ldd with busybox ash shell
    sed -i -e '1s@.*@#!/bin/sh@' "$pkgcontentdir/usr/bin/ldd"
    # hack $" bashism for busybox ash shell
    sed -i -e 's/\$"/"/g' "$pkgcontentdir/usr/bin/ldd"
    chmod +x "$pkgcontentdir/usr/bin/ldd"

    copy_from_spec etc/services
    copy_from_spec etc/protocols
    register_conffile /etc/services
    register_conffile /etc/protocols
}
