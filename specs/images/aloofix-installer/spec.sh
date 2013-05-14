# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

include aloofix-min

appid="Aloofix Installation CD"

directories="$directories
755 /pkgs
"

packages="$packages install2hd"

pkgset_list=
default_pkgsets=base

add_pkgset() {
    local pkgsetname="$1"
    shift

    pkgset_list="$pkgset_list $pkgsetname"
    eval "${pkgsetname}_pkgs=\"$@\""
    eval "extra_packages=\"$extra_packages \$${pkgsetname}_pkgs\""
}

add_pkgset base \
    base-license base \
    syslinux-license syslinux \
    linux-license linux \
    glibc-license glibc-min glibc-lib glibc \
    tzdata-license tzdata-min \
    busybox-license busybox \
    opkg-license opkg-lib opkg \
    e2fsprogs-license e2fsprogs-lib e2fsprogs \
    zlib-license zlib-lib \
    dropbear-license dropbear

# we don't need to add initramfs, mdadm, or lvm2 on non-Aloofix instances
if [ -f /etc/aloofix-release ]
then
    add_pkgset initramfs \
	mkinitramfs-license mkinitramfs
    add_pkgset mdadm \
	linux-md linux-crypto mdadm-license mdadm-min mdadm
    add_pkgset lvm \
	lvm2-license lvm2-devmapper lvm2-lib lvm2
fi

###############################################################################

for pkgset in $pkgset_list
do
    extra_packages="$extra_packages $(eval echo \$${pkgset}_pkgs)"
done

copy_packagelist() {
    local list="$1"
    local pkgname
    shift
    echo "    $list"
    for F in $*
    do
	pkgname=$(ls -1 "${F}"_*_${arch}.opk "${F}"_*_noarch.opk 2>/dev/null | cat)
	[ "$pkgname" ] || die "can't find opk file for $F"
	install -m 644 "$pkgname" "$fstree/pkgs"
	echo "$pkgname" >>"$fstree/pkgs/${list}.list"
    done
}

localize() {
    cd "$pkgstree"
    for pkgset in $pkgset_list
    do
	copy_packagelist $pkgset $(eval echo \$${pkgset}_pkgs)
    done
    echo "$default_pkgsets" >"$fstree/pkgs/default.pkgsets"
}

###############################################################################
