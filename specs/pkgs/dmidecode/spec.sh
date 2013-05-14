# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=dmidecode
version=2.11
sequence=1
site=http://download.savannah.gnu.org/releases/$name
description="Read information about system hardware via BIOS data"
depends=
builddepends=
section=admin
compression_suffix=bz2

license=GPLv2+
license_files=LICENSE

extra_doc_files="AUTHORS CHANGELOG README"

configure() { true; }

install_target=install

install_options="prefix=/usr"
