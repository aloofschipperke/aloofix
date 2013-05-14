#!/bin/sh
###############################################################################
# Convenience functions for opkg {pre,post}{inst,rm} scripts.
# Copyright (C) 2009, 2010  Kevin Johnson <aloof.schipperke@gmail.com>
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

register_libraries() {
    [ ! -x /sbin/ldconfig ] || /sbin/ldconfig
}

register_modules() {
    [ ! -x /sbin/depmod ] || /sbin/depmod
}

restart_init_service() {
    [ -x "/etc/init.d/S*.$1" ] || return 0
    echo Restarting $1
    /etc/init.d/$1 restart
}

stop_init_service() {
    [ -x /etc/init.d/$1 ] || return 0
    /etc/init.d/$1 status >/dev/null 2>&1 || return 0
    echo Stopping $1
    /etc/init.d/$1 stop
}

restart_sv_service() {
    [ -x "/var/service/$1/run" ] || return 0
    sv up $1
}

stop_sv_service() {
    [ -x "/var/service/$1/run" ] || return 0
    sv -w 196 force-stop $1
    sv exit $1
    [ -L /var/service/$1 ] && rm -f /var/service/$1
    [ ! -x /var/service/$1/run ] || touch /var/service/$1/down
}

check_fs_option() {
    /usr/bin/awk "\$2 == \"$1\" {print \$2, \$4, \"\"}" /proc/mounts \
	| grep -q "[ ,]$2[ ,]"
}

is_mounted() {
    /usr/bin/awk "\$2 == \"$1\" {print \$2}" /proc/mounts | grep -q "$1"
}

needs_rw_boot() {
    if is_mounted /boot && ! check_fs_option /boot rw
    then
	echo "package requires read-write /boot filesystem" >&2
	return 1
    fi
    return 0
}

add_texinfo() {
    [ ! -x /usr/bin/install-info -a -d /usr/share/info ] \
	|| /usr/bin/install-info /usr/share/info/$1 /usr/share/info/dir
}

remove_texinfo() {
    [ ! -x /usr/bin/install-info -a -d /usr/share/info ] \
	|| /usr/bin/install-info --delete /usr/share/info/$1 /usr/share/info/dir
}

add_manpages() {
    [ ! -x /usr/bin/mandb ] || /usr/bin/mandb --quiet
}

remove_manpages() {
    # workaround to avoid 'badly formed configuration directive' error
    [ ! -x /usr/bin/mandb ] || /usr/bin/mandb --quiet --no-straycats
    [ ! -x /usr/bin/mandb ] || /usr/bin/mandb --quiet
}

initialize_texinfo() {
    [ -d /usr/share/info ] || mkdir /usr/share/info
    ls -1 /usr/share/info | egrep -v -e '-[0-9]+$' -e dir \
	| while read INFOFILE; do
	install-info /usr/share/info/$INFOFILE /usr/share/info/dir
    done
}
