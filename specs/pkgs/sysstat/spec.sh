# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=sysstat
version=10.1.6
sequence=1
site=http://pagesperso-orange.fr/sebastien.godard
description="System Activity Reporting tools"
depends=
section=admin
# xz version is failing extract for some reason
compression_suffix=bz2
patchlist=archive-member

license=GPLv2+
license_files=COPYING

extra_doc_files="CHANGES CREDITS FAQ README"

extra_configure_args="--disable-nls --disable-man-group"
install_options="IGNORE_MAN_GROUP=y"
install_target=install

pkg_base_hook() {
    copy_from_spec etc
    register_conffile /etc/sysconfig/sysstat
    register_conffile /etc/sysconfig/sysstat.ioconf
}
