# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=tcpdump
version=4.4.0
sequence=1
description="Common-line packet analyzer"
site=http://www.tcpdump.org/release
depends="user-tcpdump libpcap-lib openssl-lib"
builddepends="libpcap-dev openssl-dev"
section=networking

license=BSD-3-Clause
license_files=LICENSE

extra_doc_files="CHANGES CREDITS README"

extra_configure_args="--enable-ipv6
	--with-user=tcpdump
	--with-chroot=/var/lib/tcpdump
	--disable-smb
	--with-crypto"

install_target=install

preinstall_hook() {
    rm "$preinstalldir/usr/sbin/tcpdump.$version"
    strip "$preinstalldir/usr/sbin/tcpdump"
    install -d -m 700 "$preinstalldir/var/lib/tcpdump"
}

pkg_base_hook() {
    register_postinst "chown tcpdump:tcpdump /var/lib/tcpdump"
}
