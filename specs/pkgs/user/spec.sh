# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=user
version=$distroversion
sequence=1
site=http://aloofschipperke.com/aloofix/
description="User accounts"
depends=base
section=users
license=GPLv3
arch=noarch

license_files=aloofix

urls=none

no_sigs

extra_pkgs=$(echo "$users" | cut -d' ' -f1)

retrieve() { true; }
unpack() { true; }
configure() { true; }
build() { true; }
preinstall() { true; }

build_user() {
    local user="$1"
    local uid="$2"
    local group="$3"
    local gid="$4"
    local shell="$5"
    shift 5

    eval "${user}_description=\"User account for $user\""
    if [ "$uid" = '-' ]
    then
	eval "pkg_${user}_hook() {
	empty_ok=yes
	register_preinst \"addgroup -g $gid $group\"
	register_postrm \"delgroup $group\"
}"
    else
	eval "pkg_${user}_hook() {
	empty_ok=yes
	register_preinst \"addgroup -g $gid $group\"
	register_preinst \"adduser -D -u $uid -G $group -g '$@' -s $shell $user\"
	register_postrm \"deluser $user\"
}"
    fi
}

for user in $extra_pkgs
do
    build_user $(user_info "$user")
done

###############################################################################
