#!/bin/sh
###############################################################################
# Script to create an Amazon EC2 image for Aloofix.
# Copyright (C) 2008-2010, 2013  Kevin Johnson <kjj@aloofschipperke.com>
#
# This file is part of Aloofix.
# Aloofix is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Aloofix is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
###############################################################################

die() { echo "$*" >&2; exit 1; }
status() { echo "$*"; }

set -e
set -u
PATH=/sbin:$PATH

case $# in
    4)
	tarball="$1"
	image_name="$2"
	image_blocks="$3"
	image_bs="$4"
	;;
    *)
	die "Usage: $0 \$tarball \$imagename \$qtyblocks \$blocksize"
	;;
esac

fs_label=ROOT
mkfs_opts="-j"
tune2fs_opts=

TMPDIR=/var/tmp
root_mnt="$TMPDIR/.tmproot-$$"

###############################################################################
[ -e "$tarball" ] || die "$tarball doesn't exist"
[ -f "$tarball" ] || die "$tarball isn't a file"
###############################################################################

status "creating a mounted loopback filesystem image"

dd if=/dev/zero of=$image_name bs=$image_bs count=$image_blocks
loopback_dev=`losetup -f`
losetup $loopback_dev $image_name
trap "losetup -d $loopback_dev; exit 1" EXIT

###############################################################################
# filesystems

mkfs.ext2 $mkfs_opts -F -q $image_name
tune2fs $tune2fs_opts -L $fs_label $image_name
mkdir $root_mnt
trap "rmdir $root_mnt; losetup -d $loopback_dev; exit 1" EXIT
mount $loopback_dev $root_mnt
trap "umount $root_mnt; rmdir $root_mnt; exit 1" EXIT

###############################################################################

status "copying filesystem tree to loopback image"

tar -x -C "$root_mnt" -f $tarball

###############################################################################

status "closing up shop"

umount $root_mnt
trap "rmdir $root_mnt; exit 1" EXIT
rmdir $root_mnt
trap - EXIT

exit 0
