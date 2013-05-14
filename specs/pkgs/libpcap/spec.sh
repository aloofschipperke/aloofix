# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=libpcap
version=1.4.0
sequence=1

description="Packet capture library"
site=http://www.tcpdump.org/release
depends="libnl-min"
builddepends="flex libnl-dev"
section=networking

license=BSD-3-Clause
license_files=LICENSE

extra_doc_files="CHANGES CREDITS README README.linux TODO"

extra_cflags="-I/usr/include/libnl3"

extra_dev_pkg_files=usr/bin/pcap-config

extra_configure_args="--enable-ipv6 --with-libnl"

install_target=install
