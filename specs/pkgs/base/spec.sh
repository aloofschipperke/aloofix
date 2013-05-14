# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=base
version=$distroversion
sequence=1
site=http://aloofschipperke.com/aloofix/
description="Base directories and files"
section=core
priority=required
arch=noarch

license=GPLv3
license_files=aloofix

urls=none

no_sigs

retrieve() { true; }
unpack() { true; }
configure() { true; }
build() { true; }

directories="
    bin
    boot
    dev
    etc/profile.d
    etc/sysctl.d
    home
    lib
    mnt/cdrom
    proc
    root
    run
    sbin
    srv
    sys
    tmp
    usr/bin
    usr/lib
    usr/sbin
    var/lock/subsys
    var/log
    var/run
    var/spool/cron/crontabs
    var/tmp
"

preinstall() {
    for D in $directories
    do
	install -d -m 755 "$preinstalldir/$D"
    done
    for D in tmp var/tmp
    do
	chmod 1777 "$preinstalldir/$D"
    done
    chmod 700 "$preinstalldir/root"
    ln -s ../proc/mounts "$preinstalldir/etc/mtab"
}

pkg_base_hook() {
    mknod -m 600 "$pkgcontentdir/dev/console" c 5 1
    mknod -m 666 "$pkgcontentdir/dev/null" c 1 3
    mknod -m 666 "$pkgcontentdir/dev/zero" c 1 5
    mknod -m 666 "$pkgcontentdir/dev/urandom" c 1 9
    echo "$distroname $version $sequence $(hostname) $distroversionname" \
	>"$pkgcontentdir/etc/aloofix-release"
}

###############################################################################
