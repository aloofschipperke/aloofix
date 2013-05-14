# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=acpid
version=2.0.18
sequence=1
site=http://downloads.sourceforge.net/sourceforge/${name}2
description="ACPI Daemon"
provides=acpi
depends=
section=admin
compression_suffix=xz

license=GPLv2
license_files=COPYING

extra_doc_files="Changelog README TODO"

pkg_base_hook() {
    pkg_file_mv /usr/sbin/acpid /usr/sbin/acpid.hockin
    register_alternative /sbin/acpid ../usr/sbin/acpid.hockin 100
    copy_from_spec etc
}
