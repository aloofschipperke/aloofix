# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=ec2-ami-tools
version=1.4.0.9
arch=noarch
sequence=1
compression_suffix=zip
tarfile=${name}-${version}.$compression_suffix
description="Utilities for creating, bundling, and uploading EC2 AMIs"
site=http://s3.amazonaws.com/ec2-downloads
depends="curl gzip openssl rsync ruby"
section=admin

license=Amazon
license_files="notice.txt license.txt"

extra_doc_files="readme-install.txt"

configure() { true; }
build() { true; }

preinstall() {
    mkdir -p "$preinstalldir"/usr/bin
    mkdir -p "$preinstalldir"/etc/ec2/amitools
    mkdir -p "$preinstalldir"/usr/lib
    cp -a bin/* "$preinstalldir"/usr/bin/
    cp -a etc/ec2/amitools/* "$preinstalldir"/etc/ec2/amitools/
    cp -a lib/* "$preinstalldir"/usr/lib/
    rm -f "$preinstalldir"lib/ec2/oem/LICENSE.txt
}

pkg_base_hook() {
    sed -i -e '1s@^#!/bin/bash@#!/bin/ash@' "$pkgcontentdir"/usr/bin/*
    sed -i -e 's@^home=.*@home=/usr@' "$pkgcontentdir"/usr/bin/*
}
