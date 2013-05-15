# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=syslinux
version=5.01
sequence=1
site=ftp://ftp.kernel.org/pub/linux/utils/boot/$name
description="Boot loader"
builddepends="perl e2fsprogs-dev"
section=core
priority=standard
conflicts=syslinux-iso
compression_suffix=bz2

license="GPLv2 CC-by-sa-3.0 custom"
license_files="COPYING */COPYING */*/LICENSE */*/*/LICENSE"

extra_doc_files="NEWS doc/*.txt"

tarfile="${name}-${version}.tar.bz2"
urls="$site/$tarfile http://pciids.sourceforge.net/v2.2/pci.ids"
sigsblacklist=pci.ids

extra_pkgs=iso

# we use the stock binaries
configure() { true; }
build() { true; }

base_pkg_files=sbin
extra_dev_pkg_files=usr/share/syslinux/com32

preinstall() {
    make INSTALLROOT="$preinstalldir" \
        MANDIR=/usr/share/man \
        install-all
}

pkg_base_hook() {
    copy_from_spec boot/extlinux
    register_conffile /boot/extlinux/extlinux.conf
}

###############################################################################

# The syslinux-iso package is a special package used when creating an
# ISO image. It's normally installed on a regular HD installation.

iso_priority=optional
iso_section=admin
iso_description="ISOLinux installation in /boot directory"
iso_conflicts=syslinux

pkg_iso_hook() {
    install -d -m 755 "$pkgcontentdir/boot/isolinux"
    for F in chain.c32 hdt.c32 isolinux-debug.bin ldlinux.c32 libcom32.c32 \
	libgpl.c32 libmenu.c32 libutil.c32 mbr.bin menu.c32
    do
	cp -p "$preinstalldir/usr/share/syslinux/$F" \
	    "$pkgcontentdir/boot/isolinux/$F"
    done
    pkg_file_mv /boot/isolinux/isolinux-debug.bin /boot/isolinux/isolinux.bin
    copy_from_spec boot/isolinux
    register_conffile /boot/isolinux/isolinux.conf
    cp "$tarballdir/$pkg/pci.ids" "$pkgcontentdir/boot/isolinux"
}

###############################################################################
