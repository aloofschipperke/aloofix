# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=aloofix-src
version=$distroversion
sequence=1
site=http://aloofschipperke.com/aloofix/
description="Source code for Aloofix"
depends="user-build user-web make patch binutils gcc tar fakeroot"
section=devel
arch=noarch
license=GPLv3
license_files=aloofix

pkgfiles="BUGS INSTALL COPYING NEWS README TODO.txt \
	  config.sh docs scripts specs"

urls=none

extra_doc_files=

no_sigs

retrieve() { true; }
unpack() { true; }
configure() { true; }
build() { true; }

preinstall() {
    local srcdir="$preinstalldir/usr/src/aloofix-$version"

    for D in build images pkgs
    do
	install -d -m 0755 "$srcdir/$D"
    done
    touch "$srcdir/pkgs/Packages"

    cd "$top"
    tar -c -z -f - \
	--exclude-vcs --exclude-backups \
	$pkgfiles \
	| (cd "$preinstalldir/usr/src/aloofix-$version"; tar -x -z -f -)
}

pkg_base_hook() {
    local usrsrcaloofix="usr/src/aloofix-$version"
    local opkgconf=/etc/opkg/opkg.conf
    read user uid group gid shell gcos <<EOF
$(user_info build)
EOF
    chown -R "$uid:$gid" "$pkgcontentdir/$usrsrcaloofix"
    register_postinst \
	"sed -r -i -e '/src[[:space:]]+build[[:space:]]+/d' $opkgconf"
    register_postinst \
	"echo 'src build file:///$usrsrcaloofix/pkgs' >>$opkgconf"
    register_prerm \
	"sed -r -i -e '/src[[:space:]]+build[[:space:]]+/d' $opkgconf"
    register_conffile /usr/src/aloofix-$version/pkgs/Packages
}
