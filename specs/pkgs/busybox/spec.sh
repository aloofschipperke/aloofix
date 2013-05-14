# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=busybox
version=1.21.0
sequence=1
patchlist="mdev platform xz"

site=http://busybox.net/downloads
description="Busybox system commands"
depends=glibc-min
section=core
priority=standard
compression_suffix=bz2
patch_site=$site/fixes-$version

license="GPLv2"
license_files="LICENSE archival/libarchive/bz/LICENSE"

extra_doc_files="AUTHORS README TODO
		 docs/contributing.txt docs/mdev.txt
		 docs/posix_conformance.txt docs/logging_and_backgrounding.txt
		 docs/ifupdown_design.txt"

use_build_dir=yes

make_options="quiet= ARCH=$arch"

bin_alts="gunzip gzip sh tar vi zcat"
sbin_alts="acpid ip man"
usrbin_alts="awk bzcat bzip2 bzunip2 clear cmp dc diff find last less reset wget xargs"
usrsbin_alts="brctl crond sendmail"

tarfile=${name}-${version}.tar.bz2
urls="$site/$tarfile"
for P in $patchlist
do
    urls="$urls $patch_site/${name}-${version}-$P.patch"
done

apply_patches() {
    for P in $patchlist
    do
	patch -p1 -d "$src" -i "$tarballdir/$1/${name}-${version}-$P.patch"
    done
}

configure() {
    # for busybox-suid
    recreate_dir "${src}-suid"
    cd "${src}-suid"
    make quiet= KBUILD_SRC="$src" -f "$src/Makefile" allnoconfig
    cp .config .config.allnoconfig
    patch -i "$specdir/config-suid.patch" || return 1

    # for non-suid busybox
    cd "$build_dir"
    make quiet= KBUILD_SRC="$src" -f "$src/Makefile" defconfig
    cp .config .config.defconfig
    patch -i "$specdir/config-nonsuid.patch" || return 1
    # make clean
}

build() {
    cd "${src}-suid"
    make -j $make_j_qty $make_options $make_targets
    cd "$build_dir"
    make -j $make_j_qty $make_options $make_targets
}

preinstall() {
    local symlink

    cd "${src}-suid"
    make CONFIG_PREFIX="$preinstalldir" $make_options install
    cd "$preinstalldir"
    mv bin/busybox bin/busybox-suid
    find . -type l | while read F
    do
	echo $F
	symlink=$(readlink $F)
	ln -f -s ${symlink/busybox/busybox-suid} $F
    done
    cd "$build_dir"
    make CONFIG_PREFIX="$preinstalldir" $make_options install
    install -d -m 0755 "$preinstalldir/usr/share/man/man1"
    install -m 0644 "docs/busybox.1" \
        "$preinstalldir/usr/share/man/man1/busybox.1"
}

pkg_base_hook() {
    for F in	acpid.conf acpi.map adjtime busybox.conf fstab group gshadow \
		hosts inittab man.conf mdev.conf motd passwd profile shadow \
		shells sysctl.conf
    do
	copy_from_spec etc/$F
	register_conffile /etc/$F
    done
    touch "$pkgcontentdir/etc/inetd.conf"
    register_conffile /etc/inetd.conf

    chmod 4755 "$pkgcontentdir/bin/busybox-suid"
    chmod 0400 "$pkgcontentdir/etc/busybox.conf"
    chmod 0600 "$pkgcontentdir/etc/shadow"
    chmod 0600 "$pkgcontentdir/etc/gshadow"

    install -d -m 0755 "$pkgcontentdir/etc/profile.d"
    install -d -m 0700 "$pkgcontentdir/root"
    install -d -m 1777 "$pkgcontentdir/tmp"
    install -d -m 1777 "$pkgcontentdir/var/tmp"
    for D in	home proc sys srv \
		mnt/cdrom var/lock var/lock/subsys \
		var/log var/run var/spool/cron/crontabs
    do
        install -d -m 0755 "$pkgcontentdir/$D"
    done
    copy_from_spec etc/acpi
    copy_from_spec etc/ifplugd
    copy_from_spec etc/init.d
    copy_from_spec etc/sv
    copy_from_spec sbin/shutdown
    copy_from_spec sbin/svadmin
    copy_from_spec usr/share/udhcpc/default.script
    ln -s ../etc/sv/default "$pkgcontentdir/var/service"

    copy_from_spec usr/sbin/run-crons
    copy_from_spec var/spool/cron
    register_conffile /var/spool/cron/crontabs/root

    register_alternative /usr/bin/crontab ../../bin/busybox-suid 10

    for F in $bin_alts
    do
	rm "$pkgcontentdir/bin/$F"
	register_alternative /bin/$F busybox 10
    done
    for F in $sbin_alts
    do
	rm "$pkgcontentdir/sbin/$F"
	register_alternative /sbin/$F ../bin/busybox 10
    done
    for F in $usrbin_alts
    do
	rm "$pkgcontentdir/usr/bin/$F"
	register_alternative /usr/bin/$F ../../bin/busybox 10
    done
    for F in $usrsbin_alts
    do
	rm "$pkgcontentdir/usr/sbin/$F"
	register_alternative /usr/sbin/$F ../../bin/busybox 10
    done
}

###############################################################################
