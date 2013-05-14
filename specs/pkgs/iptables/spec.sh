# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=iptables
version=1.4.18
sequence=1
site=ftp://ftp.netfilter.org/pub/$name
description="IPTables for ip filtering"
depends="linux-netfilter"
section=security
compression_suffix=bz2

license=GPLv2
license_files=COPYING

extra_doc_files=INCOMPATIBILITIES

pkg_base_hook() {
    # bin only contains an xml formatter for iptable rules
    rm -r "$pkgcontentdir/bin"
    copy_from_spec etc
}
