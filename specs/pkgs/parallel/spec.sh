# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=parallel
version=20130522
sequence=1
arch=noarch
description="A shell tool for executing jobs in parallel"
compression_suffix=bz2
site=http://ftp.gnu.org/gnu/$name
depends=perl
builddepends=perl
section=misc

license=GPLv3+
license_files=COPYING

extra_doc_files="NEWS README"

configure_hook() {
    sed -ibak -e 's/^=item \([0-9]\+\) *$/=item B<\1>/' src/parallel.pod
}
