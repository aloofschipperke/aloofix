# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=linux
majversion=3.9
minversion=4
# mild gymnastics to handle (e.g.) 3.9 as 3.9.0 without breaking it for 3.9.1
version=${majversion}.$minversion
modversion=${majversion}.$minversion
if [ "$minversion" = 0 ]
then
    version=$majversion
    modversion=${majversion}.$minversion
fi
sequence=3
site=ftp://ftp.kernel.org/pub/$name/kernel/v3.x
description="Linux kernel"
builddepends="bash perl bc"
section=kernel
compression_suffix=xz

strip_kernel_modules=1

license=GPLv2
license_files="COPYING"

extra_doc_files="CREDITS MAINTAINERS README REPORTING-BUGS"

use_build_dir=y

# NOTE: don't forget to update $modules_depends and $modules_pkg_excludes
extra_pkgs="firmware netbridge netfilter md crypto modules acpi"

base_pkg_files="boot/vmlinuz boot/System.map"

modules_pkg_files=lib/modules
modules_description="Kernel modules"
modules_depends="linux-firmware linux-netbridge linux-netfilter linux-md linux-crypto linux-acpi"

acpi_pkg_files="lib/modules/${modversion}/kernel/drivers/acpi"
acpi_description="ACPI Drivers"

firmware_pkg_files=lib/firmware
firmware_description="Firmware"

md_pkg_files="lib/modules/${modversion}/kernel/drivers/md
		lib/modules/${modversion}/kernel/lib/raid6"
md_description="MD modules"

netbridge_pkg_files="lib/modules/${modversion}/kernel/net/802
		lib/modules/${modversion}/kernel/net/8021q
		lib/modules/${modversion}/kernel/net/llc
		lib/modules/${modversion}/kernel/net/bridge
		lib/modules/${modversion}/kernel/drivers/net/tun.ko"
netbridge_description="Netbridge modules"

netfilter_pkg_files="lib/modules/${modversion}/kernel/lib
		lib/modules/${modversion}/kernel/net/ipv4/netfilter
		lib/modules/${modversion}/kernel/net/ipv6/netfilter
		lib/modules/${modversion}/kernel/net/netfilter"
netfilter_pkg_excludes="$md_pkg_files"
netfilter_description="Netfilter modules"

crypto_pkg_files="lib/modules/${modversion}/kernel/crypto"
crypto_description="Crypto kernel modules"

modules_pkg_excludes="$netbridge_pkg_files $netfilter_pkg_files
			$md_pkg_files $crypto_pkg_files $acpi_pkg_files"

configure() {
    [ -f "$specdir/config.$version" ] \
	|| die "can't find config for linux $version"
    make -C "$src" O="$build_dir" quiet= mrproper
    make -C "$src" O="$build_dir" quiet= allnoconfig
    mv "$build_dir/.config" "$build_dir/.config.allno"
    install -m 0644 \
	"$specdir/config.$version" "$build_dir/.config.aloofix"
    [ ! -f "$specdir/config.addenda" ] \
	|| cat "$specdir/config.addenda" >>"$build_dir/.config.aloofix"
    make -C "$src" O="$build_dir" quiet= \
	KCONFIG_ALLCONFIG="$build_dir/.config.aloofix" allnoconfig
    [ ! -f "$specdir/local.config.patch" ] \
	|| patch -d "$build_dir" -i "$specdir/local.config.patch"
}

build() {
    make -j $make_j_qty -C "$src" O="$build_dir" quiet= bzImage modules
}

preinstall() {
    make -C "$src" O="$build_dir" quiet= headers_check
    make -C "$src" O="$build_dir" quiet= \
	INSTALL_HDR_PATH="$preinstalldir/usr" headers_install
    install -d -m 0755 "$preinstalldir/boot"
    install -m 0644 "$build_dir/arch/i386/boot/bzImage" \
	"$preinstalldir/boot/vmlinuz"
    install -m 0644 "$build_dir/System.map" "$preinstalldir/boot/System.map"
    make -C "$src" O="$build_dir" quiet= \
	INSTALL_MOD_STRIP=$strip_kernel_modules \
	INSTALL_MOD_PATH="$preinstalldir" \
	cmd_depmod= \
	modules_install
    rm "$preinstalldir/lib/modules/$modversion/build"
    rm "$preinstalldir/lib/modules/$modversion/source"
    find "$preinstalldir/usr/include" \
	-name ..install.cmd -o -name .install \
	| xargs rm
}

pkg_base_hook() {
    pkg_file_mv /boot/System.map /boot/System.map-$modversion
    install -d -m 755 "$pkgcontentdir/lib/modules/$modversion"
}
