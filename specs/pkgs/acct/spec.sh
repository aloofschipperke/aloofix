# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=acct
version=6.6.1
sequence=1
license=
site=http://ftp.gnu.org/gnu/$name
description="GNU System Accounting Utilities"
depends=
section=admin

license=GPLv3+
license_files=COPYING

extra_doc_files="AUTHORS ChangeLog NEWS README TODO"

extra_configure_args="--enable-linux-multiformat MAKEINFO=true"

pkg_base_hook() {
    pkg_file_mv /usr/bin/last /usr/bin/last.acct
    register_alternative /usr/bin/last last.acct 100
    copy_from_spec etc
}
