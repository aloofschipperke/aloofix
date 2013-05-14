# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

imagetype=tarball

extra_packages=aloofix-src

tarballname=aloofix-$distroversion

compression_suffix="xz"

localize() {
    install -d -m 755 "$fstree/aloofix-src-$distroversion"
    tar -c -z \
	-C "$preinstalltree/aloofix-src/aloofix-src-$distroversion/usr/src/aloofix-$distroversion" \
	-f - --exclude-vcs --exclude-backups . \
	| tar -x -z -C "$fstree/aloofix-src-$distroversion" -f -
}
