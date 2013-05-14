# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=ca-certificates
version=20130119
sequence=1
site=ftp://ftp.debian.org/debian/pool/main/c/$name
tarfile="${name}_${version}.tar.gz"
description="Common CA certificates"
depends=openssl
builddepends=python2
section=security

license="GPLv2 MPL-2.0"
license_files="debian/copyright"

extra_doc_files="debian/NEWS debian/README.Debian debian/changelog"

install_target=install

configure() { true; }

preinstall() {
    install -d -m 0755 "$preinstalldir"/etc/ca-certificates/update.d
    install -d -m 0755 "$preinstalldir"/usr/sbin
    install -d -m 0755 "$preinstalldir"/usr/share/ca-certificates
    make DESTDIR="$preinstalldir" install
    install -d -m 0755 "$preinstalldir"/etc/ssl/certs
    install -d -m 0755 "$preinstalldir"/usr/share/man/man8
    install -m 0644 sbin/update-ca-certificates.8 \
        "$preinstalldir"/usr/share/man/man8
    (cd "$preinstalldir"/usr/share/ca-certificates; find . -name '*.crt') \
        | sort | sed -e 's/^..//' \
        >"$preinstalldir"/etc/ca-certificates.conf
}

pkg_base_hook() {
    register_conffile /etc/ca-certificates.conf
    register_postinst /usr/sbin/update-ca-certificates
}
